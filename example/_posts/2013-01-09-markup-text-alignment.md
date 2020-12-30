---
title: "Markup: Text Alignment and Transformations"
categories:
  - Markup
tags:
  - alignment
  - content
  - css
  - markup
last_modified_at: 2017-03-09T12:17:03-05:00
---

Sample text to demonstrate alignment and transformation classes.

Easily realign text with alignment classes via HTML:

```
<p class="text-left">Left aligned text.</p>
<p class="text-center">Center aligned text.</p>
<p class="text-right">Right aligned text.</p>
<p class="text-justify">Justified text.</p>
<p class="text-nowrap">No wrap text.</p>
```

Or with Kramdown and [inline attribute lists](https://kramdown.gettalong.org/syntax.html#inline-attribute-lists):

```markdown
Left aligned text.
{: .text-left}

Center aligned text.
{: .text-center}

Right aligned text.
{: .text-right}

Justified text.
{: .text-justify}

No wrap text.
{: .text-nowrap}
```

## Default

This is a paragraph. It should not have any alignment of any kind. It should just flow like you would normally expect. Nothing fancy. Just straight up text, free flowing, with love. Completely neutral and not picking a side or sitting on the fence. It just is. It just freaking is. It likes where it is. It does not feel compelled to pick a side. Leave him be. It will just be better that way. Trust me.

## Left Aligned

This is a paragraph. It is left aligned. Because of this, it is a bit more liberal in it's views. It's favorite color is green. Left align tends to be more eco-friendly, but it provides no concrete evidence that it really is. Even though it likes share the wealth evenly, it leaves the equal distribution up to justified alignment.
{: .text-left}

## Center Aligned

This is a paragraph. It is center aligned. Center is, but nature, a fence sitter. A flip flopper. It has a difficult time making up its mind. It wants to pick a side. Really, it does. It has the best intentions, but it tends to complicate matters more than help. The best you can do is try to win it over and hope for the best. I hear center align does take bribes.
{: .text-center}

## Right Aligned

This is a paragraph. It is right aligned. It is a bit more conservative in it's views. It's prefers to not be told what to do or how to do it. Right align totally owns a slew of guns and loves to head to the range for some practice. Which is cool and all. I mean, it's a pretty good shot from at least four or five football fields away. Dead on. So boss.
{: .text-right}

## Justify Aligned

This is a paragraph. It is justify aligned. It gets really mad when people associate it with Justin Timberlake. Typically, justified is pretty straight laced. It likes everything to be in it's place and not all cattywampus like the rest of the aligns. I am not saying that makes it better than the rest of the aligns, but it does tend to put off more of an elitist attitude.
{: .text-justify}

## No Wrap

This is a paragraph. It has a no wrap. Beef ribs pig tenderloin filet mignon. Spare ribs leberkas ribeye, burgdoggen fatback tenderloin biltong jowl flank sirloin hamburger bacon brisket. Shoulder bresaola drumstick capicola. Beef ribs prosciutto porchetta beef.
{: .text-nowrap}

---

Transform text with capitalization classes via HTML:

```html
<p class="text-lowercase">Lowercased text.</p>
<p class="text-uppercase">Uppercased text.</p>
<p class="text-capitalize">Capitalized text.</p>
<p class="text-truncate">Truncated text.</p>
<p class="small">Small text.</p>
```

Or with Kramdown:

```markdown
Lowercased text
{: .text-lowercase}

Uppercased text
{: .text-uppercase}

Capitalized text
{: .text-capitalize}
```

Lowercased text
{: .text-lowercase}

Uppercased text
{: .text-uppercase}

Capitalized text
{: .text-capitalize}

This is a truncated paragraph of text. Bacon ipsum dolor amet shoulder jowl tail andouille fatback tongue. Ham porchetta kielbasa pork pork chop, tenderloin hamburger meatball. Picanha porchetta swine, brisket salami pork belly burgdoggen. Cupim swine pastrami, chuck tri-tip pork belly jowl shankle alcatra brisket capicola ball tip prosciutto beef ribs doner. Tri-tip bacon ground round pork chop burgdoggen leberkas pork strip steak beef corned beef salami.
{: .text-truncate}

Small text
{: .small}
