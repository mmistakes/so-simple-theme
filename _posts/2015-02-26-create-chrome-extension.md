---
layout: post
title: "How to create a Chrome extension"
description: "Skip the introductory tutorials and learn how to make a practical Chrome extension in JavaScript."
category: articles
tags: [programming, chrome]
image:
  social: create-chrome-extension.jpg
  social_thumb: 
modified: 2015-02-26
comments: true
share: true
permalink: how-to-create-a-chrome-extension/
---

Google Chrome is probably the best browser nowdays and part of its success is due to the excellent extensions available. It's quite easy to get started with creating extensions but the [official guide](https://developer.chrome.com/extensions/overview) can be overwhelming at first, in my experience it's better used as a reference when you already know what you're looking for.

Let's create an extension which makes the links on [Hacker News](https://news.ycombinator.com/) open in new tabs.

You can find the final version on [GitHub](https://github.com/ochronus/sample-chrome-extension).

## Before you start
Developing an extension is no rocket science but you need to get your HTML and JavaScript (and sometimes CSS) knowledge together. Being familiar with a JavaScript utility library like jQuery may also make your life much easier.

## It all starts with manifest.json
Go ahead, create a folder and put a file _manifest.json_ ([docs](https://developer.chrome.com/extensions/manifest)) there with this sample content:
{% highlight javascript %}
{
  "manifest_version": 2,
  "name": "The most awesome extension",
  "description": "This is the best extension you can ever get!",
  "version": "1.0",
  "browser_action": {
    "default_icon": "icon.png"
  }
}
{% endhighlight %}
This file describes your extension both to Google and later your potential users. Why the magic *2* for manifest_version? This is something [Google defines](https://developer.chrome.com/extensions/manifestVersion) so they are able to introduce new extension APIs and policies.

*default_icon* is the icon your that gets shown in the chrome extension bar. Go and download some icon and place it in your newly created folder. If you absolutely can't find anything, [here](https://cdn.ochronus.com/images/chrome-logo-transparent.png)'s one for you.

## Loading an in-development extension
Well our shiny new extension doesn't do much apart from _being_ but still let's see how we can get it into Chrome. 

Navigate to [chrome://extensions/](chrome://extensions/) (or open Settings/Extensions)
Tick 'developer mode' 
![](/images/chrome-extension-developer-mode.jpg){: .center-image }
Then click 'Load unpacked extension' and open your folder.
![](/images/chrome-extensions-load-unpacked.jpg){: .center-image }
Your icon should appear in chrome in the extension icon bar right next to the url bar.

During development you can simply reload your extension after you've made changes to it:
![](/images/chrome-reload-extension.jpg){: .center-image }

## Types of extensions
There are many ways an extension can interact with Chrome, e.g. it can change the rendered page's content, it can show an action icon on specific pages, it can show an ever-present icon next to the url bar (this is how our code currently behaves), the context menu can be extended or the extension can remain totally 'silent'. For a complete reference see the [official developer guide](https://developer.chrome.com/extensions/devguide).

For now, let's focus on content scripts.

## Content scripts
These scripts modify pages on specific urls; technically their code gets injected into the page so they run in the context of the page (but they can also access some Chrome-specific API). [Docs](https://developer.chrome.com/extensions/content_scripts)

## Add a "hello world" content script
We need to modify our manifest:
{% highlight javascript %}
{
    "manifest_version": 2,
    "name": "Hacker news link tabifier",
    "description": "Makes links on Hacker News open in new tabs",
    "version": "1.0",
    "browser_action": {
    "default_icon": "icons/hacker_news-512.png"
    },
    "content_scripts": [
      {
        "matches": [
          "https://news.ycombinator.com/*"
        ],
        "js": ["lib/jquery.min.js", "src/hn_links.js"],
        "run_at": "document_end"
      }
    ]
}
{% endhighlight %}
We can have multiple content script "bundles", each with multiple scripts and their own "run-at" setting. "run-at" specifies when the scripts will be injected, document_end meaning right when DOM is ready but before subresources like images and frames have loaded. Just ideal for a script that changes the DOM. We're now using jQuery for tooling but it's totally optional. The "matches" list specifies a list of url patterns Chrome will [match](https://developer.chrome.com/extensions/match_patterns) to decide if the content script(s) are to be injected or not.

The first iteration of hn_links.js:
{% highlight javascript %}
console.log('aloha');
{% endhighlight %}
If you load this extension and navigate to Hacker News you'll see the greeting in the javascript console.

## Finish the script
Let's get the script together. So we promised to open all links in new tabs - the simplest solution is to add 'target="_blank"' to all anchors.
Iterate over anchor elements with jQuery and add the attribute.

The second iteration of hn_links.js:
{% highlight javascript %}
$("a").attr("target", "_blank");
{% endhighlight %}

## Fix issues
Our extension behaves _almost_ well. Let's iron out a few issues.
First we are overriding all "target" attributes which is bad and second we're modifying internal links, too.

The final iteration of hn_links.js:
{% highlight javascript %}
$("a").each(function() {
    var $elem = $(this);
    var url = $elem.attr("href");

    if (url.indexOf("https://news.ycombinator.com") === 0 || url.indexOf("http") === -1) {
        return;
    }
    
    if ($elem.attr("target") === undefined) {
        $elem.attr("target", "_blank");
        console.log($elem.attr("href"), $elem.attr("target"));
    }
});
{% endhighlight %}
It could be more optimized but it's more readable this way.

I hope you enjoyed this journey on the path of developing a simple Chrome Extension, again, you can find the source code on [GitHub](https://github.com/ochronus/sample-chrome-extension)