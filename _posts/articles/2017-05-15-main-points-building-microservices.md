---
layout: post
title: Main Points - Building Microservices
excerpt: "This article is for future reference. That are some important topics
extracted from the book Building Microservices."
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

<figure>
  <a href="/images/building-microservices-capa.jpeg">
    <img src="/images/building-microservices-capa.jpeg" alt="image"
      style="width: 50%; height: 50%; margin-left: 37%; margin-right: 37%">
  </a>
</figure>


Following some important topics extracts from my reading of the book ([Building Microservices](https://www.amazon.com/Building-Microservices-Designing-Fine-Grained-Systems/dp/1491950358/ref=s9_simh_gw_g14_i5_r?_encoding=UTF8&fpl=fresh&pf_rd_m=ATVPDKIKX0DER&pf_rd_s=&pf_rd_r=67VPD6EW255AWZT0BMBQ&pf_rd_t=36701&pf_rd_p=a6aaf593-1ba4-4f4e-bdcc-0febe090b8ed&pf_rd_i=desktop)).

###### Chapter 1 - Microservices
* Microservices are small, autonomus services that work together;
* Microservices should follow [Single Responsability Principle](https://en.wikipedia.org/wiki/Single_responsibility_principle);
* We need think about what our services should expose.

###### Chapter 2 - The Evolutionaty Architect
* Defining clear attributes that each service should have is one way of being
clear as to where to balance sits;
* I would suggest ensuring that all services emit health and generate monitoring
related metrics in the same way;
* Governance: ensure that the system being implemented fits tecnical vision.

###### Chapter 3 - How to model Services
* What makes a good service?
  * Loose coupling
  * High cohesion
* Limit the number of different types of calls.
* Each bounded context has an explicit interface, where it decides what modelos
to share with others contexts.
* If our service boundaries align to the bounded contexts in our domain, and our
microservices represent those bounded contexts, we are off to an excellent start
in ensuring that our microservices are loosey coupled and strongly cohesive
* Prematurely decomposing a system into microservices can be costly, especially if
you are new to the domain.
* When you start to think about the bounded contexts that exists in your
organization, you should be thinking not in terms of data shared, but about
capabilities those contexts provide the rest of the domain.
* These capabilities become the key operations that will be exposed over the wire
to other collaboratoes.

###### Chapter 4 - Integration
* Keep your APIs tecnology agnostics.
* Orchestration
  * Guide and drive (Put image)

  <figure>
  	<a href="/images/Orchestraction.jpg">
    <img src="/images/Orchestraction.jpg" alt="image"></a>
  	<figcaption>Orchestraction example.</figcaption>
  </figure>

* Choreography
  * Each part does its jobs
* Normally, Orchestration result in a small number of smart "God" services
telling anemic CRUD-based services what to do.
* In general, I have found that system that tend more toward the choreographed
approach are more loosey coupled, and are more flexible and amenable to change.
* In Choreography, each service is smart enough to understand its role in the
whole dance.

<figure>
	<a href="/images/Choreography.jpg">
  <img src="/images/Choreography.jpg" alt="image"></a>
	<figcaption>Choreography example</figcaption>
</figure>

* To delay the implementation of proper persistence for the microservice, until
the interface had stabilized enough.
* Dry (Don't repeat yourself)
  * Don't violate DRY within a microservice, but be relaxed about violationg
  DRY across all service.
* Client libraries should e made by the clients. The client is in charge of When
upgrade happens.
* Sometimes the use of memory is good enough, others time you need to know if it
has changed. So whether you decide to pass around a memory of what an entity once
looked like, make sure you also include reference to the original resource so
that the new state can be retrieved.
* Postel's Law
  * Be conservative in what you do, be liberal in what you accept from others.
* UI Fragment composition
  * One of the key advantages of this approach is that the same team makes changes
  to the services can be also in charge of making to those parts of the UI.
  * Problem with this approach
    * Ensuring consistency of the user experience. Users want to have a seamless
    experience, not to feel that different parts of the interface work in
    different ways, or present a different design language.
    * Native applications or thick clients could be hard to do.

###### Chapter 5 - Splitting the Monolith

* Our code should represent our organization, so our package representing the
bounded context in our organization should interact in the same way the real-life
organizational group in our domain interact.
* An incremental approach will help you learn about microservices as you go, and
will also limit the impact of getting wrong.
* Multiple service per host can also inhibit autonomy of teams. If services for
different teams are installed on the same host, who gets to configure the host for
their services? In all likelihood this ends up getting handled by a centralized
team, meaning it takes more coordination to get services deployed.
* Having a single-service-per-host model is significantly  easier to reason about
can help reduce complexity. If you can't embrace this model yet, I won't say
microservices aren't for you.

###### Chapter 7 - Testing

* If you currently carry out large amounts of manual testing. I would suggest you
address that before proceeding too far down the path of microservices, as you
won't get many of their benefits proceeding too far down the path of microservices,
as you won't get many of theirs benefits if you are unable to validate your
software quickly and efficiently.
* When we detect flaky tests, it is essential that we do our best to remove them.
Otherwise, we start to lose faith in a test suite that "always fails like that".
A test suite with flaky tests can become a victim of what Diane Vaughan calls
**the normalization of deviance** - the idea that over time we can become so
accustomed to do things being wrong that we start to accept them as being normal
and not a problem. This is very human tendency means we need to find and eliminate
these tests as soon as we can before we start to assume that failings tests are
OK.
* Organizations react by having a dedicated team write these tests. This can be
disastrous. The team developing the software becomes increasingly distant from
the tests for its code. Cycle times increase, as service owners end up waiting
for the test team to write end-to-end tests for the functionality they just wrote.
Because another team writes these tests, the team that wrote the service is less
involved with, and therefore less likely to know, how to run and fix these tests.


###### Chapter 12 - Bringing It All together

The main principles of Microservices are:

<figure>
	<a href="/images/Principles-Microservice.jpg">
  <img src="/images/Principles-Microservice.jpg" alt="image"></a>
	<figcaption>Choreography example</figcaption>
</figure>

* Model Around Business Concepts
  * Use **bounded contexts** to define potential domain boundaries.
* Adopt a Culture of Automation
  * Microservices add a lot of complexity, a key part of which comes from the
  sheer number of movings parts we have to deal with. Embracing culture of
  automation is one way to address this.
  * Automated testing is essential, as ensuring our services still work.
  * Having uniform command-line call to deploy the same way everywhere can help.
* Hide Internal Implementation Details
  * To maximize the ability of one service to evolve independently of any others,
  it is vital that we hide implementation details.
  * Modeling **bounded contexts** can help.
  * Services should hide their databases to avoid falling into one of the most
  common sorts of coupling.
  * Pick **tecnology-agnostic** APIs to give you freedom to use different
  technologies stacks.
* Decentralize All the Things
  * Embracing **self-service** wherever possible, allowing people to deploy
  software on demand, making development and testing as easy as possible, and
  avoiding the need for separate teams to perform these activities.
  * Avoid approaches like enterprise service bus or orchestration systems, which
  can lead to centralization of business logic and dumb services.
  * Prefer choreography over orchestration and dumb middleware, with smart
  endpoints to ensure that you keep associated logic and data within service
  boundaries, helping keep things cohesive.
* Independently Deployable
  * We should always strive to ensure that our microservices can and are deployed
  by themselves.
  * We should seek to coexist versioned endpoints to allow our consumers to change
  over time.
  * By adopting a **one-service-per-host** model, you reduce side effects that
  could cause deploying one service to impact another unrelated service.
  * Consider using **blue/green or canary** release techniques to separate
  deployment from release, reducing the risk of release going wrong.
  * Use **consumer-driven contracts** to catch breaking changes before they happen.
  * Your **consumers should decide when they update themselves**, and you need
  to accommodate this.
* Isolate Failure
  * When using network calls, don't treat remote calls like local calls, as this
  will hide different sorts of failures mode.
  * Make sure **timeouts** are set appropriately.
  * Understand when and how to use **bulkheads** and **circuit breakers** to
  limit the fallout of a failing component.
* Highly Observable
  * Use **semantic monitoring** to see if your system is behaving correctly, by
  injecting **synthetic transactions** into your system to simulate real-user
  behavior
  * **Aggregate your logs**, and **aggregate your stats**, so that when you see
  a problem you can drill down to the source.
  * Use **correlation IDs** to allow you to create call through the system.
