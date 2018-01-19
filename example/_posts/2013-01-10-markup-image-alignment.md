---
title: "Markup: Image Alignment"
categories:
  - Markup
tags:
  - alignment
  - captions
  - content
  - css
  - image
  - markup
last_modified_at: 2017-03-09T11:15:57-05:00
---

The best way to demonstrate the ebb and flow of the various image positioning options is to nestle them snuggly among an ocean of words. Grab a paddle and let's get started.

Assign classes with HTML:

```html
<img src="image.jpg" class="align-left" alt="">
<img src="image.jpg" class="align-center" alt="">
<img src="image.jpg" class="align-right" alt="">
```

Or use Kramdown and [inline attribute lists](https://kramdown.gettalong.org/syntax.html#inline-attribute-lists):

```markdown
![left-aligned-image](image.jpg){: .align-left}
![center-aligned-image](image.jpg){: .align-center}
![right-aligned-image](image.jpg){: .align-right}
```

![image-center]({{ site.url }}{{ site.baseurl }}/assets/images/image-alignment-580x300.jpg){: .align-center}

The image should be **centered** with the `.align-center` class.

![image-left]({{ site.url }}{{ site.baseurl }}/assets/images/image-alignment-150x150.jpg){: .align-left} The rest of this paragraph is filler for the sake of seeing the text wrap around the 150×150 image, which is **left aligned** with the `.align-left` class.

As you can see the should be some space above, below, and to the right of the image. The text should not be creeping on the image. Creeping is just not right. Images need breathing room too. Let them speak like you words. Let them do their jobs without any hassle from the text. In about one more sentence here, we'll see that the text moves from the right of the image down below the image in seamless transition. Again, letting the do it's thing. Mission accomplished!

And now for a **massively large image** --- it has **no alignment**.

![no-alignment]({{ site.url }}{{ site.baseurl }}/assets/images/image-alignment-1200x4002.jpg)

The image above, though `1200px` wide, should not overflow the content area. It should remain contained with no visible disruption to the flow of content.

![image-right]({{ site.url }}{{ site.baseurl }}/assets/images/image-alignment-300x200.jpg){: .align-right}

And now we're going to shift things to the **right** with the `.align-right` class. Again, there should be plenty of room above, below, and to the left of the image. Just look at him there --- Hey guy! Way to rock that right side. I don't care what the left aligned image says, you look great. Don't let anyone else tell you differently.

In just a bit here, you should see the text start to wrap below the right aligned image and settle in nicely. There should still be plenty of room and everything should be sitting pretty. Yeah --- Just like that. It never felt so good to be right.

And just when you thought we were done, we're going to do them all over again with captions!

<figure class="align-center">
  <a href="#"><img src="{{ site.url }}{{ site.baseurl }}/assets/images/image-alignment-580x300.jpg" alt=""></a>
  <figcaption>Look at 580 x 300 <a href="#">getting some</a> love.</figcaption>
</figure> 

The figure above happens to be **centered**. The caption also has a link in it, just to see if it does anything funky.

<figure style="width: 150px" class="align-left">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/images/image-alignment-150x150.jpg" alt="">
  <figcaption>Itty-bitty caption.</figcaption>
</figure> 

The rest of this paragraph is filler for the sake of seeing the text wrap around the 150×150 image, which is **left aligned** with the `.align-left` class.

As you can see the should be some space above, below, and to the right of the image. The text should not be creeping on the image. Creeping is just not right. Images need breathing room too. Let them speak like you words. Let them do their jobs without any hassle from the text. In about one more sentence here, we'll see that the text moves from the right of the image down below the image in seamless transition. Again, letting the do it's thing. Mission accomplished!

And now for a massively large image with **no alignment**.

<figure style="width: 1200px">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/images/image-alignment-1200x4002.jpg" alt="">
  <figcaption>Massive image comment for your eyeballs.</figcaption>
</figure> 

The figure element above has an inline style of `width: 1200px` set which should case it to break outside of the normal content flow.

<figure style="width: 300px" class="align-right">
  <img src="{{ site.url }}{{ site.baseurl }}/assets/images/image-alignment-300x200.jpg" alt="">
  <figcaption>Feels good to be on the right.</figcaption>
</figure> 

And now we're going to shift things to the **right** with the `.align-right` class. Again, there should be plenty of room above, below, and to the left of the image. Just look at him there --- Hey guy! Way to rock that right side. I don't care what the left aligned image says, you look great. Don't let anyone else tell you differently.

In just a bit here, you should see the text start to wrap below the right aligned image and settle in nicely. There should still be plenty of room and everything should be sitting pretty. Yeah --- Just like that. It never felt so good to be right.

And that's a wrap, yo! You survived the tumultuous waters of alignment. Image alignment achievement unlocked!