---
layout: post
author: &author santiago
categories: *author  # referencing the author variable
year: 2016
title: Wake me up, when September ends
type: Blog
excerpt: "Developing an NPR agnostic system, attending the Society of Animation Studies conference, research in the hands of artists, USLS 2016 and internship at INRIA (May-Sep 2016)"
tags: [Santiago, SAS, INRIA]
image:
  path: /images/about/santiago/2016/magicHeader.jpg
  caption: working at MAGIC, NTU Singapore 2016
  card: /images/about/santiago/2016/magicCard.jpg
  thumbnail:
comments: true
share: true
read_time: true
redirect_from:
  - /blog/wake-me-up-when-september-ends
---
{%- assign imgPath = "/images/about/santiago/2016" -%}

Have you noticed how the older we get, the faster time goes by?<br>
This is logical, as the more we live -> the less a unit of time becomes, relative to what we have already lived. Mathematically, a year of our lives can be expressed as \\( 1/Age \\). This means that our young years represent substantially more in our lives than our adult years. This feeling of time passing by too fast increases with our working life. The 365 days in a year, that seemed an eternity when we were kids, are suddenly swallowed and we found ourselves sprinting on a week by week basis. I am very happy to be writing this blog as it makes me reflect on the time passed and experiences had.

A lot of things have happened since May, which I would have never thought possible! This past 4 months have been full of surprises and amazing experiences that I want to share with you all, chronologically.

## NPR Agnostic System

--- May-June
{: .subtitle}

After attending Expressive 2016 in Lisbon, I came back fully motivated to continue my research work. The system presented in my Art-directed Watercolor Animation paper, while fully functional, was coded only for watercolor stylisation. So I delved back into the source code and adapted it to be more NPR agnostic, so it can easily be adapted for other types of stylisation. This way, researchers will be able to re-use the source code (once I open-source it upon graduation) and it is much easier for me to also continue developing the look and framework. This might sound trivial to do, but when so many files depend on each other in three different programming languages, it can be a bit of a drag. I also took the opportunity to do a ground up cleaning and optimisation of the code.

