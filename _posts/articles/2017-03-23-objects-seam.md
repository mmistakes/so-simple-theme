---
layout: post
title: Objetos Seam - O que são, por que usá-los e quando?
excerpt: "Quando se trabalha com código legado e tenta escrever testes de
unidades para uma classe repeta de dependências os objetos seam podem ajudá-los
nessa jornada. Venha conhecer nesse artigo o que são, como e quando usar objetos
seam."
modified: 2017-03-23T22:49:21-50:00
categories: articles
tags: [unit test, software design, seam]
image:
  feature: so-simple-sample-image-1.jpg
  credit: WeGraphics
  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
---

Quando se trabalha com código legado e tenta escrever testes de unidade para uma
classe repleta de dependências, percebe-se a dificuldade e o quão bom o código
está ou não.

Vamos olhar um exemplo:

```java
public class InternationalOrder {
  public boolean save() throws Exception {
    if (!Switches.isInternationalOrderFeaturedOn()) {
      return false;
    }
    if (formData.isInternationalOrder()) {
      ...
    }
  }
}
```

Como poderíamos escrever testes de unidade sem utilizar frameworks de mocks
estáticos?

Para responder a essa questão, poderíamos utilizar o conceito de Seam, mais
especificamente **Objetos Seam**.

>Seam é um lugar onde se pode mudar o comportamento em seu programa, sem alterar
aquele lugar. ([Working Effectively with Legacy Code](http://working%20effectively%20with%20legacy%20code/)).

Logo, podemos considerar a chamada **Switches.isInternationalOrderFeaturedOn**
como Seam? A resposta é sim porque podemos mudar o seu comportamento sem alterar
essa linha de código.

Como exemplo, o que aconteceria se adicionarmos a mesma assinatura na classe
**SaveInternationalOrder**?

```java
public class InternationalOrder {
  protected boolean isInternationalOrderFeaturedOn() {
    return Switches.isInternationalFeaturedOn()
  }
}
```

Esta simples mudança preserva o comportamento, pois ela apenas delega a chamada
para uma outra função.

Se criarmos uma subclasse da classe **InternationOrder** e sobrescrevermos o
método **isIternationalOrderFeaturedOn()**?

```java
class InternationalOrderFeaturedTurnedOn extends InternationalOrder {
  protected boolean isInternationalOrderFeaturedOn() {
    return true;
  }
}
```

Agora ficou simples criar testes para o código sem efeitos colaterais
desagradáveis.

```java
public class InternationalOrderTest {

  @Test
  public void ﻿saveOrderWhenInternationFeaturedIsTurnedOn() {
    InternationalOrder saveOrder = new InternationalOrderFeaturedTurnedOn();
    assertTrue(saveOrder.save());
  }
}
```

Esta é uma possível aplicação para **Objetos Seams**, já que podemos mudar o
método que é chamado sem alterar o método que o chama.

Por que usar Seams ao invés de frameworks de testes de unidade com mocks
estáticos, tais como **PowerMockito**?

Um dos grandes desafios em trabalhar com código legado é a quebra de
dependências. Com sorte, as dependências podem ser pequenas e localizadas,
porém na maioria das vezes, elas são numerosas e espalhadas pelo código.
Objetos Seams nos ajudam a identificar essas dependências, melhorar o design do
código e aos poucos excluir dependências indesejadas.
