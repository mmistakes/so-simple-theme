---
layout: post
author: santy
year: 2017
title: Singapore, full steam ahead!
type: Blog
excerpt: "Back in Singapore, preparing for two conferences: Expressive and Siggraph 2017 (Feb 2017 - Aug 2017)"
categories: blog
tags: [conference, NPR, MNPR, research]
image:
  path: images/headers/singapore2017.jpg
  caption: Chinatown, Singapore, Spring 2017
  card: images/cards/singapore2017.jpg
  thumbnail:
comments: true
share: true
read_time: true
---

What an amazing opportunity, being able to present our work at both Expressive 2017 and Siggraph 2017 in Los Angeles! I have written most of this blog post during my long flight home, making the most of my 17 hours sitting in an airplane... And it's been almost two months since then. So much happened once I came back that I didn't find the time to update you all. Way too much to tell in one blog post, so in this blog post will only encompass my adventures during the past months before Siggraph and Expressive. Let's start were we left things off.

## Submissions, why not?

--- January-March
{: .subtitle}

Because of the amount of time and effort put into the extended journal paper that we submitted to Computers & Graphics, it was not realistic to think about submitting a technical paper with new material to Siggraph 2017 anymore. However, that could not mean that we could not try participating in the conference somehow, so I decided to try my luck and apply for another Siggraph event: [_Real-Time Live!_](http://s2017.siggraph.org/content/real-time-live). I really mean "to try my luck", as my hopes were not really high. Most presentations given at _Real-Time Live!_ are usually given by professionals in the industry (Epic, nVidia, Unity, etc) - and this year was not an exception. The good thing is that the submission does not require much time to do... so why not try it out anyways?

From my time in Grenoble, we decided to split and focus our future work into two areas. The first area would concern the enhancement of the watercolor look through additional missing effects and the other area would push towards usability of NPR in object-space. Our attention focused on the first area, but we were in no particular rush, exploring different ways to approach watercolor effects such as gaps \& overlaps and the dry-brush application. This was good, as there was no imminent deadline and I had to work a lot for the University back here in Singapore. We are required to work a total amount of 416 hours for the University within our PhD candidacy, which we need to complete 6 months before Thesis submission. These hours are thankfully almost over now.

And then it happened again, the website for [Expressive 2017](https://expressivesymposium.com/) went online and the next deadline was set. It was extremely short notice, but through some encouragement from my supervisors, I decided to turn on my robot mode and pursue it after all. This meant that I had only one month to finish implementing approaches (most existed only in theory), write and submit our paper. Thankfully, I had some more help this time, as my supervisors agreed to help me write some parts of the paper, especially concerning the introduction and related work (thanks!). So, within two weeks of seriously focused work and way too much overtime, I had mostly implemented the effects we wanted to showcase. The paper concentrates in edge- and substrate-based effects for watercolor stylization, which were required to emulate gaps \& overlaps and the dry-brush application. However, through our investigation, we also found ways on improving previous approaches towards darkened edges and substrate granulation/lighting. The remaining two weeks were invested in debugging the code, writing the technical paper, creating results and a small rough demonstration video. Even though I was not satisfied with our visual results, we knew the supporting technical approaches were sound and submitted anyways.

Unfortunately, I couldn't take some time off after these submissions, as the semester was still going and I was a teaching assistant for _Rigging for Animation_ at the School of Art, Design and Media (ADM). Nonetheless, I still managed to bring back a desirable work/life balance that I truly enjoyed.

## Back to normal
--- April-June
{: .subtitle}

At the beginning of April, the semester finally ended and I took a week-long staycation for the first time. A staycation is a popular concept in Singapore where you take a vacation, but stay in Singapore. This gives you the opportunity to explore many places within this small, but diverse country. There are so many things to see here! Most people usually only come for a few days, but Singapore has a lot more to offer. I have been here for three years and there are still many things to discover - apart from the tourist spots. It was great, especially since my girlfriend had some time off too, so we could both spend some quality time together.

<!-- PHOTOS OF SINGAPORE -->
<figure class="pull-center half">
	<a href="/images/2017/singapore7.jpg"><img src="/images/2017/singapore7_low.jpg" alt="image"></a>
  <a href="/images/2017/singapore8.jpg"><img src="/images/2017/singapore8_low.jpg" alt="image"></a>
	<figcaption>Staycation in Singapore</figcaption>
</figure>

Along other usual work-related things, I had the opportunity to conduct a half-day Prezi Workshop for my fellow PhD students, so I prepared a [Prezi](https://prezi.com/w8eaioo1ld6s/prezintation/) about Prezi! It was a fantastic opportunity to help my peers and to write down all that I have learnt while using this presentation software during these past years. The workshop was well received and I'm looking forward to seeing what the other students from my faculty start creating. I also tried Prezi Next, which is their next product for presentations. However, I find it extremely limiting in terms of design and layout. As soon as the presentation is a little more complex than a few slides, I would recommend anyone to use Prezi Classic instead. In case you just signed up and don't have access to Prezi Classic, you can create a blank Prezi Classic presentation from [here](http://www.prezi.com/instant-prezi).

At the beginning of May we heard back from the Expressive Symposium and... the paper was accepted! This was amazing and a real motivation boost. There were some minor revisions required here and there, but since I had an entire month to do them, I took the time to significantly improve upon the visual results. This was necessary for me to have some peace of mind as an artist. Additionally, the better results would also benefit the presentations at both, Expressive and, potentially, Real-Time Live! (Siggraph). Our technical paper - Edge- and substrate-based effects for watercolor stylization - can be found in this website under this [link](/articles/Edge-and-substrate-based-effects-for-watercolor-stylization/) at the bottom and at the [ACM digital library](https://dl.acm.org/citation.cfm?id=3092928). While creating the new renders and revising the Expressive paper, I also got the news that my submission to present at _Real-time Live!_ had been accepted... Hell yeah! Both submissions worked out in the end and it still feels kind of unreal.

To facilitate the initial stylization of scenes using the direct stylization framework ([MNPR](http://artineering.io/projects/Maya-NPR/)), I also developed a simple tool to save and load global stylization presets. This small but handy tool saves the stylization attributes in a json file and automatically creates a stylized screenshot for easy identification. These presets can then be loaded back at any time. I put special consideration in making this tool as generic as possible, so that it could easily be applied to any other objects with attributes. This means that you can also store character poses, render globals, etc. I will be releasing these tools later on as part of the studio-coop open source tools. These are a series of handy tools and shelves that I have developed for my research and the courses where I was a teaching assistant.

In June, my parents came to visit, all the way from Ecuador. I only see my family twice a year, so it is always a special time when we are together. They stayed in Singapore for one week and then I travelled with them for another week. We went to Cambodia first, which has become one of my favorite countries in South East Asia. The people are super nice and humble, the temples surrounding Siem Reap are breathtaking and the beers at the bars, for as low as 25ct, were unbeatable. Cambodia is also a culinary adventure as it is commonplace since the Pol Pot years to eat all kinds of bugs and animals. After Cambodia, we flew to Langkawi, which is a small Malaysian island close to Thailand. Langkawi was also good, but we came during Ramadan, which means that all the night markets and most restaurants are closed. Nonetheless, I was pleasantly surprised by the first world infrastructure they have developed and the nice beaches.

<!-- PHOTOS OF CAMBODIA AND LANGKAWI -->
<figure class="pill-center half">
	<a href="/images/2017/cambodia1.jpg"><img src="/images/2017/cambodia1_low.jpg" alt="image"></a>
  <a href="/images/2017/cambodia2.jpg"><img src="/images/2017/cambodia2_low.jpg" alt="image"></a>
</figure>
<figure class="align-center">
<a href="/images/2017/langkawi1.jpg"><img src="/images/2017/langkawi1_low.jpg" alt="image"></a>
<figcaption>Memories of Siem Reap and Langkawi</figcaption>
</figure>

## Polishing and preparing

--- July
{: .subtitle}

July was a month in which most of my time was dedicated into polishing the user interface and creating the presentations. As both submissions were accepted and I wanted/had to do a live demo of the technology for each presentation, I dedicated most of my time to this.

The first focus was on improving upon the paintFX UI, which enables artists to paint their desired effects parameters within the vertex colors. Since the amount of effects and options had grown from our initial implementation, it became increasingly hard to find and manipulate the desired effects. Most of the UI was also hard coded and not easily scalable, so it would present problems when generalizing our direct stylization framework to other styles. As it can be seen in the comparison below, with even more options than before, the new UI is much clearer, even though the dimensions are smaller. A lot of custom GUI classes were developed, but this effort makes for some seriously modular code, which is scalable and easy to manipulate, while preserving a concise and clear UI.

<!-- COMPARISON OF THE OLD AND NEW UI -->
<figure class="pull-center">
	<a href="/images/2017/oldUI1.jpg"><img style="max-width:258px;" src="/images/2017/oldUI1_low.jpg" alt="image"></a>
  <a href="/images/2017/newUI1.jpg"><img style="max-width:270px;" src="/images/2017/newUI1_low.jpg" alt="image"></a>
	<figcaption>PaintFX UI (before-after)</figcaption>
</figure>

For the Expressive presentation, I decided to once again use Prezi, even though it tends to take more time than a Power Point presentation to create. I really like using Prezi, as it helps me communicate better what I want to say. It allows me to visually present things clearer by digging deeper into a specific detail, giving an overview of an approach and navigating the entire presentation in a structured way. Additionally, I find that the smooth transitions (in moderate measure) keep the audience awake, which is excellent for technical presentations.

For the Real-Time Live! presentation, no slides were allowed. This presented a special challenge for me, as I usually use slides to back me up and remember what to say next. I'm remarkably bad at memorizing things word by word, you will get to know this as soon as you start singing songs with me. Thankfully, I was given some decent improvisation skills instead, which I tend to rely heavily on while presenting. Nonetheless, I still wanted the 6 minutes on-stage (which would be recorded and live-streamed) to be as clear and concise as possible. This required some practice, especially when thinking about the 3000 seats that would be in front of me during the presentation.

To top it all up, three days before I had to leave for Los Angeles, a PC case (Sentry case), which I purchased from a crowdfunded campaign, finally came to Singapore. It is a small-form-factor case (about the size of an Xbox One) that I purchased especially for when I need some mobile raw power. So, three days before flying off, I was building the workstation I would take with me, from scratch! My flat mates praised my ability to remain calm at my current situation... The workstation thankfully worked perfectly and all the components that were flown from the US, Japan and Poland presented no problems whatsoever (\*Phew\*).

Everything was finally prepared for Expressive and Siggraph, so I embarked on my 19 hour flight from Singapore to Los Angeles (via Tokio). Nonetheless, I still used the time on the airplane to work on new shelf icons - things need to look pretty and uniform when they will even be recorded ;).

And that's it for this blog post! Sorry to break the suspense, but otherwise this post would become way too long. Now you have something to look forward to though, thanks for reading! However, before leaving you out in the blue, you can watch the recording of the actual presentation that I gave for _Real-Time Live!_ at Siggraph [here](/articles/Direct-3D-stylization-pipelines/).


Until next time,


Santiago.
