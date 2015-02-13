---
layout: post
title: "Brainfuck in Clojure in 40 lines"
category: posts
featured_image: /images/brainfuck.jpg
description: "A cool Brainfuck interpreter in 40 lines of Clojure"
keywords:
- clojure
- brainfuck
- interpreter
- clojure tutorial
- learn clojure
---

<img src="/images/brainfuck_small.jpg" align="left" width="150" height="150" alt="git tips" title="brainfuck" style="margin-right: 10px; margin-bottom: 5px; margin-top: -5px;" />  

[Brainfuck](http://en.wikipedia.org/wiki/Brainfuck) is a cool crazy little language, perfect to write interpreters for. It's rules and syntax are very simple and straightforward, there are only 8 instructions plus an instruction pointer. Several brainfuck compilers have been made smaller than 200 bytes. One compiler of 100 bytes is known to exist. Clojure and Brainfuck have their simplicity in common, so let's implement a BF interpreter in Clojure for fun - for that, we need to look at the syntax and instructions of Brainfuck first.

# No habla Brainfuck? No problemo.

Let's get to know the instruction set we're working with. The 8 instructions are:
<table cellpadding="7" style="background-color: #eee; border: 1px solid black; border-collapse:collapse;">
<tr><td style="border: 1px solid black; border-collapse:collapse;">&gt;</td><td style="border: 1px solid black; border-collapse:collapse;">increment the data pointer (to point to the next cell to the right).</td></tr>
<tr><td style="border: 1px solid black; border-collapse:collapse;">&lt;</td><td style="border: 1px solid black; border-collapse:collapse;">decrement the data pointer (to point to the next cell to the left).</td></tr>
<tr><td style="border: 1px solid black; border-collapse:collapse;">+</td><td style="border: 1px solid black; border-collapse:collapse;">increment (increase by one) the byte at the data pointer.</td></tr>
<tr><td style="border: 1px solid black; border-collapse:collapse;">-</td><td style="border: 1px solid black; border-collapse:collapse;">decrement (decrease by one) the byte at the data pointer.</td></tr>
<tr><td style="border: 1px solid black; border-collapse:collapse;">.</td><td style="border: 1px solid black; border-collapse:collapse;">output the byte at the data pointer.</td></tr>
<tr><td style="border: 1px solid black; border-collapse:collapse;">,</td><td style="border: 1px solid black; border-collapse:collapse;">accept one byte of input, storing its value in the byte at the data pointer.</td></tr>
<tr><td style="border: 1px solid black; border-collapse:collapse;">[</td><td style="border: 1px solid black; border-collapse:collapse;">if the byte at the data pointer is zero, then instead of moving the instruction pointer forward to the next command, jump it forward to the command after the matching ] command.</td></tr>
<tr><td style="border: 1px solid black; border-collapse:collapse;">]</td><td style="border: 1px solid black; border-collapse:collapse;">if the byte at the data pointer is nonzero, then instead of moving the instruction pointer forward to the next command, jump it back to the command after the matching [ command.</td></tr>
</table>

The 'userspace' is like an endless Turing tape, each cell holding a value. The language itself is Turing-complete thus capable of capable of computing any computable function or simulating any other computational model, if given access to an unlimited amount of memory (the cellspace).

# The first steps and some low-hanging fruits

Our Clojure code will operate in a very simple way: it will read a source code file (specified in its first command line argument) into memory then parse it char-by-char, ignoring all non-instruction characters. We'll write a handler for each instruction. So let's see the program's frame.

{% highlight clojure %}
(defn -main [& args]
  (if (nth args 0)
    (bf-interpreter (slurp (nth args 0)))
    (println "Please specify a brainfuck file as the first argument")))
{% endhighlight %}

As simple as that. Slurp will read in the whole file specified by the first argument to a string then call the currently non-existent bf-interpreter function on it. If there were no arguments we output an error message instead.

Let's create the parser frame. It receives a string and iterates over it. It won't parse anything so far.

{% highlight clojure %}
(defn bf-interpreter [program-code]
    (loop instruction-pointer 0]
        (recur (inc instruction-pointer))))
{% endhighlight %}

This is an infinite loop which increments the instruction pointer in each step. Inside the loop body (get program-code instruction-pointer) holds the current instruction. We will define the stop condition later in the parser.
For more info about loop see it's [docs page](http://clojuredocs.org/clojure_core/clojure.core/loop). 

