---
layout: post
title: Como modelar micro service?
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

O cliente atual possui um grande sistema monolítico e está construindo
microservices para substituir esse sistema. Portanto, recentemente houve a
necessidade de substituir um cliente jar que se comunica com um sistema de
promoções, conforme pode ser visto na Figura 1.

Basicamente o cliente jar expõe uma interface de comunicação, transforma os dados
para um XML no qual envia para o sistema de promoção, recebendo e convertendo a
resposta para um conjunto de objetos.

Então, o cliente solicitou substituir o jar por um microserviço, que iria fazer
a mesma coisa, só que ao invés de expor uma API java iria expor uma interface
JSON.

Com isso, começamos a entender o jar e a transcrever para microserviços que são
construídos em stack de tecnologia.

##### O que faz um bom microserviço?

Depois de um tempo, começamos a nos perguntar se o que estávamos fazendo tinha
algum sentido e a nos questionar o que faz um microserviço ser bom.

Depois de algumas leituras e pesquisas no estado da arte, encontramos uma boa
definição do livro de Sam Newman (Building Microservices). Ele define duas
propriedades essenciais: fraco acoplamento e alta coesão.

Quem é do mundo Orientado a Objeto conhece bem esses termos e sabe que eles são
essenciais para a construção de um bom design OO. Apenas para refrescar nossa
memória:

Acoplamento(coupling) é o grau de conhecimento que um componente tem do outro.
Portanto, baixo acoplamento (loose coupling) significa reduzir as dependências
de um componente em relação a outro.

Coesão é o grau no qual os elementos de um certo componente trabalham juntos
para alcançar um objetivo. Portanto, alta coesão (high cohesion) os elementos de
um módulo estão intimamente ligados entre si e estão ligados por um objetivo
comum.

Para diferenciar os conceitos, eu diria que acomplamento é uma medida "inter"
componentes, e coesão é uma medida "intra" componentes.

Voltando para o mundo do microserviço...

Quando um microserviço possui baixo acoplamento, uma mudança nele não deve afetar
a mudança em outros serviços. Um conjunto de microserviços fracamente acoplados
sabe muito pouco um sobre o outro.

Em microserviços alta coesão é necessária porque queremos ter os comportamentos
relacionados juntos, pois traz a grande vantagem de ter apenas um único ponto
de mudança. Contudo, ter um microserviço coeso significa encontrar as fronteiras
dentro do domínio de negócio que assegure termos os comportamentos relacionados
em apenas um lugar e que a comunicação com outros limites seja a menor possível.

No nosso serviço de promoções, apesar de termos um baixo acoplamento, pois ele
tem como dependência apenas um outro sistema externo, ele não tinha alta coesão,
pois muita lógica relacionada ao domínio de promoções não estava implementada
dentro do microserviço e sim do monolito, resultando em um serviço anêmico que
trouxe poucos benefícios para o cliente.

##### Descobrindo as fronteiras

Ao meu ver conseguir um baixo acoplamento é mais simples do que conseguir uma alta
coesão, e o motivo é porque definir as fronteiras de um serviço sempre é algo
complicado de se fazer.

A ideia é de que um domínio consiste de vários contextos, por exemplo, para o
domínio de e-commerce temos o contexto de promoção, checkout de um produto,
criação de uma ordem e por aí vai. Então, a ideia é que cada domínio consiste de
vários contextos e dentro de cada contexto temos partes que não precisam se
comunicar com o mundo externo assim como tem partes que precisam. Logo, cada
fronteira deve ter uma interface explícita, onde decide quais modelos expor.

Caso esteja transformando um monolito em microserviços um bom ponto inicial seria
identificar os módulos que o compõe e verificar o grau de exposição desses módulos.
Com isso, cada módulo geraria um micro serviço.

É claro que ter uma base de código e transformá-la para microserviços é mais
fácil do que iniciar tudo do zero. Contudo, tenha cuidado pois a transformação
de um sistema em microserviços é cara, e pode dar muito errada, especialmente se
você é novo no domínio.

Uma outra estratégia seria pensar no contexto a partir dos dados existentes na
organização. Contudo, acredito que pensar sobre a capacidade que esses dados
prover ao domínio seja mais eficiente. Porque pode correr o risco de fazer
serviços anêmicos ou baseados em CRUD, como foi o caso do nosso serviço de
promoção.

Logo, a melhor estratégia ao iniciar com microserviços é conhecer bem o domínio
do cliente.
