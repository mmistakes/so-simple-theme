---
layout: post
title: O que são microserviços?
excerpt: "O que se entende por microserviço na literatura atual? Será que o que
temos em mente está correto."
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

De acordo com Sam Newman ([Building Microservices](https://www.amazon.com/Building-Microservices-Designing-Fine-Grained-Systems/dp/1491950358/ref=s9_simh_gw_g14_i5_r?_encoding=UTF8&fpl=fresh&pf_rd_m=ATVPDKIKX0DER&pf_rd_s=&pf_rd_r=67VPD6EW255AWZT0BMBQ&pf_rd_t=36701&pf_rd_p=a6aaf593-1ba4-4f4e-bdcc-0febe090b8ed&pf_rd_i=desktop))
microservices são pequenos e autônomos serviços trabalhando juntos.

Contudo, o quanto pequeno pode ser um serviço? Pelo número de linhas de código é
problemático, uma vez que algumas linguagens de programação são mais expressivas
que outras. Além disso, há alguns modelos de negócio que são naturalmente mais
complexos.

Um fator relevante a ser considerado é definir o tamanho de 'pequeno' pelo tamanho
do time. Se a base de código é grande o suficiente para ser gerenciada por um
time, é um bom sinal de que o microseriço está grande.

Uma outra variável a se pensar no tamanho do microserviço é sempre ter em mente
o seguinte trade-off: quanto menor o microserviço, maiores serão os benefícios
acerca da interdependência e manutenção, porém maiores serão as complexidades
que surgirão com comunicação e gerenciamento das dependências.

Uma outra característica de um microserviço é ser autônomo, ou seja, ser uma
entidade separada, possível de ser deployada em uma plataforma (PAAS) ou mesmo
em uma máquina sem precisar/afetar qualquer outra dependência.

Isso nos faz pensar sobre o que o nosso serviço deve export e o que eles devem
executar. Se há muita informação sendo compartilhada, ou consumida, gerará um
acoplamento forte diminuindo a autonomia do microserviço.

Para saber o quanto o seu microserviço está desacoplado, faça a seguinte pergunta:
você pode mudar o seu serviço e realizar deploy sem precisar mudar qualquer outro
sistema ou dependência? Se a resposta é não, então avalie os limites do seu
microserviço.
