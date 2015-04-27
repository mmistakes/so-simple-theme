---
layout: post
title: "React.js + Reflux example"
description: "An adventure in reactjs and reflux"
category: articles
tags: [react, reactjs, flux, reflux, reactive]
image:
  social: react-reflux.jpg
  social_thumb: 
modified: 2015-02-26
comments: true
share: true
permalink: react-reflux-example/
---

Continuing my [previous post](/react-what-the-flux/) about ReactJS and the Flux architecture I'm now creating a very simple example using the [Reflux](https://github.com/spoike/refluxjs). 

## What is Flux, again?

> Flux is the application architecture that Facebook uses for building client-side web applications. It complements React's composable view components by utilizing a unidirectional data flow. It's more of a pattern rather than a formal framework

The point of Flux is to be more of a functional programming style and do something better than MVC. Flux eschews MVC in favor of a unidirectional data flow. When a user interacts with a React view, the view propagates an action through a central dispatcher, to the various stores that hold the application's data and business logic, which updates all of the views that are affected. This works especially well with React's declarative programming style, which allows the store to send updates without specifying how to transition views between states.



{% highlight javascript %}
var HelloMessage = React.createClass({
  render: function () {
    return <h1>Hello {this.props.message}!</h1>;
  }
});
 
React.render(<HelloMessage message="World" />, document.body);
{% endhighlight %}

