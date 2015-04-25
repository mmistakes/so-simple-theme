---
layout: post
title: "React.js - What the flux"
description: "An adventure in facebook's reactjs and flux architecture"
category: articles
tags: [react, reactjs, flux, reflux, reactive]
image:
  social: TKT8BUD2H6.jpg
  social_thumb: 
modified: 2015-02-26
comments: true
share: true
permalink: react-what-the-flux/
---

UI on the web has always been a special kind of hell for me. That is the part of the stack where I almost always have the feeling that I'm not doing proper engineering work, it's so fragile, without real/strong architecture. I have used and tried many frameworks to lessen the pain - [Backbone](http://backbonejs.org/), [Marionette+Backbone](http://marionettejs.com/) and lately the 'new' kids on the block - [AngularJS](https://angularjs.org/) & [Ember](http://emberjs.com/). Well, frankly none of them seem to get things right to me. There's still the lingering feeling of building your UI with toothpicks and duct tape. Oh, and sometimes magic (hello, Angular!).

## Let there be light

Part of the pain is the same as on the backend - we're managing state in a wrong way. I strongly believe that state management should be explicit and conscious. To make things worse we're trying to flow state back and fort between the backend and the frontend with an inherently stateless protocol called [HTTP](http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#HTTP_session_state).

## State of the art art of the state management

Let's get our concepts straight. Identity and state are not equivalent things. By identity I mean a stable logical entity associated with a series of different values over time. An identity is an entity that has a state, which is its value at a point in time. Like 'today'. Today, 'today' is the date on which I'm writing the article but tomorrow the identity 'today' still has a meaning but it's value/state will be different. Object Oriented programming typically unifies identity and state. An object (identity) is a pointer to the memory that contains the value of its state. There is no way to obtain the state independently from the identity other than copying it. There is no way to observe a stable state (even to copy it) without blocking others from changing it (hello and goodbye concurrent programming). There is no way to associate the identity's state with a different value other than in-place memory mutation which is usually *not* an atomic operation. 

There is another way of handling this. Why don't we separate state from identity? Thus state is no longer the "content of this memory chunk" but "the value that is currently associated with this identity". Then the identity is in different states through the flow of time but the states themselves *do not change*. This might seem like a philosopher's play with concepts but trust me it has serious implications. Check out how [Clojure does it](http://clojure.org/concurrent_programming) - seriously.

Just to make it clear there are other ways of doing state management, e.g. [Erlang's](http://learnyousomeerlang.com/the-hitchhikers-guide-to-concurrency) and [Akka's](http://akka.io/) messaging model, the [actor model](http://en.wikipedia.org/wiki/Actor_model).  
I strongly suggest to all engineers to watch Rich Hickey's talk on the topic: ["Are We There Yet?"](http://www.infoq.com/presentations/Are-We-There-Yet-Rich-Hickey).

## How the heck is this related to UI again? 

A web UI inherently uses many identities and states - from easy ones like 'is this checkbox checked' to complex ones as 'did my asynchronous XHR call succeed and was I able to decode the JSON response and if yes, is the status field OK?'. To make things worse (as in more natural?) these state transitions are not entirely controlled by us, the user usually clicks around, types things, gets angry and submits the form ten times and finds breakable parts of our UI that we never ever dreamed of. Oh, yes, I know, you might not be calling these things 'state'. You might be thinking about nested case/if statements, logic flow or maybe you don't even have a word for it. Trust me, the sooner you realize that this *is* state management and that you need to be *conscious* about it the better. 

## Mmmkay, so what is this React.js thing and how does it help?

[React.js](https://facebook.github.io/react/) has a bold tagline: "A Javascript library for building user interfaces". React thinks of UIs as simple state machines. By thinking of a UI as being in various states and rendering those states, it's easy to keep your UI consistent - you simply update a component's state, and then render a new UI based on this new state. But even the React doc [says](https://facebook.github.io/react/docs/interactivity-and-dynamic-uis.html): 

> Try to keep as many of your components as possible stateless. By doing this you'll isolate the state to its most logical place and minimize redundancy, making it easier to reason about your application.

So what React does is that it points our attention to handing state in an isolated and conscious way. It does not enforce it though. 

## I've heard it's fast

Yes, another thing that React does is rendering. And it's pretty good at it. It maintains a so-called 'virtual DOM' in memory, all your changes go in there, then it's efficiently diff'd with the DOM and only the diff is (re-)rendered. This results in a much faster rendering phase compared to all-or-nothing rendering. Again, React is able to do this because state is managed in an isolated, controlled manner (direct, ad-hoc changes to the DOM would mess things up).

Look, there is a [benchmark](https://www.codementor.io/reactjs/tutorial/reactjs-vs-angular-js-performance-comparison-knockout)

## Hello world, please

{% highlight javascript %}
var HelloMessage = React.createClass({
  render: function () {
    return <h1>Hello {this.props.message}!</h1>;
  }
});
 
React.render(<HelloMessage message="World" />, document.body);
{% endhighlight %}

Hmm what a strange syntax! Even this blog's syntax highlighter goes crazy! I thought 'HelloMessage' is not a valid HTML tag! No, it isn't. React merges templating with code, you can use [JSX](https://facebook.github.io/jsx/) as in this example to use your components but of course you can as well go with plain Javascript. 

An example with state management:

{% highlight javascript %}
var ToggleText = React.createClass({
  getInitialState: function () {
    return {
      showDefault: true
    }
  },
  
  toggle: function (e) {
    // Prevent following the link.
    e.preventDefault();
    
    // Invert the chosen default.
    // This will trigger an intelligent re-render of the component.
    this.setState({ showDefault: !this.state.showDefault })
  },
  
  render: function () {
    // Default to the default message.
    var message = this.props.default;
    
    // If toggled, show the alternate message.
    if (!this.state.showDefault) {
      message = this.props.alt;
    }
    
    return (
      <div>
        <h1>Hello {message}!</h1>
        <a href="" onClick={this.toggle}>Toggle</a>
      </div>
    );
  }
});
 
React.render(<ToggleText default="World" alt="Mars" />, document.body);
{% endhighlight %}

## React and Flux sitting on a tree

What React does not talk about is how to structure your webapp. It's fair, one lib should be focused on one thing. This is where [Flux](http://facebook.github.io/flux/) enters the scene - it is the application architecture that Facebook uses for webapps. There are two separate things here - Flux as the concept, the architecture and a very concrete Javascript library that implements it. 

Flux apps have three main parts: the dispatcher, the stores, and the views (which are React components). No, this *does not* map to MVC. The idea is that there is a unidirectional data flow (vs. two-way binding as in Angular for example).

> When a user interacts with a React view, the view propagates an action through a central dispatcher, to the various stores that hold the application's data and business logic, which updates all of the views that are affected. This works especially well with React's declarative programming style, which allows the store to send updates without specifying how to transition views between states.

Check out the [Flux TodoMVC tutorial](https://facebook.github.io/flux/docs/todo-list.html) - which is not MVC ;)

## It's the end of MVC as we know it

There's a wind of change and I really hope we, web engineers will wrap our heads over these old-new concepts. [Reactive Programming](http://en.wikipedia.org/wiki/Reactive_programming) is big and [FRP](http://en.wikipedia.org/wiki/Functional_reactive_programming) is even more natural than enforcing this paradigm in an OO world.

There are languages, frameworks which have been doing it for a long time now. Some that come to my mind:

* [ClojureScript](https://github.com/clojure/clojurescript) the Clojure to JS compiler with (almost) all of the goodies found in Clojure, even the async part!
* Various reactive libs for Clojurescript: [Om](https://github.com/omcljs/om), [Reagent](http://reagent-project.github.io/), [Quiescent](https://github.com/levand/quiescent), [Rum](https://github.com/tonsky/rum)
* The [elm](http://elm-lang.org/) language
* [Scala.RX](https://github.com/lihaoyi/scala.rx)

Go and read. Get to know many solutions, widen your horizons and you shall surely come to be a better engineer.

Also come back soon, I'm preparing a post about a sample app in Flux (Reflux.js to be exact) compared to Clojurescript (Reagent and [re-frame](https://github.com/Day8/re-frame)).
