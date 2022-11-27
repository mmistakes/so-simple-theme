---
layout: post
title: Cursor-based Pagination
excerpt: "The easy way to build cursor-based pagination in the application."
last_modified_at: 2022-11-27 14:17:42
categories: articles
tags: [sql, configuration, development]
image:
  feature: wordpress.png
comments: true
---

A lot of articles & notes are written about disadvantages of "regular" pages in browsing lists of content. The major disadvantages is speed of sql `OFFSET` & duplicates of "edge" elements.

The next generation of dynamicly changing content (blog feeds, twits, instagram posts) requires advanced content navigation approaches. So the one of them is cursor-based pagination.

The idea of cursor-based pagination is moving between "next" & "previous" pages fast, without duplicates & missed content. Usually users don't have "pages" navigation, it looks like infinite scroll on the feed page. The examples of this type navigation is infinite feeds of twitter, instagram, facebook, etc.

The developers who integrates with this type of pagination also doesn't have "pages" in API, but has a "cursor" to the next or previous page. It looks like:

```json
{
    "data": [
        {
            "ID": "dc4a8926-4ca5-42d7-920a-4f0de5024619",
            "...": "..."
        },
        {
            "ID": "2a4f316a-3fb4-4ae9-864f-38a34e50b1d5",
            "...": "..."
        },
        {
            "ID": "a7436831-4db7-40f2-9b37-d1962e5e56d0",
            "...": "..."
        },
        {
            "...": "..."
        },
    ],
    "previous": "https://awesome.example/posts?before=dc4a8926-4ca5-42d7-920a-4f0de5024619",
    "next": "https://awesome.example/posts?after=..."
}
```

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
```sql
CREATE INDEX idx_datetime_uid ON news (datetime, uid);
```

Now query to get the next page will be:
```sql
SELECT uid, title, content, datetime
    FROM news
    WHERE (datetime, uid) < ((SELECT datetime FROM news WHERE uid = :uid), :uid)
    ORDER BY (datetime, uid) DESC
    LIMIT :per_page;
```

Links to previous & next pages could be provided by API as a part of response, but also the application which uses API could build it on its own according the latest response.

Getting previous page a little bit different:
```sql
SELECT uid, title, content, datetime
    FROM news
    WHERE (datetime, uid) > ((SELECT datetime FROM news WHERE uid = :uid), :uid)
    ORDER BY (datetime, uid) ASC
    LIMIT :per_page;
```

So we change the order, but then reverse items before sending it as a response.
