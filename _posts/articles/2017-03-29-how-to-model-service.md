---
layout: post
title: Como modelar microservice?
excerpt: "Recentemente tive a experiência de construir um microserviço. E
gostaria de falar como foi essa experiência, quais as lições aprendidas."
modified: 2017-03-22T22:49:00-00:00
categories: articles
tags: [microservices]
image:
  feature: so-simple-sample-image-1.jpg
  credit: WeGraphics
  creditlink: http://wegraphics.net/downloads/free-ultimate-blurred-background-pack/
comments: true
share: true
---

##### Contexto

O sistema atual no qual estou trabalhando consite de um monolítico para o
domínio de e-commerce e integrações com outros sistemas via bibliotecas. Como
pode ser visto na Figura 1, além da lógica de negócio que está na plataforma de
e-commerce, temos diversos clientes *jar* que tem o objetivo de realizarem a
comunicação com sistemas de terceiros, que por sua vez realizarão tarefas como
gerenciamento de promoções, criações de ordem, cálculos de taxas e entre outras.

<figure>
	<a href="{{ site.url }}/images/how-to-model-services/Figure01.jpg"><img src="{{ site.url }}/images/how-to-model-services/Figure01.jpg" alt="image"></a>
	<figcaption>
  Sistema monolítico de e-commerce.
  </figcaption>
</figure>

Recentemente, tivemos a solicitação do cliente de substituir o
promotion-client.jar por um microserviço. Esse jar, expõe uma interface de
comunicação, envia uma requisição para o sistema de promoções, converte a
resposta e passa os dados para a plataforma de e-commerce.


##### O que faz um bom microserviço?

Ao iniciar o desenvolvimento nos perguntamos se o que estávamos fazendo tinha
algum sentido, ou algum valor para o cliente. Além disso, surgiu perguntas tais
como:

>O que faz um microserviço ser bom?

Depois de algumas leituras e pesquisas no estado da arte, encontramos uma boa
definição no livro de ([Sam Newman - Building Microservices](https://www.amazon.com/Building-Microservices-Designing-Fine-Grained-Systems/dp/1491950358/ref=s9_simh_gw_g14_i5_r?_encoding=UTF8&fpl=fresh&pf_rd_m=ATVPDKIKX0DER&pf_rd_s=&pf_rd_r=67VPD6EW255AWZT0BMBQ&pf_rd_t=36701&pf_rd_p=a6aaf593-1ba4-4f4e-bdcc-0febe090b8ed&pf_rd_i=desktop)).
Ele define duas propriedades essenciais que bons microserviços devem ter: fraco
acoplamento e alta coesão.

Quem é do mundo de Orientação a Objeto conhece bem esses termos e sabe que eles
são essenciais para a construção de um bom design OO. Mas não custa nada
refrescar nossa memória:

> Acoplamento (coupling) é o grau de conhecimento que um componente tem do outro.
Portanto, baixo acoplamento (loose coupling) significa reduzir as dependências
de um componente em relação a outro.

> Coesão é o grau no qual os elementos de um certo componente trabalham juntos
para alcançar um objetivo. Portanto, alta coesão (high cohesion) os elementos de
um módulo estão intimamente ligados entre si e estão ligados por um objetivo
comum.

Diferenciando melhor os conceitos eu diria que acomplamento é uma medida "inter"
componentes, e coesão é uma medida "intra" componentes.

Voltando para o mundo do microserviço...

Quando um microserviço possui baixo acoplamento, uma mudança nele não deve afetar
a mudança em outros serviços. Já em microserviços com alta coesão é necessária porque
queremos ter os comportamentos relacionados juntos, pois traz a grande vantagem
de ter apenas um único ponto de mudança. Contudo, ter um microserviço coeso
significa encontrar as fronteiras dentro do domínio de negócio que assegura os
comportamentos relacionados em apenas um lugar e a comunicação com outros
domínios seja a menor possível.

No nosso serviço de promoções, apesar de termos um baixo acoplamento, pois ele
tem como dependência apenas um outro sistema externo (Sistema de gerenciamento
de promoções), ele não tinha alta coesão, pois muita lógica relacionada ao
domínio de promoções não estava implementada dentro do microserviço e sim da
plataforma de e-commerce, resultando em um serviço anêmico com poucos benefícios
para o cliente.

##### Descobrindo as fronteiras

Ao meu ver, conseguir um baixo acoplamento é mais simples do que conseguir uma
alta coesão, e o motivo é porque definir as fronteiras de um serviço sempre é
algo complicado de se fazer.

A ideia é que um domínio consiste de vários contextos, por exemplo, para o
domínio de e-commerce temos o contexto de promoção, checkout de um produto,
criação de uma ordem e por aí vai. E dentro de cada contexto temos módulos que
não precisam se comunicar com o mundo externo assim como partes que precisam.

Um bom ponto inicial para definir as fronteiras de um microserviço seria
identificar os módulos que o compõe e verificar o grau de exposição. A tendência
é que cada módulo transforme-se em um microserviço.

Uma outra estratégia seria pensar no contexto a partir dos dados existentes na
organização. Contudo, acredito que pensar sobre as funcionalidades que esses
dados abastecem seja mais eficiente.

Logo, a melhor estratégia ao iniciar com microserviços é conhecer bem o domínio
do cliente.
