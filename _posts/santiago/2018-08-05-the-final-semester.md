---
layout: post
author: &author santiago
categories: *author  # referencing the author variable
year: 2018
title: The final semester
type: Blog
excerpt: "My final semester as a PhD student, open-sourcing code, juggling papers, thesis and somehow keeping up with life in Singapore, China, Malaysia, Indonesia and Japan (Jan 2018 - Aug 2018)"
tags: [Santiago, MNPR, EF]
image:
  path: images/about/santiago/2018/final-semesterHeader.jpg
  caption: Wandering the streets of Hong Kong, China.
  card: images/about/santiago/2018/final-semesterCard.jpg
  thumb:
comments: true
share: true
read_time: true
redirect_from:
  - /blog/the-final-semester
---
{%- assign imgPath = "/images/about/santiago/2018" -%}

The first 7 months of 2018 were most likely the toughest of my life... I knew what was coming, but I completely underestimated it. Between writing my final paper as a PhD student, open-sourcing code and writing my thesis, I've never spent so much time looking at words that somehow need to flow logically. I was writing so much, that I seriously needed to take a break from it---which explains the delay of this post and my absence from the blog.


## Ready, set, go!
--- January - February 5th
{: .subtitle}

At last, the final year of my PhD studies began! I began the year by taking some time to research different ways to control the stylization in object-space. While painting effects onto objects is useful, when many objects are involved, stylizing all these assets becomes quite tedious and time-consuming. Therefore, I had to find a way to stylize several parts and objects at the same time. The idea was to try to cover most of the interaction spectrum to facilitate a faster and better stylization workflow (more details can be found on my [latest paper](/articles/MNPR/)).

