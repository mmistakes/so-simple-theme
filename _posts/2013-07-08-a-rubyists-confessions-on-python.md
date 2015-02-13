---
layout: post
title: "A Rubyist's confessions on Python"
category: it
description: How a Rubyist feels about Python after using it for 6+ months
source_url: http://stackoverflow.com/questions/1113611/what-does-ruby-have-that-python-doesnt-and-vice-versa_
featured_image: /images/ruby_vs_python.jpg
cover_image: /images/ambient1.jpg
keywords:
- ruby
- python
- comparison
- programming
- languages
---
I'm quite a long-term Ruby developer, I've been actively using the lanuage for 6 years now. I love its style, elegance and metaprogramming abilities... to me it just feels warm and fuzzy to be coding in Ruby. 

Python never appealed to me, the indentation system was too rigid for me, there are illogical/strange solutions, but I guess it's all a matter of taste. However in the last 6+ months as I wrote a lot of python code and got a taste of Django I must say I misjudged Python by the looks. Shame on me.

I'll try to give technical examples for my points thoughout this post but I'm sure many superficial arguments will slip in as this is a very subjective "comparison" and description of the two languages. 

From a very basic philosophical point of view:

## Python
Self-introduction:  
>Python is a programming language that lets you work more quickly and integrate your systems more effectively. You can learn to use Python and see almost immediate gains in productivity and lower maintenance costs.

Python is modeled after the Fortran line; there is a clear distinction between expressions and statements, and between code and data. Sure, you can pass functions around like objects, but you can't go inside and change them. This makes it faster, and better suited to top-down programming. It is a lot easier to learn, and to understand when reading it. The philosophy of "there's only one way to do it" means there is no mystery.

The Zen of Python:



>Beautiful is better than ugly.  
>Explicit is better than implicit.  
>Simple is better than complex.  
>Complex is better than complicated.  
>Flat is better than nested.  
>Sparse is better than dense.  
>Readability counts.  
>Special cases aren't special enough to break the rules.  
>Although practicality beats purity.  
>Errors should never pass silently.  
>Unless explicitly silenced.  
>In the face of ambiguity, refuse the temptation to guess.  
>There should be one-- and preferably only one --obvious way to do it.  
>Although that way may not be obvious at first unless you're Dutch.  
>Now is better than never.  
>Although never is often better than right now.  
>If the implementation is hard to explain, it's a bad idea.  
>If the implementation is easy to explain, it may be a good idea.  
>Namespaces are one honking great idea -- let's do more of those!  


## Ruby
Self-introduction:  
>A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.

Ruby is modeled after Lisp; there is no difference between expressions and statements, and code and data. The most striking commonality is how similar Ruby's blocks are to Lisp's closures. This makes it easier to do metaprogramming to solve problems, and so it is more suited to bottom-up programming. The thing that Ruby has lost, however, is Lisp's main "love it or hate it" feature: its syntax. Rubyists prefer their language's syntactic quirks, and believe that "there is more than one way to do it". Ruby is more interested in programmers than programs.

---

My short summary about the two languages: Python seems more mature, professional and controlled with a nice set of professional "de facto" libraries, Ruby is purely fun to program in, has many interesting concepts and really tries to make the developer happy. That said Ruby is not a toy language, I never had any issues solving complex problems in it.

## Let's see the main differences

#### Ruby has a class reference in the class body
In Ruby you have a reference to the class (self) already in the class body. In Python you don't have a reference to the class until after the class construction is finished.  
Ruby code example:
{% highlight ruby %}
class MyBeautifulClass
  puts self
end
{% endhighlight %}
There is no way to print out the class name or in other ways access the class from the class definition body in Python (outside method definitions).

#### All classes are mutable in Ruby
This lets you develop extensions to core classes. Here's an example:
{% highlight ruby %}
class String
  def starts_with?(other)
    self.index(other) == 0
  end
end
{% endhighlight %}
Now all strings have this method.


Python (imagine there were no startswith method):
{% highlight python %}
def starts_with(s, prefix):
    return s[:len(prefix)] == prefix
{% endhighlight %}
You could use it on any sequence (not just strings). In order to use it you should import it explicitly e.g. "from some_module import starts_with"


#### Ruby has Perl-like scripting features