While working on the source code, I welcomed the incredible news that [my paper](../../articles/Art-directed-Watercolor-Rendered-Animation) had won an [Honorable Mention Award and my presentation the Best Presentation Award](http://expressive.richardt.name/2016/Prizes) at the Expressive Symposium in Lisbon! I am really humbled to have been recognised with this honour. It was an amazing opportunity to showcase my work and to get to know so many researchers in my field. Many good things have happened thanks to this conference, which I will explain later on.

The next conference was lining up and I had to prepare another presentation for [The Cosmos of Animation](http://sas2016.adm.ntu.edu.sg/), The 28th Annual Conference of the Society of Animation Studies, held in Singapore at the School of Art, Design and Media (ADM) of the Nanyang Technological University (NTU).


## The Cosmos of Animation - Society of Animation Studies

--- 26-30 June
{: .subtitle}

This conference was a lot bigger and different than Expressive, as it is entirely dedicated to animation studies. This meant that there were a lot of animation historians, researchers and academics, together with some practitioners and technical people. There were so many speakers, that 3 to 4 paper presentations had to be conducted at the same time! This made things harder as I really needed to decide on which talks to attend. The repertoire of presentations went from Methodologies Towards Innovative Style in Animation through a look at Modern Art and UPA to the Visual Perception of Movement in 'Game Worlds'. A special focus was also given to oriental Animation. Topics for everyone's taste and specialisation were available and some presentations were well done.

It was especially nice to also see old friends and professors such as Gianalberto Bendazzi and Eileen Reynolds and meet new faces such as Jason Kennedy, Peter Chanthanakone, Gray Hodgkinson and some legends like Alan Cholodenko. The School of Art, Design and Media in NTU was also an excellent host, making sure we always had food and were healthily entertained.

<!-- PHOTOS OF SAS -->
<figure class="pull-center half">
	<a href="{{imgPath}}/sas1.jpg"><img src="{{imgPath}}/sas1_low.jpg" alt="image"></a>
  <a href="{{imgPath}}/sas2.jpg"><img src="{{imgPath}}/sas2_low.jpg" alt="image"></a>
	<figcaption>Memories of The Cosmos of Animation (<a href="{{imgPath}}/sas1.jpg">courtesy of ADM)</a></figcaption>
</figure>

Inbetween all these talks, I had the opportunity to present my work on the last day of the conference. It was the first slot in the morning, which was a bit unfortunate. Still more than 20 people showed up! My presentation was on [Artistically Driven Non-Photorealistic Animation](../../articles/Artistically-Driven-Non-Photorealistic-Animation) and had a different approach than my previous presentation - given at the Expressive Symposium. For the Society of Animation Studies, I had to present in an abstracted high-level way in exactly 15 minutes, to a less technically inclined audience. Nonetheless, the presentation and the live demo went smoothly and were very well received. I also started the beta-testing recruitment, to gather an initial batch of enthusiastic artists to try out the Watercolor system. The presentation can be found [here](../../articles/Artistically-Driven-Non-Photorealistic-Animation), together with the form to sign up for beta testing!


## Preparing the Beta
--- July
{: .subtitle}

Now that the first artists had registered to test the Watercolor system, I had to make sure that it would run well on any of their PCs. First, the system had to be straightforward to install for artists and technical people alike, without altering their Maya configuration or pasting files in different directories. Second, the existing tools had to become self-explanatory and allow for users to start using the look and quickly capture/playblast their results directly in Maya at any resolution (yes, that is how we render in realtime!). Third, there was a special request to implement a native form of Supersampling (also known as DSR/SSAA) to improve the fidelity of rendered results, which works beautifully! Finally, it was time to compile everything together to not reveal the source code just yet. All this preparation took time - considering also the three different languages and "Maya hiccups" -, but also took the system from messy research code to distributable software build, which I am a bit proud of. Independent research work in computer graphics does not usually land in the hands of artists, which is very unfortunate. I'm going against this trend, as I believe in user-driven and focused research. It is of no use to come out with something new, which will never be used by the user group it is intended for. It is additional work, but now that I am getting some results from the initial testers, it is amazingly rewarding.

Something awesome also happened during this period, the possibility to do a research internship at [INRIA](https://www.inria.fr/en/centre/grenoble) in Grenoble, France! I have been in touch with [Joëlle Thollot](http://maverick.inria.fr/~Joelle.Thollot/) since the Expressive Symposium in Lisbon and one idea came to another, resulting in us wanting to collaborate to take the Watercolor system to new grounds. And now, thanks to Joëlle, the support of my supervisors, IGS, MAGIC and INRIA, I will be flying off tomorrow, the 1st of October, from Singapore to Grenoble for three months! I'm seriously excited for this opportunity as not only Joëlle, but [Pierre Bénard](http://www.labri.fr/perso/pbenard/) and Romain Vergne are on board. These are all amazing researchers in the field of Non-Photorealistic Rendering and Computer Graphics! I am really looking forward to learn a lot from them and create/develop something unique together.

While preparing the Watercolor System for distribution, I was also proof-reading the master thesis of my girlfriend and I completely underestimated how much time this involves. Nonetheless, this experience also helped me to consider the writing that I still have ahead of me. I am glad to be doing a science degree and not and arts degree though, the writing tends to be more forgiving in sciences and engineering. I managed to finish proof-reading in time for the next big event of this year, the 7th [University Scholars Leadership Symposium](http://www.universityscholars.org.uk/) held in Hanoi, Vietnam.


## University Scholars Leadership Symposium (USLS 2016)

--- 1-7 August
{: .subtitle}

The University Scholars Leadership Symposium, also known by its acronym USLS is an international student conference focusing on Humanitarian Affairs. We were over 700 delegates from 69 countries and in many ways, this conference was way bigger and different than any other I have ever been to. It was an unbelievable emotional rollercoaster and an inspirational experience, which allowed me to grow as a person and human being. As a PhD student, one is usually encapsulated in his own research problems and does not have much time to consider and be exposed to the humanitarian problems on earth. This conference changed this and addressed difficult topics such as human trafficking, refugee crisis, agent orange, etc.

{% include responsive-embed url="//www.youtube.com/embed/F_n3FfC-yEE" ratio="16:9" %}

We had the opportunity to attend truly inspirational talks by people that are literally changing the lives of others through their humanitarian efforts. The main purpose of the conference was not to convince the attendants into starting a humanitarian career, but more to encourage young leaders to use their skills to do good in any possible way and highlight humanitarian topics. These talks are now available online for the whole world to be inspired and I have done a [playlist](https://www.youtube.com/playlist?list=PLnr8w_xl4rdv72uzQpSVKysB4m6fC-VyD) with all the talks of the Symposium, in case you are interested to experience them. Two that especially stood out for me were given by David Begbie and Geraldine Cox.

<!-- PHOTOS OF USLS -->
<figure class="pull-center half">
	<a href="{{imgPath}}/USLS1.jpg"><img src="{{imgPath}}/USLS1_low.jpg" alt="image"></a>
  <a href="{{imgPath}}/USLS3.jpg"><img src="{{imgPath}}/USLS3_low.jpg" alt="image"></a>
  <figcaption>Memories of the USLS</figcaption>
</figure>

I am very thankful to my faculty, the Interdisciplinary Graduate School (IGS) for nominating me and sponsoring this amazing opportunity and also to my supervisor Hock Soon Seah for allowing me to leave for a week to experience this. Apart from the talks, I met good hearted students from all around the world and made friends from countries I never imagined to have. In case you are interested in also attending such a symposium, the next [USLS will be in Bangkok, Thailand](http://www.universityscholars.org.uk/).

<!-- PHOTO OF VIETNAM -->
<figure class="align-center">
	<a href="{{imgPath}}/USLS2.jpg"><img src="{{imgPath}}/USLS2_low.jpg" alt="image"></a>
	<figcaption>Memories of Vietnam</figcaption>
</figure>

## Happening Now
--- August-September
{: .subtitle}

This brings us to what is happening now! After the Symposium, I wrapped up the beta development and the first batch of testers is finally playing with and using the watercolor system. Some rendered images and videos are starting to arrive and it is really exciting to get their feedback and see their approaches!

<figure class="align-center">
{% include responsive-embed url="//www.youtube.com/embed/Z2nqZmjgahs" ratio="16:9" %}
<figcaption>Canicas test by Eduardo Altamirano</figcaption>
</figure>

We have also been invited to create an extension of our Art-directed Watercolor Rendered Animation paper, to be published in a journal. This is great, as I have already started expanding the system and improving upon the look. I will be releasing this extension for beta testers in the following two weeks and I hope to feature some of their results in the paper.

A collaboration with [Texas A&M University](https://viz.arch.tamu.edu/) has also initiated, which was also only possible by attending the Expressive Symposium in Lisbon. [Yolanda Cheng](yolandacheng.wordpress.com) and [Ergun Akleman](http://www.viz.tamu.edu/faculty/ergun/) are working to develop an offline, raytraced rendering solution featuring the watercolor look! This would mean that you can adapt and art-direct the look on real-time in Maya and then render it offline with global illumination, raytraced shadows, reflection and refraction! This is really exciting and I look forward to work with them to make this possible.

On a more personal side, I have moved to a wonderful new place in Singapore, outside of campus. The campus of the Nanyang Technological University is in the outskirts of the city, it is so far that people often refer to it as pulau NTU (island NTU). Now I live much closer to the city center and it has been great so far! I actually don't mind commuting to the University, I get a lot of things done along the way.

<!-- PHOTOS OF USLS -->
<figure class="pull-center half">
	<a href="{{imgPath}}/SG1.jpg"><img src="{{imgPath}}/SG1_low.jpg" alt="image"></a>
  <a href="{{imgPath}}/IN1.jpg"><img src="{{imgPath}}/IN1_low.jpg" alt="image"></a>
  <figcaption>Memories from my new home and Bali/Lembongan</figcaption>
</figure>

I am also writing most of this blog post from Bali in Indonesia, the first actual vacation of the year. It has been a hectic year, but I could finally disconnect from work and enjoy the sun and great company. Now I'm ready to wrap up the extension of the watercolor system, to write the extended paper and to begin working in Grenoble starting next week!!!

<!-- PHOTO OF SIDEMEN -->
<figure class="align-center">
	<a href="{{imgPath}}/IN2.jpg"><img src="{{imgPath}}/IN2_low.jpg" alt="image"></a>
	<figcaption>Memories from Sidemen</figcaption>
</figure>
