---
title: "Layout: Author Override"
author: Billy Rick
excerpt: "A post to test author overrides using a data file."
---

Sites that may have content authored from various individuals can be accommodated by using [data files](https://jekyllrb.com/docs/datafiles/).

To attribute an author to a post or page that is different from the site author specified in `_config.yml`:

**Step 1.** Create `_data/authors.yml` and add authors using the following format. Anything variables found under `author` in `_config.yml` can be used (e.g. `name`, `avatar`, `uri`, social media profiles, etc.).

```yaml
# /_data/authors.yml

Billy Rick:
  name: "Billy Rick"
  picture: "/images/bio-photo-2.jpg"

Cornelius Fiddlebone:
  name: "Cornelius Fiddlebone"
  picture: "/images/bio-photo.jpg"
```

**Step 2.** Assign one of the authors in `authors.yml` to a post or page you wish to override the `site.author` with. 

Example: To assign `Billy Rick` as an author for a post the following YAML Front Matter would be applied:

```yaml
author: Billy Rick
```
