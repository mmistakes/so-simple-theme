---
layout: post
title: Cursor Way of Pagination
excerpt: "The easy way to build cursor-based pagination in the application."
last_modified_at: 2022-11-27 14:17:42
categories: notes
tags: [sql, configuration, development]
image:
  feature: wordpress.png
comments: true
---

A lot of articles & notes are written about disadvantages of "regular" pages in browsing lists of content. The major disadvantages is speed of sql `OFFSET` & duplicates of "edge" elements.

The next generation of dynamicly changing content (blog feeds, twits, instagram posts) requires advanced content navigation approaches. So the one of them is cursor-based pagination.

The idea of cursor-based pagination is moving between "next" & "previous" pages fast, without duplicates & missed content. Usually users don't have "pages" navigation, it looks like infinite scroll on the feed page. The examples of this type navigation is infinite feeds of twitter, instagram, facebook, etc.

The developers who integrates with this type of pagination also doesn't have "pages" in API, but has a "cursor" to the next or previous page. It looks like:

{% gist 60ba05b97448c9595434cb35ea4afb84 %}

## Implementation

The minimal model of any content is:
* **PRIMARY KEY** – unique item identifier, could be integer, uuid, or any other type;
* **DATA** – a field, or number of fields of "human" content;
* **ORDER** – a field, or number of fields to determine the order content should be displayed in;

> The modern platforms uses algorythms to determine the order of the content for each user, this type is out-of-scope of this article.

Since the **ORDER** often is not unique, so we can't just use it exlusively. We need something wider than that.

So let's build the pagination of news feed. We'll use item created date as an **ORDER**.

The table **news** will look the next way.
```
 uid | title           | content                       | datetime
--------------------------------------------------------------------
 ... | World War Z     | Lorem ipsum dolor sit ...     | 1638004125
 ... | Etiam Molestie  | Maecenas vulputate mi ...     | 1624774080
 ... | Nam eu Lobortis | Mauris facilisis sagittis ... | 1614406080
```

Since *datetime* is not unique, but *ID* is, we need to create a single directional list of items using it.

The database index will help to chain items by those files.
{% gist 5b4936232c1d8cae5f3c39f57376df2a %}

Now query to get the next page will be:
{% gist 22652f6ed9e4b05b009bc63d35d101a2 %}

Links to previous & next pages could be provided by API as a part of response, but also the application which uses API could build it on its own according the latest response.

Getting previous page a little bit different:
{% gist 7f075577b3bb06524f7bdcc5409771b0 %}

So we change the order, but then reverse items before sending it as a response.
