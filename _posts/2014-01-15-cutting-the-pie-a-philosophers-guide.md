---
layout: post
title: "Cutting the pie - a philosopher's guide"
category: posts
permalink: "cutting-the-pie"
image: /images/pie-slice.jpg
description: "An intro to envy-free division."
keywords:
- cut
- slice
- pie
- cake
- maths
- mathematics
- algorithm
- procedure
- Selfridge–Conway
- Brams–Taylor
comments: true
share: true
image:
  social: 88003DB258.jpg
  social_thumb: 
---

Suppose you have a nice pie you want to share with your friend. Is there a method by which you can do the division in a way both of you will be satisfied, meaning neither of you would feel deceived? Sure there is, you cut the pie in half as perfectly as you can and then you let your friend choose.

That was _easy as a pie_, right? Now, is there a simple procedure for _three_ friends? It turns out to be a classical question in game theory and the family of procedures which present a satisfying answer is called [_envy-free fair division algorithms_](https://en.wikipedia.org/wiki/Envy-free). There's another set of algorithms which are a bit weaker, called [_proportional fair division algorithms_](https://en.wikipedia.org/wiki/Proportional_(fair_division)).

What's the deal with these terms? Fair, envy-free, proportional... let's clarify. Envy-free fair division means that each participant _thinks_ that he was not cheated, that no other player got a bigger piece of the pie. Proportional fair division does not guarantee that, as we'll see.

# Proportional fair division
This is also called the simple fair division. "Simple" is for a reason - this is the simplest and the original solution. It is considered to be weaker than envy-free fair division as it could happen that a player believes he received at least 1/n of the resource but also believes that there is a player that received more than he did.

### The successive pairs algorithm (for 3 people)

 1. Player 1 divides the resource into what he thinks are equal halves.
 2. Player 2 then chooses a half, leaving the remainder for Player 1. 
 3. Each of these two people then divide their respective portions into what they think are equal thirds. 
 4. Player 3 picks two of the resulting portions: one from the first person and one from the second person.

 Now, this sounds good, but it could lead to a situation where the first person thinks that the third player received more than he did (if the portion of the second player's part that the third player chose looks bigger to him - to the first player - than the other portions of the second player part). This is why this procedure is _not envy-free_.

# Envy-free fair division
### The Selfridge–Conway procedure (for 3 people)

#### Stage 1:
1. Player 1 cuts the cake int - what in his view is - 3 equal pieces.
2. Player 2 - if he thinks one piece is bigger than the other - trims from that piece to create what he believes is a 2-way tie for largest piece. The trimmings are set aside. If player 2 thinks that the original split was fair, he does nothing.
3. Player 3 chooses one of the pieces.
4. Player 2 chooses a piece. If the trimmed piece remains, he must choose it. If not, he chooses the one he feels is tied with the trimmed piece for largest.
5. Player 1 gets the remaining piece.

#### Stage 2 (distributing the trimmings):

6. From Player 2 and player 3 take the one who did not receive the trimmed piece and have him divide the trimmings into what he considers 3 equal parts. 
7. The Player who took the trimmed piece chooses one part of the trimmings.
8. Player 1 chooses a piece of the trimmings.
9. The remainder goes to the player who divided the trimmings in step 1 of state 2.

This way no player thinks any other player got a bigger piece than him. Thus this method is envy-free. I leave the proof to the humble reader ;)  

Read more about the [The Selfridge–Conway procedure](http://en.wikipedia.org/wiki/Selfridge–Conway_discrete_procedure)


