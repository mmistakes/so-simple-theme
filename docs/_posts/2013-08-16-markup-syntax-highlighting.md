---
title: "Markup: Syntax Highlighting"
excerpt: "Post displaying the various ways one can highlight code blocks with Jekyll. Some options include standard Markdown, GitHub Flavored Markdown, and Jekyll's `{% highlight %}` tag."
last_modified_at: 2017-03-09T10:27:01-05:00
tags: 
  - code
  - syntax highlighting
---

Syntax highlighting is a feature that displays source code, in different colors and fonts according to the category of terms. This feature facilitates writing in a structured language such as a programming language or a markup language as both structures and syntax errors are visually distinct. Highlighting does not affect the meaning of the text itself; it is intended only for human readers.[^1]

[^1]: <http://en.wikipedia.org/wiki/Syntax_highlighting>

## GFM Code Blocks

GitHub Flavored Markdown [fenced code blocks](https://help.github.com/articles/creating-and-highlighting-code-blocks/) are supported by default with Jekyll. You may need to update your `_config.yml` file to enable them if you're using an older version.

```yaml
kramdown:
  input: GFM
```

Here's an example of a CSS code snippet written in GFM:

```css
#container {
  float: left;
  margin: 0 -240px 0 0;
  width: 100%;
}
```

Yet another code snippet for demonstration purposes:

```ruby
module Jekyll
  class TagIndex < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_index.html')
      self.data['tag'] = tag
      tag_title_prefix = site.config['tag_title_prefix'] || 'Tagged: '
      tag_title_suffix = site.config['tag_title_suffix'] || '&#8211;'
      self.data['title'] = "#{tag_title_prefix}#{tag}"
      self.data['description'] = "An archive of posts tagged #{tag}."
    end
  end
end
```

## Jekyll Highlight Liquid Tag

Jekyll also has built-in support for syntax highlighting of code snippets using either Rouge or Pygments, using a dedicated Liquid tag as follows:

```liquid
{% raw %}{% highlight scss %}
.highlight {
  margin: 0;
  padding: 1em;
  font-family: $monospace;
  font-size: $type-size-7;
  line-height: 1.8;
}
{% endhighlight %}{% endraw %}
```

And the output will look like this:

{% highlight scss %}
.highlight {
  margin: 0;
  padding: 1em;
  font-family: $monospace;
  font-size: $type-size-7;
  line-height: 1.8;
}
{% endhighlight %}

Here's an example of a code snippet using the Liquid tag and `linenos` enabled.

{% highlight html linenos %}
{% raw %}<nav class="pagination" role="navigation">
  {% if page.previous %}
    <a href="{{ site.url }}{{ page.previous.url }}" class="btn" title="{{ page.previous.title }}">Previous article</a>
  {% endif %}
  {% if page.next %}
    <a href="{{ site.url }}{{ page.next.url }}" class="btn" title="{{ page.next.title }}">Next article</a>
  {% endif %}
</nav><!-- /.pagination -->{% endraw %}
{% endhighlight %}

## Code Blocks in Lists

Indentation matters. Be sure the indent of the code block aligns with the first non-space character after the list item marker (e.g., `1.`). Usually this will mean indenting 3 spaces instead of 4.

1. Do step 1.
2. Now do this:
   
   ```ruby
   def print_hi(name)
     puts "Hi, #{name}"
   end
   print_hi('Tom')
   #=> prints 'Hi, Tom' to STDOUT.
   ```
        
3. Now you can do this.

## GitHub Gist Embed

GitHub Gist embeds can also be used:

```html
<script src="https://gist.github.com/mmistakes/77c68fbb07731a456805a7b473f47841.js"></script>
```

Which outputs as:

<script src="https://gist.github.com/mmistakes/77c68fbb07731a456805a7b473f47841.js"></script>