I had been toying around with the idea of having invisible 3D volumes that only assign specific types of effects to whatever is inside that volume. The easy course of action was to create a 3D mesh proxy object that only renders into the control targets. This works well for simple cases, but as the geometry gets projected, these mesh volumes act more like shells, instead of actual volumes. So I opted for creating ray-marched volumes that would assign different effects, instead. The results were promising (ray-marching in the Maya viewport FTW!) and allowed us to explore different application scenarios, which might require volume proxies to act in 2D, 2D + depth and 3D space. Unfortunately, I had to put ray-marching on hold, as time was running short and the _[Expressive 2018](http://expressive.graphics/2018)_ deadline was coming in April.

While working on the volume proxies---I was in need of something more rudimentary to do---I started porting the new shaders and algorithms from _HLSL_ to _GLSL_. It's crazy how much the code changed since the first port to _GLSL_ was made by one of my French adoptive supervisors _[Pierre Bénard](http://www.labri.fr/perso/pbenard/)_. This was also a great opportunity to polish and comment the code properly, so that developers could have it easier when reading it, once open-sourced.

At the beginning of February, I was invited and flown to Shanghai by [Nuctopus Animation Studio](http://www.nuctopus.com/). They wanted to test out the watercolor look for one of their future animated productions. The co-founders are young professionals that got fed up of working for an animation company that was only interested on maximizing their income and not making good films. Therefore, they created their own animation studio and are doing some impressive work! In my brief time there, I also got to understand many production requirements, which one doesn't normally consider in academia. It was an incredibly fun trip and we have continued working together ever since.

<!-- PHOTOS OF SHANGHAI -->
<figure class="pull-center half">
	<a href="{{imgPath}}/singapore1.jpg"><img src="{{imgPath}}/singapore1_low.jpg" alt="image"></a>
  <a href="{{imgPath}}/shanghai1.jpg"><img src="{{imgPath}}/shanghai1_low.jpg" alt="image"></a>
  <figcaption>Memories with old friends in Singapore and new friends in Shanghai</figcaption>
</figure>


## A visitor from Germany
--- February 6th - March
{: .subtitle}

At the beginning of February, a researcher from the [Hasso-Plattner Institut](https://hpi.de/en.html) in Berlin, Germany, came to join me for three months in Singapore. The talented [Dr. Amir Semmo](http://asemmo.github.io/) came for a research visit and we started working together to port his work in oil paint rendering to the stylization framework that I was creating. This way, he could explore and apply his research onto 3D and embed art-direction to it. For me, this was a great opportunity to expand on the watercolor framework and make it stylization agnostic, and to experiment with cross-stylization hypotheses that I had in mind for some time.

<!-- PHOTOS OF SINGAPORE WITH AMIR -->
<figure class="pull-center">
	<a href="{{imgPath}}/singapore2.jpg"><img src="{{imgPath}}/singapore2_low.jpg" alt="image"></a>
  <figcaption>Memories of Singapore with Amir</figcaption>
</figure>

Amazingly, Amir roughly ported most of his stylization within 2 weeks, so we could test things out right away! He could then concentrate on embedding art-direction, polishing his approach and research how to make it even better in 3D. In the meantime, I decided to shift the 3D materials of the framework onto _[ShaderFX](http://www.shaderfx.com/)_. _ShaderFX_ is a node-based shader authoring framework available in _Autodesk_ products. It's extremely flexible and automatically creates the shader code in _HLSL_ or _GLSL_ depending on the active graphics' _API_ (_DirectX_ or _OpenGL_). This would save the hassle of creating and maintaining two versions of the shader code for different platforms (Windows, Linux or macOS). In addition to that, I could programmatically modify the shader depending on the necessary features, avoiding unnecessary computation costs. It's a powerful framework, that is unfortunately terribly documented. Not even the _shaderfx_ command can be found in the official _[Technical Documentation](http://help.autodesk.com/view/MAYAUL/2018/ENU/?guid=__Commands_index_html)_ of _Maya_ (the only way to get something is by writting `shaderfx -h;` in the _Script Editor_). Amir also experimented with packing/unpacking all four stylization targets, with their respective parameters, into two targets. Unfortunately, we had to scrap this for the time being, as it brings problems with transparency and multi-pass rendering.

During this time period, I was also accepted as part of the next cohort of _[Entrepreneur First](https://www.joinef.com/)_ (EF) in Singapore! The recruiters had approached me back in 2017 to join their programme, but I couldn't at the time because I was in the middle of my studies (which I wanted to finish, after all). Nonetheless, they came back to me again a year later and I went through their interview process. Shortly after, I got the confirmation that I had been accepted as part of the _EFSG4_ cohort, to be started in August 2018. It was perfect, I knew what I was doing after my PhD, I just needed to actually finish it...

After moving to the materials to the _ShaderFX_ framework, I worked on new tools to art-direct the 3D stylization throughout the interaction spectrum. The volumes that I had previously worked on came into play, in its basic geometric proxy representation. Being represented by geometry was not the most elegant solution, but it allowed them to be intuitively used by artists in a flexible manner and to control the stylization at all levels of control i.e., placed in front of the camera (stylizing everything) or localized in a small part of the scene (stylizing small parts). Working with _ShaderFX_ materials also brought the opportunity to work with procedural control of effects upon demand, which motivated the development of the _NoiseFX_ tool. The _NoiseFX_ tool automatically modifies the material according to the desired procedural control for any effect. These two new levels of control worked great for me, but they had to be tested and evaluated in a proper user study to objectively understand their impact on an art-directed stylization workflow. So, I embarked again in creating almost 30 minutes of video tutorials and recruit interested artists to test out _[MNPR](/projects/Maya-NPR)_, the _Maya Non-Photorealistic Rendering_ framework (the official name of the framework I was creating).


## A short break in Hong Kong
--- March 29th - April 2nd
{: .subtitle}

Somehow, it is never a good time to leave for vacation as a PhD student, but it needs to be done. Even though the deadline of _[Expressive 2018](http://expressive.graphics/2018)_ was approaching rapidly, I took a short break with my girlfriend and we flew to _Hong Kong_. I still had to work a bit from there, but I managed to wrap up the required user study material and send out all the recruitment emails. Fortunately, this didn't take too much time, and we were soon exploring the city and its surroundings.

Hong Kong is an incredible city with many sides. We personally loved walking through the city and being surrounded by the variety of tall buildings everywhere, especially at night. The rides with the tram and ferry were also a must. With the dramatic mountains and forests right next to the city, the surrounding nature is also amazing and worth exploring. We hiked the Dragon's Back and even walked all the way up to the Victoria Peak! If you are in the area, make sure to check out Hong Kong!

<!-- PHOTOS OF HONG KONG -->
<figure class="pull-center half">
	<a href="{{imgPath}}/hongkong1.jpg"><img src="{{imgPath}}/hongkong1_low.jpg" alt="image"></a>
  <a href="{{imgPath}}/hongkong2.jpg"><img src="{{imgPath}}/hongkong2_low.jpg" alt="image"></a>
  <figcaption>Memories of Hong Kong</figcaption>
</figure>


## Wrapping up my final paper
--- April 3rd - April 16th
{: .subtitle}

Once back in Singapore, it was time to get the paper finished. The oil paint stylization that Amir made was working quite well and the student that I had the opportunity to unofficially mentor for her final year project, _Yee Xin Chiew_, had also successfully managed to create a charcoal stylization within the framework. This gave me enough material to work on something that had been in my mind for a while: _Is there a way to port the art-direction from one style to another?_

To answer this, we had to find a correlation between the different effects, group them under a relevant semantic name and bind the parameters to a control scheme. To exemplify this, we can consider color bleeding in watercolor and smudging in charcoal. These effects are used similarly by combining and abstracting the surrounding colors. If we art-direct in watercolor and bleed certain things out, these can also be smudged under a charcoal stylization, as well. This theory actually worked, which was incredibly exciting for me.

From the 65 artists that registered their interest to participate in the user study, 20 artists managed to successfully conduct it and fill out the questionnaire. From this gathered data, we could evaluate the usefulness over each level of control and also gather feedback on how to improve the existing tools. The user study was a success and strengthened the contribution, which just needed to be written... After some seriously intense days of writing (I had to write most of the paper in one week) and thanks to a deadline extension (which allowed me to create a proper video), we managed to submit the paper with our findings - _[MNPR: A Framework for Real-Time Expressive Non-Photorealistic Rendering of 3D Computer Graphics](/articles/MNPR)._

That was it, my last paper as a student had been submitted, it felt surreal.


## A small retreat
--- April 17th - May 5th
{: .subtitle}

I took a few days off to recover, but I came back to the lab revitalised with one goal in mind: Get the code ready to open-source. This was a great change of pace and I enjoyed cleaning up and documenting my work. I was finally acquiring a sense of closure.

I did not just work during this period though, I went on a dude's trip with Amir and a friend of ours from MAGIC, Vinayak Teoh. We took a plane to Kuala Lumpur, Malaysia, and then made a road trip all the way to Sungai Lembing. It was awesome to be on the road again, it must have been years since I was in a car at high speed with loud music and good company. Sungai Lembing is a small town on the east coast of Malaysia with an amazing Ramly Burger (the one's from the shady corner) and a lot of charm. It's also quite close to a beautiful beach in Teluk Cempedak, were we had to take a mandatory bad dudes picture ;).

<!-- PHOTOS OF SINGAPORE WITH AMIR -->
<figure class="pull-center half">
  <a href="{{imgPath}}/malaysia2.jpg"><img src="{{imgPath}}/malaysia2_low.jpg" alt="image"></a>
	<a href="{{imgPath}}/malaysia1.jpg"><img src="{{imgPath}}/malaysia1_low.jpg" alt="image"></a>
  <figcaption>Memories of Teluk Cempedak</figcaption>
</figure>


Another highlight during this period was my third trip to China that year. This time, Nuctopus invited me over to Beijing, to meet up with one of their production partners [BigBigSun](http://www.bigbigsun.com/). The studio is quite big, as the name implies, with many animated projects in production and friendly people. I was there to explain how to best use the watercolor stylization technology that I developed, for a project that they will do with Nuctopus. It was a unique experience, full of challenges and language barriers to overcome, but ultimately quite productive and fun. We also had some time to tourist around and some amazing meals full of exotic surprises.

<!-- PHOTOS OF Malaysia and Beijing -->
<figure class="pull-center half">
  <a href="{{imgPath}}/beijing2.jpg"><img src="{{imgPath}}/beijing2_low.jpg" alt="image"></a>
	<a href="{{imgPath}}/beijing1.jpg"><img src="{{imgPath}}/beijing1_low.jpg" alt="image"></a>
  <figcaption>Memories of Beijing</figcaption>
</figure>

Once I was back from Beijing, reality hit me... I had to submit my thesis in three months!

## 3 months left, what thesis?
--- May 6th - July 17th
{: .subtitle}

Three months is not a lot of time, especially considering that my parents were coming and we wanted to go to Japan by mid-July---for the last family vacation before work-life would start. I quickly scheduled a meeting with my supervisors to discuss the formalities and the content of the thesis and I began to work through the biggest crunch time of my life.

The contribution was already there in the form of my published papers and my qualifying examination (QE) report, but it all still had to fit into a dissertation format. That meant I had to compile the past 4 years of work into one cohesive and well-structured document. I've been through several crunch times, but none which lasted this long. I was writing my thesis everywhere, at all times i.e., in the train, in the bus, in the lab, at home, in bed, on the loo... I had to get it done! It was not healthy, and I was seeing days pass without really enjoying them. It was probably one of the darkest periods of my life, which was thankfully bearable because I had such a supporting girlfriend.

Fortunately, between all the writing, the acceptance of my paper to _[Expressive 2018](http://expressive.graphics/2018)_ came with only some minor revisions! I quickly revised the paper within a day and, with the source-code ready, I submitted the final version of my last paper as a PhD student. Woah, it still kind of gives me the chills to say that. I also took the opportunity to promote the open-sourcing of my code and to plan what I would later call: the PhD tour. More about that in the next blog post.

There was one other short break from writing, as the EF's Kick-Off Weekend took the entire EFSG4 cohort to Bintan, Indonesia! It was an entire weekend to get to know the other entrepreneurs and potential co-founders in a completely different setting---with sand under our feet. It was awesome!! Fully packed with activities, good food and beers, the idea was to get to know as many other founders as possible. It was a complete success and everyone thoroughly enjoyed it. It was the perfect break for me to get enough strength for the final stretch.

<!-- PHOTOS OF KOWE -->
<figure class="pull-center half">
	<a href="{{imgPath}}/kowe1.jpg"><img src="{{imgPath}}/kowe1_low.jpg" alt="image"></a>
  <a href="{{imgPath}}/kowe2.jpg"><img src="{{imgPath}}/kowe2_low.jpg" alt="image"></a>
  <figcaption>Memories of EF's Kick-Off weekend.</figcaption>
</figure>

Even though I tried everything to finish my thesis before our trip to Japan, I was still missing the final chapter, the conclusion. It was alright though, I was seeing an end to all of this.


## Japan
--- July 18th - July 27th
{: .subtitle}

I like writing during commutes or while flying, as I'm more productive somehow---and it was no exception this time. The long flight to Osaka helped me get the conclusion of my thesis done! After that, I spent the following three days reading and revising my thesis with the constructive comments from my supervisors. In the end, I managed to read and revise the entire 184 pages while in Kyoto. Then, on the 20th of July, I sent out the thesis to my main supervisor for a final check. Suddenly, I was without anything to do... what a weird and beautiful feeling.

Hello Japan!! Finally, I would get to enjoy one of my favourite countries to the fullest! My parents had never been there, so it was a trip to show them around this fantastic Asian country. We ended up going to Osaka, Kyoto and Hakone. Even though I've been to Osaka and Kyoto before, I keep enjoying these cities as if it would be my first time there. The only small difference this time, was that it was the middle of summer and, although we were coming from Singapore, it felt like an oven! We were completely drenched in sweat most of the time, but that didn't stop us. We had a lovely time there, ate a lot of ramen and explored Japan the best we could. I had a newfound freedom, it was complete bliss.

<!-- PHOTOS OF JAPAN -->
<figure class="pull-center half">
	<a href="{{imgPath}}/japan1.jpg"><img src="{{imgPath}}/japan1_low.jpg" alt="image"></a>
  <a href="{{imgPath}}/japan2.jpg"><img src="{{imgPath}}/japan2_low.jpg" alt="image"></a>
  <figcaption>Memories of Japan.</figcaption>
</figure>


## Submission
--- July 28th - August 5th
{: .subtitle}

Once we came back from Japan, it was about time to wrap up my PhD. I went to the lab to organize my files and to make a another small revision of my thesis, based on the final comments by my main supervisor. And, on the 2nd of August, I submitted my PhD Thesis. Everything that I had worked for during the past 4 years, done. HELL YEAH!!!

In the meantime, the EF programme had already started, but this is a story for another time. On the 5th of August I embarked on an incredible journey across the world, the PhD Tour. To be continued...
