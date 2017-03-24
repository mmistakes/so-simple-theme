---
layout: post
title: Como testar Singletons?
excerpt: "Há diversos tipos de dependência que tornam difíceis realizar testes
de unidade. Descubra nesse post como realizar testes de Singletons."
modified: 2017-03-23T22:49:00-00:00
categories: articles
tags: [unit test, software design, singlenton]
image:
  feature: so-simple-sample-image-1.jpg
  credit: WeGraphics
  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
---

Há diversos tipos de dependência que tornam difíceis criar e usar frameworks de
testes, uma delas é quando envolve variáveis globais, que em Java podem ser
desenvolvidas através do design pattern ([Singleton]
(http://en.wikipedia.org/wiki/Singleton_pattern)), como no exemplo abaixo:

```java
public class Switches {
   private static Switches instance = null;

   private Switches() {
      if (switchState == null || switchState.isEmpty()) {
         loadAllFeatureStates();
      }
   }

   public static Switches getInstance() {
      if (instance == null) {
         instance = new Switches();
      }
      return instance;
   }

   public boolean getFeatureState(final String featureName) {
      ...
   }

}
```

O método **getInstance** de **Swithces** é um método estático cujo objetivo é retornar
apenas uma instância da classe Switches em toda a aplicação.

Em Java, o design pattern Singleton é um dos mecanismos usados para fazer
variáveis globais, o que geralmente, são uma péssima ideia por várias razões.
Uma delas é a obscuridade. Quando vemos um trecho de código é bom saber qual é
o efeito daquele código, quais as classes e variáveis são afetadas por
alterações daquele código. Ter essa visão com variáveis globais pode ser difícil.

Como sabemos o objetivo de um Singleton é tornar impossível a criação de mais de
uma instância do objeto para toda a aplicação, o que não há problemas para o
código de produção, porém, quando estivermos escrevendo testes de unidade, onde
cada suite de teste deve ser uma mini-aplicação, isolada totalmente de outros
testes, isso se torna um problema.

Como uma solução rápida, podemos criar um método estático responsável por
alterar a instância da classe **Switches** apenas para testes, conforme código
abaixo:

```java
public class Switches {
   private static Switches instance = null;

   private Switches() {
      if (switchState == null || switchState.isEmpty()) {
         loadAllFeatureStates();
      }
   }

   public static Switches getInstance() {
      if (instance == null) {
         instance = new Switches();
      }
      return instance;
   }

   public boolean getFeatureState(final String featureName) {
      ...
   }

   public static void setInstanceForTest(Switches switches){
      instance = switches;
   }

}
```

Isto não irá funcionar, é claro. Devido ao fato que o singletons possuem
construtores privados. Nesse momento, temos um conflito entre dois objetivos: um
é ter apenas uma instância de **Switches** em toda a aplicação e o outro é querermos
um sistema no qual todas as classes sejam testáveis de forma independente.

O que poderia ser feito é relaxar a propriedade singleton e alterar o escopo do
construtor para **public** ou **protected**. Porém, isso realmente depende da
lógica por trás da necessidade de criar um singleton. Se realmente for
necessário ter uma classe com instância única, poderíamos fazer da seguinte
forma:

```java
public class SwitchesTest extends Switches {
   private Map<String, Object> switches = new HashMap<String, Object>();

   public boolean getFeatureState(final String featureName) {
      return switches.get(featureName);
   }

}
```

Quando fazemos isso podemos preservar parte da propriedade singleton, pois
usamos uma subclasse de Switches. O que irá prevenir a criação de mais de uma
instância **Swtiches**, apesar de permitir criar subclasses.

Em muitos casos, criar uma subclasse e sobrescrever um método pode ser
suficiente. Outras vezes, as dependências no Singleton são tantas que é
necessário outras técnicas como por exemplo a criação de interfaces, na qual
será composta por todos os métodos públicos não-estáticos.

```java
public interface ISwitches {
   public boolean getFeatureState(final String featureName);
   ...
}
```

Em seguida, faz-se o singleton implementar a interface:

```java
public class Switches implements ISwitches {
   private static ISwitches instance = null;

   private Switches() {
      if (switchState == null || switchState.isEmpty()) {
         loadAllFeatureStates();
      }
   }

   public static ISwitches getInstance() {
      if (instance == null) {
         instance = new Switches();
      }
      return instance;
   }

   public boolean getFeatureState(final String featureName) {
      ...
   }

}
```

Logo, ao realizar testes pode-se simplesmente criar classes que implementem a
interface **ISwitches** e injetá-las nas classes que utilizam o singleton
original.
