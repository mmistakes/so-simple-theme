---
layout: post
title: "Generative testing in Clojure"
category: posts
description: "Introduction to generative testing in Clojure using test.check"
keywords:
- clojure
- testing
- unit test
- generative testing
- learn clojure
comments: true
share: true
image:
  social: EAOCZEFTBS.jpg
  social_thumb: 
---

Why not automate the manual work involved in writing individual test cases? Why not make them more robust by applying a much wider coverage of the input domain compared to picking edge cases by hand? Why not separate input domain definition from validation? Generative testing addresses these problems by testing random_(ish)_ly generated inputs against the expected _properties_ of output instead of expected _values_. Traditional unit tests are usually written by hand-picking cleverly chosen edge cases and testing them, encapsulating input and validation in (typically) single functions/methods.  
<div>&nbsp;</div>
An example of traditional unit tests in Clojure:

{% highlight clojure %}
(defn add [x y] (+ x y))

(deftest add-x-to-y
  (is (= 5 (add 2 3))))
{% endhighlight %}

Generative testing, on the other hand separates the definition of the input domain (possible inputs for the function being tested) with the concept of _generators_ and _validators_. 

Clojure's [test.generative](https://github.com/clojure/test.generative) has a nice set of generator functions:

{% highlight clojure %}
(gen/long)
--> -5025562857975149833

(gen/string)
--> "zm\\CBIKLLn.oK:21rNG\\b=VCrlZCbv2l[L=S\\+O\"#M^EyD]itX|'i:uCH?=J"

;; generation is composable!
(gen/vec gen/short)
--> [-12536 -14610 10849 26435 -8600 -14697 -2382 18540 27481 -4163 16377 -7434 -21144 6183 -19021 21362 -21482 5729]

;; with parametrized size
(gen/vec gen/short 2)
--> [16467 4655]

;; the size can also be a generator!
(gen/vec gen/short (gen/uniform 3 5))
--> [16548 -30709 -9312 20827]
{% endhighlight %}

[test.check](https://github.com/clojure/test.check) extends this functionality with awesome features:

{% highlight clojure %}
(require '[clojure.test.check :as tc])
(require '[clojure.test.check.generators :as gen])
(require '[clojure.test.check.properties :as prop])

;; gen/choose chooses a random element from the specified range
(def five-through-nine (gen/choose 5 9))
;; sampling generated input range
(gen/sample five-through-nine)
--> (5 6 9 8 8 9 8 6 9 9)
;; not losing the optional size param
(gen/sample five-through-nine 2)
--> (6 6)
;; you can choose from a vector, too
(def languages (gen/elements ["clojure" "haskell" "erlang" "scala" "python"]))
(gen/sample languages 2)
--> ("erlang" "python")

;; custom generators
(def int-or-nil (gen/one-of [gen/int (gen/return nil)]))
(gen/sample int-or-nil 3)
--> (nil 0 1)

;; you can get probabilistic
(def mostly-ints (gen/frequency [[9 gen/int] [1 (gen/return nil)]]))
(gen/sample mostly-ints)
--> (0 0 -1 3 -4 0 -1 nil nil 4)

;; you can filter
(def anything-but-five (gen/such-that #(not= % 5) gen/int))
(gen/sample anything-but-five)
--> (0 -1 -2 1 -3 3 3 6 -2 4)

;; or map
(def even-and-positive (gen/fmap #(* 2 %) gen/pos-int))
(gen/sample even-and-positive 20)
--> (0 2 4 6 2 2 10 12 14 4 18 18 8 4 12 26 18 10 20 4)
{% endhighlight %}

When you have your generators set up, it's time to declare the _properties_ which is a way to formally define the test:

{% highlight clojure %}
(def sort-idempotent-prop
  (prop/for-all [v (gen/vector gen/int)]
    (= (sort v) (sort (sort v)))))
{% endhighlight %}

In the above example we're stating that _for all_ random vectors of integers (this is what (gen/vector gen/int), our generator gives us) sorting once should result in the same vector as sorting twice. We can quickly check if the test fails or not:

{% highlight clojure %}
(tc/quick-check 100 sort-idempotent-prop)
--> {:result true, :num-tests 100, :seed 1402490429901}
{% endhighlight %}

Let's see what we get if our test fails!

{% highlight clojure %}
(def prop-sorted-first-less-than-last
  (prop/for-all [v (gen/not-empty (gen/vector gen/int))]
    (let [s (sort v)]
      (< (first s) (last s)))))
(tc/quick-check 100 prop-sorted-first-less-than-last)
--> {:result false, :seed 1402490546803, :failing-size 0, :num-tests 1, :fail [[0 0]], :shrunk {:total-nodes-visited 2, :depth 0, :result false, :smallest [[0]]}}
{% endhighlight %}

Sure, we didn't specify that the vector should consist of unique integers! (How many of you would have tested for this by hand?) test.check tells us the simplest failing case it found.

It's also very easy to integrate test.check's generative tests into clojure.test:
{% highlight clojure %}
(defspec first-element-is-min-after-sorting ;; the name of the test
         100 ;; the number of iterations for test.check to test
         (prop/for-all [v (such-that not-empty (gen/vector gen/int))]
           (= (apply min v)
              (first (sorted v)))))
{% endhighlight %}

Here's an example of test.check in action:

<iframe width="560" height="315" src="https://www.youtube.com/embed/hLqar6VCBGg" frameborder="0"> </iframe>

Here's a very nice example of why generative testing rocks: [Testing a mastermind scoring function](http://www.infoq.com/presentations/Clojure-Generative-Testing)  

And a quick [walkthrough](https://www.youtube.com/watch?v=u0TkAw8QqrQ) of test.check