## Let's implement a basic parser with the "+" and "-" instructions.

{% highlight clojure %}
(defn bf-interpreter [program-code]
    (loop [cells [0N], current-cell 0, instruction-pointer 0]
        (condp = (get program-code instruction-pointer)
        \+  (recur (update-in cells [current-cell] inc) current-cell (inc instruction-pointer))
        \-  (recur (update-in cells [current-cell] dec) current-cell (inc instruction-pointer))
        (recur cells current-cell (inc instruction-pointer)))))
{% endhighlight %}

Whoa, it's a bit more, but bear with me, it's really easy. First, we need to extend our loop's local bindings with the cellspace (Turing tape) and the current cell because our two instructions modify them. We're using [condp](http://clojuredocs.org/clojure_core/clojure.core/condp) which is a conditional macro with multiple clauses and a default one. It's first parameter is the predicate, which is the equality for now '='. The second parameter is the expression ((get program-code instruction-pointer) which is the current instruction we're parsing). Then the two clauses come (+ and -) and the last is the default one, which is the same as before extended with the new loop local bindings - this means that if we see an unknown instruction, we just skip it and jump to the next one (inc instruction-pointer). Easy as a pie. The cells have 0N as a default value - why not 0? 0N means it's a bignum, for a few examples this is needed to avoid overflows (fibonacci, for example).

Now let's see the '+' instruction's clause. 
This instruction means that we should increment the value held in the current cell then jump to the next instruction. We're doing exactly that. [update-in](http://clojuredocs.org/clojure_core/clojure.core/update-in) calls a function to a specific element (inc in our case) and returns a new associative structure - note that this is NOT mutability! The original values are not changed in any way (cells is still the same after this), we're getting a new value. We pass this value back to our loop's next cycle and we're also incrementing the instruction pointer. The '-' instruction has the same implementation (we could have written a helper function for it easily, consider it homework ;)).

## Input and output

For two other instructions (, and .) we need to handle input and output. We will use the stdin and stdout. 

{% highlight clojure %}
(defn bf-interpreter [program-code]
    (loop [cells [0N], current-cell 0, instruction-pointer 0]
        (condp = (get program-code instruction-pointer)
        \+  (recur (update-in cells [current-cell] inc) current-cell (inc instruction-pointer))
        \-  (recur (update-in cells [current-cell] dec) current-cell (inc instruction-pointer))
        \.  (do
                (print (char (nth cells current-cell)))
                (recur cells current-cell (inc instruction-pointer)))
        \,  (let [ch (.read System/in)]
                (recur (assoc cells current-cell ch) current-cell (inc instruction-pointer)))
        (recur cells current-cell (inc instruction-pointer)))))
{% endhighlight %}

It's straightforward I think. For the '.' instruction (print the current cell's value) we're using the [do](http://clojure.org/special_forms#Special%20Forms--(do%20exprs*)) special form which simply evaluates all the expressions inside and returns the value of the last one (we're not using the value). After we've printed the value we're finishing the loop the same old way.