Ruby has first class regexps, $-variables, the awk/perl line by line input loop and other features that make it more suited to writing small shell scripts that munge text files or act as glue code for other programs, e.g.:
{% highlight ruby %}
$&	#The complete String that matched the last Regexp, or nil if the match failed.
$`	#The string preceding the last Regexp match, or nil if the match failed.
$'	#The string following the last Regexp match, or nil if the match failed.
$+	#The highest group matched by the last successful Regexp match.
$1, $2, ...	#The match for the first, second, etc. parenthesized groups in the last regular expression.
$~	#The MatchData of the last Regexp match in the current scope.
{% endhighlight %}

#### Ruby has first class continuations

Thanks to the callcc statement. In Python you can create continuations by various techniques, but there is no support built in to the language.
{% highlight ruby %}

def level3(cont)
  cont.call("RETURN THIS")
end

def level2(cont)
  level3(cont)
  return "NEVER RETURNED"
end

def top_level_function
  callcc { |cc|
    level2(cc)
  }
end

answer = top_level_function
puts answer # => "RETURN THIS"
{% endhighlight %}
The block passed into the "callcc" method has a parameter which is also a block. This parameter block is a bit of code that returns control back to the original calling code, immediately after the "callcc" method was called, along with restoring the entire context from when the original call was made. 

#### Ruby has blocks
My favourite part. I even wrote a bit on the topic in my "old" tech blog: [Why Ruby? Part Two - Blocks and Closures](http://blog.mostof.it/why-ruby-part-two-blocks-and-closures/)

With the "do" statement you can create a multi-line anonymous function in Ruby, which will be passed in as an argument into the method in front of do, and called from there. In Python you would instead do this either by passing a method or with generators.

Ruby:
{% highlight ruby %}
amethod do |here|
    many=lines+of+code
    goes(here)
end
{% endhighlight %}

Python v1:
{% highlight python %}
with amethod() as here: # amethod() is a context manager
    many=lines+of+code
    goes(here)
{% endhighlight %}

Python v2:
{% highlight python %}
for here in amethod(): # amethod() is an iterable
    many=lines+of+code
    goes(here)
{% endhighlight %}

Python v3:
{% highlight python %}
def function(here):
    many=lines+of+code
    goes(here)

amethod(function)     # `function` is a callback
{% endhighlight %}

#### Ruby supports functional style programming a bit more (easily)

Ruby example:
{% highlight ruby %}
users.map(&:name).reject(&:empty?).join("\n")
{% endhighlight %}

Python example (feels unnatural and harder to read to me):
{% highlight python %}
user_list = (u.name() for u in users)
"\n".join(filter(len, user_list))
{% endhighlight %}

#### Python has a nice flexible namespace handling

In Ruby, when you import a file with require, all the things defined in that file will end up in your global namespace. This causes namespace pollution. The solution to that is Rubys modules. But if you create a namespace with a module, then you have to use that namespace to access the contained classes.

In Python, the file is a module, and you can import its contained names with from themodule import *, thereby polluting the namespace if you want. But you can also import just selected names with from themodule import aname, another or you can simply import themodule and then access the names with themodule.aname. If you want more levels in your namespace you can have packages, which are directories with modules and an __init__.py file.

#### Python has docstrings (man, do I miss them in Ruby...)
Docstrings are strings that are attached to modules, functions and methods and can be introspected at runtime. This helps for creating such things as the help command and automatic documentation.

{% highlight python %}
def complex(real=0.0, imag=0.0):
    """Form a complex number.

    Keyword arguments:
    real -- the real part (default 0.0)
    imag -- the imaginary part (default 0.0)

    """
    if imag == 0.0 and real == 0.0: return complex_zero
    ...
{% endhighlight %}



#### Python has multiple inheritance

Ruby does not ("on purpose" -- it uses [mixins](http://www.ruby-doc.org/docs/ProgrammingRuby/html/tut_modules.html)). It does reuse the module concept as a type of abstract classes.

#### Python has list and dict comprehensions
Python:
{% highlight python %}
res1 = [x*x for x in range(1, 10)]

res2 = (x*x for x in range(10))

res3 = {x:str(y*y) for x,y in {1:2, 3:4}.items()}
{% endhighlight %}

Ruby:
{% highlight ruby %}
res1 = (0..9).map { |x| x * x }

p = proc { |x| x * x }
res2 = (0..9).map(&p)

res3 = Hash[{1=>2, 3=>4}.map{|x,y| [x,(y*y).to_s]}]
{% endhighlight %}

I think the Python version is much cleaner and nicer.

#### Python has decorators

I love them. Similar things can be created in Ruby, but Python has them built in. Nice.

Python:
{% highlight python %}
class myDecorator(object):

    def __init__(self, f):
        print "inside myDecorator.__init__()"
        f()

    def __call__(self):
        print "inside myDecorator.__call__()"

@myDecorator
def aFunction():
    print "inside aFunction"
{% endhighlight %}

## On Django and Rails


