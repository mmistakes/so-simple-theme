---
layout: post
title: React.js + Reflux example
description: An adventure in reactjs and reflux
category: articles
tags:
  - react
  - reactjs
  - flux
  - reflux
  - reactive
image:
  social: react-reflux.jpg
  social_thumb: null
modified: 2015-02-26T00:00:00.000Z
comments: true
share: true
permalink: react-reflux-example/
---

I've told you in my [previous post about React](/react-what-the-flux/) that his is how I felt every time I had to code JS:
<figure>
    <img src="/images/hamster_reverse_wheel.gif" alt="Coding in vanilla JS">
    <figcaption>Kinda works, but something's not as it's supposed to be.</figcaption>
</figure>

Then I came across ReactJS and the Flux architecture. I wouldn't say it's our salvation but I really like the direction it's going towards.

I'm now creating a very simple example app using the [Reflux](https://github.com/spoike/refluxjs) library.

# What is Flux, again?
> Flux is the application architecture that Facebook uses for building client-side web applications. It complements React's composable view components by utilizing a unidirectional data flow. It's more of a pattern rather than a formal framework

The point of Flux is to be more of a functional programming style and do something better than MVC. Flux eschews MVC in favor of a unidirectional data flow. When a user interacts with a React view, the view propagates an action through a central dispatcher, to the various stores that hold the application's data and business logic, which updates all of the views that are affected. This works especially well with React's declarative programming style, which allows the store to send updates without specifying how to transition views between states.
<figure>
    <img src="/images/flux-simple-f8-diagram-with-client-action-1300w.png" alt="Data flow in Flux">
    <figcaption>Data flow in Flux</figcaption>
</figure>

# A really quick & dirty Flux primer, a.k.a. the key parts of the Flux architecture
## The dispatcher
The dispatcher is a singleton, and operates as the central hub of data flow in a Flux application. It is essentially a registry for callbacks, and it's able to invoke these callbacks in order. Stores register a  callback at the dispatcher, then when new data comes into the dispatcher, it then uses these callbacks to propagate that data to all of the stores.

Why do we need a dispatcher? Well, as your app grows, stores (see below) will for sure start to depend on each other.

## Actions
When new data enters the system - be it through a user clicking around on the UI or through an AJAX response, that data is packaged into an action -- an object containing the new fields of data and a specific action type. Actions are identified by a type attribute. When all of the stores receive the action, they typically use this attribute to determine if and how they should respond to it. In a Flux application, both stores and views control themselves; they are not acted upon by external objects. Actions flow into the stores through the callbacks they define and register, not through setter methods.

Letting the stores update themselves eliminates many entanglements typically found in MVC applications, where cascading updates between models can lead to unstable state and make accurate testing very difficult. The objects within a Flux application are highly decoupled, and adhere very strongly to the Law of Demeter, the principle that each object within a system should know as little as possible about the other objects in the system. This results in software that is more maintainable, adaptable, testable, and easier for new engineering team members to understand.

## Stores
Stores contain the application state and logic. They are somewhat similar to a model in a traditional MVC, but they manage the state of many objects -- they do not represent a single record of data like ORM models do. Nor are they the same as Backbone's collections. More than simply managing a collection of ORM-style objects, stores manage the application state for a particular domain within the application.

# And RefluxJS?
> A simple library for uni-directional dataflow application architecture inspired by ReactJS Flux

There's a [blog post](http://spoike.ghost.io/deconstructing-reactjss-flux/) about the differences between Flux and Reflux, the key takeaway is that in Reflux:
- The singleton dispatcher is removed in favor for letting every action act as dispatcher instead.
- Because actions are listenable, the stores may listen to them. Stores don't need to have big switch statements that do static type checking (of action types) with strings
- Stores may listen to other stores, i.e. it is possible to create stores that can aggregate data further, similar to a map/reduce.
- waitFor is replaced in favor to handle serial and parallel data flows:
- Aggregate data stores (mentioned above) may listen to other stores in serial & Joins for joining listeners in parallel
- Action creators are not needed because RefluxJS actions are functions that will pass on the payload they receive to anyone listening to them

# Let's start
Let's create a very simple application: an image grid which periodically fetches the latest public photos from Flickr and also add a button to be able to trigger the refresh. You can see it working at [https://reflux-sample.ochronus.com/](https://reflux-sample.ochronus.com/). You can find the sources on [Github](https://github.com/ochronus/reflux-example)

I've used [this yeoman generator](https://github.com/TFaga/generator-react-reflux) to kick off the basic structure of the project.

Under app/scripts three folders are created: components, actions and stores. We know about actions and stores from the previous section and we also know that dispatching is moved to actions+stores in Reflux. There's also an app.js and a Router.jsx which serve as the application's entry point. I won't talk about react-router now, it's not relevant for this article, let's just accept that it helps with client-side routing (with the location hash), for now the default route (/) is enough.

The 'components' folder contains our React components. There's a simple hierachy here, if you check out routing Layout contains Home, a specific page. Home itself uses ImageGrid to display the actual image grid.

Actions is pretty simple:

{% highlight javascript %} var ImageActions = Reflux.createActions([   'fetchList' ]); {% endhighlight %}

This means there's only one action for the image list: fetching it. Looking at stores/imagestore.js:

{% highlight javascript %}

var Reflux = require('reflux');
var $ = require('jquery');
var ImageActions = require('../actions/imageactions');

var ImageStore = Reflux.createStore({
    listenables: [ImageActions],
    imagelist: [],
    sourceUrl: 'https://api.flickr.com/services/feeds/photos_public.gne?format=json&tags=cats,memes',

    init: function() {
        this.fetchList();
    },

    fetchList: function() {
        $.ajax({
            url: this.sourceUrl,
            dataType: 'jsonp',
            jsonpCallback: 'jsonFlickrFeed',
            cache: false,
            context: this,
            success: function(data) {
                console.log('fetch complete');
                this.imagelist = data.items;
                this.trigger(this.imagelist);
            }
        });
    }
});

module.exports = ImageStore;
{% endhighlight %}

_listenables_ is the special thing here: it autoconnects actions with stores. Here we specified that ImageStore should be notified if any ImageActions action occur. Remember, there's only one for now: 'fetchList'. An automatic function invocation is done then, the function with the same name or one with the 'on' prefix is getting invoked on the Store. So, in our case it's either 'fetchList()' or 'onfetchList()' - I used the former.

So at this point whenever the action 'fetchList' is invoked, the 'fetchList()' function of ImageStore gets called.  