For the input instruction (,) we're defining a local binding 'ch' which gets the value of the next character from the standard input (.read System/in) and we're calling [assoc](http://clojuredocs.org/clojure_core/clojure.core/assoc) to set the new value in 'cells' at the current-cell index. This again is NOT mutability as assoc also returns a new structure which we pass to loop via recur. And of course we're increasing the instruction pointer.

## Now for the harder parts. &lt; and &gt;

Actually &lt; is easy. For now I'm just showing the new clauses so we can focus.

{% highlight clojure %}
                \<  (recur cells (dec current-cell) (inc instruction-pointer))
                \>  (let [
                            next-ptr (inc current-cell)
                            next-cells (if (= next-ptr (count cells)) 
                                            (conj cells 0N) 
                                             cells)]
                            (recur next-cells next-ptr (inc instruction-pointer)))
{% endhighlight %}

Wait, WHAT? So, for &lt; - we're decreasing the current cell index (we need to step back one in the cellspace/Turing tape) then we loop again. It makes sense.  
&gt; on the other hand needs some thought. There are two cases: either we're at the end of the cellspace or we're behind. If we're at the end, let's extend our cellspace by one cell (with a default value of 0N, just like before). If we're not at the end, the case is really simple - we just need to move one cell forward. The two helper expressions reduce duplication. next-ptr is the value of the next cell's index (current-cell + 1), next-cells is the new cellspace (either extended with the new cell or the same as the current). Then we loop. Wasn't that hard, was it?

## A really tough one: [ and ]

For this we need some nifty bracket matching solution. I've got just the thing.

{% highlight clojure %}
        find-bracket (fn [opening-bracket closing-bracket instruction-pointer direction]
            (loop [i (direction instruction-pointer) opened 0]
                (condp = (nth program-code i)
                    opening-bracket (recur (direction i) (inc opened))
                    closing-bracket (if (zero? opened) i (recur (direction i) (dec opened)))
                    (recur (direction i) opened))))
{% endhighlight %}

It needs an opening bracket character, a closing bracket character (so it can identify them in the instruction set), the current instruction pointer and a direction to match (forward or backward). We need to loop through our program code until we find a matching closing bracket. Direction is a bit tricky, as it's a function, either dec or inc. The loop clauses are quite straightforward: if we're currently at an opening bracket (sure we are, that's where we start), lets step one in the direction specified. We also have a helper counter, 'opened', which holds the number of opened brackets we've seen so far. And no, it won't always be 1, because the code we're looking throught might have other opening-closing bracket pairs which we'll need to skip to find our one and only matching closing bracket (imagine [...[..]...]). If we're at a closing bracket, check if the number of opened brackets are zero - if yes, we've found our closing bracket, let's return the instruction pointer we need (either one before or one after the found bracket, this is decided by the direction, but we already have the correct value in 'i' at this point). If the number of opened brackets is not zero, we've only found an internal closing bracket which we need to skip while decreasing the number of opened brackets. In any other case (when we find any other instruction) we just skip it and move one in our direction. 
I know it seems like much but just let it sink in and try to simulate the loops in your head for a simple case ([..[.]..])

Now we're ready to implement the parser for [ and ]

{% highlight clojure %}
                \[  (recur cells current-cell (inc (if (zero? (nth cells current-cell))
                        (find-bracket \[ \] instruction-pointer inc)
                        instruction-pointer)))
                \]  (recur cells current-cell (find-bracket \] \[ instruction-pointer dec))
{% endhighlight %}

This does just exactly what the instruction's descriptions say using our helper 'find-bracket'.

## A catch - the stop condition

Easy. If we've read all of our instructions, we'll get a nil in current-cell, let's just bail out of the loop. Here's the full code:


{% highlight clojure %}
(defn bf-interpreter [program-code]
    (let [
        find-bracket (fn [opening-bracket closing-bracket instruction-pointer direction]
            (loop [i (direction instruction-pointer) opened 0]
                (condp = (nth program-code i)
                    opening-bracket (recur (direction i) (inc opened))
                    closing-bracket (if (zero? opened) i (recur (direction i) (dec opened)))
                    (recur (direction i) opened))))]

        (loop [cells [0N], current-cell 0, instruction-pointer 0]
            (condp = (get program-code instruction-pointer)
                \<  (recur cells (dec current-cell) (inc instruction-pointer))
                \+  (recur (update-in cells [current-cell] inc) current-cell (inc instruction-pointer))
                \-  (recur (update-in cells [current-cell] dec) current-cell (inc instruction-pointer))

                \>  (let [
                            next-ptr (inc current-cell)
                            next-cells (if (= next-ptr (count cells)) 
                                            (conj cells 0N) 
                                             cells)]
                            (recur next-cells next-ptr (inc instruction-pointer)))

                \.  (do
                        (print (char (nth cells current-cell)))
                        (recur cells current-cell (inc instruction-pointer)))
                \,  (let [ch (.read System/in)]
                        (recur (assoc cells current-cell ch) current-cell (inc instruction-pointer)))
                \[  (recur cells current-cell (inc (if (zero? (nth cells current-cell))
                        (find-bracket \[ \] instruction-pointer inc)
                        instruction-pointer)))
                \]  (recur cells current-cell (find-bracket \] \[ instruction-pointer dec))
                nil cells
                (recur cells current-cell (inc instruction-pointer))))))

(defn -main [& args]
  (if (nth args 0)
    (bf-interpreter (slurp (nth args 0)))
    (println "Please specify a brainfuck file as the first argument")))
{% endhighlight %}

You can find the same code in a working lein project on [github](https://github.com/ochronus/brainfuck-clj)

Congratulations, we've just written a fully functional Brainfuck interpreter in a few lines of Clojure!




