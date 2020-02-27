---
layout: post
author: &author santiago
categories: *author  # referencing the author variable
year: 2017
title: From Singapore to Grenoble
type: Blog
excerpt: "Internship at Inria in Grenoble - Rhône-Alpes, my first journal publication, teaching Rigging for Animation (Oct 2016 - Feb 2017)"
tags: [Santiago, INRIA]
image:
  header: images/about/santiago/2016/inriaHeader.jpg
  caption: Inria Grenoble, Rhône-Alpes, Fall 2016
  path: images/about/santiago/2016/inriaCard.jpg
  thumbnail:
comments: true
share: true
read_time: true
redirect_from:
  - /blog/from-singapore-to-grenoble/
---
{%- assign imgPath = "/images/about/santiago" -%}

It has been over half a year since I came back from France and it is about time to update this blog. I had a week-long vacation and finally found the peace of mind to write most of this (I should get more of these). Anyway, let's get started from where we last took off.

## Inria Rhône-Alpes

--- October-December
{: .subtitle}

I travelled to Grenoble at the beginning of October 2016 for a 3 month PhD internship at [Inria - Rhône-Alpes](https://www.inria.fr/en/centre/grenoble). This was a fascinating opportunity to experience a European research institute/environment and work together with some of the best minds in the field, at the [Maverick](https://maverick.inria.fr/) team (Models and Algorithms for Visualization and Rendering). I had the privilege to be supervised by [Joëlle Thollot](http://maverick.inria.fr/~Joelle.Thollot/), [Romain Vergne](http://romain.vergne.free.fr/blog/) and [Pierre Bénard](http://www.labri.fr/perso/pbenard/), and had a blast. I found it fascinating how the research culture in Singapore differs from the one in France. In Singapore, the research focus is entirely on peer reviewed publications, as these are the sole measurement of research contribution (which is required for graduation). Instead, French research focuses on research problems, they don't work solely towards publications. Depending on the complexity of the tackled problem, it might be that no publication is written during the time of candidacy, but you still contribute to the research field and are awarded your PhD (that would be almost impossible in Singapore). This makes for a much more relaxed research atmosphere, where one can dig deeper and invest more time trying to solve the problem. The meetings I had with the supervisors in France were also different, as they resembled more a brainstorming session than just a research progress report.

<!-- PHOTOS OF GRENOBLE -->
<figure class="pull-center half">
	<a href="{{imgPath}}/2016/grenoble1.jpg"><img src="{{imgPath}}/2016/grenoble1_low.jpg" alt="image"></a>
  <a href="{{imgPath}}/2016/grenoble2.jpg"><img src="{{imgPath}}/2016/grenoble2_low.jpg" alt="image"></a>
	<figcaption>Memories of Grenoble</figcaption>
</figure>

During this time in France, we worked together towards novel ways and workflows for stylization in object-space and generalizing stylization systems. I can't tell too much about this yet, but the work is exciting (at least for me). I also submitted the extension of my previous Expressive paper to the [Computers & Graphics](https://www.journals.elsevier.com/computers-and-graphics/) journal. It was expanded with a joint-bilateral filtering approach towards color bleeding in object-space and an introduction towards direct 3D stylization pipelines.

The three months in Grenoble went by too fast, but I managed to get to know some seriously talented people over there that have become good friends. Not only fellow PhD students, but also the professors. This is something that I also liked about the research environment at Inria. Students/professors/researchers all worked together next to each other. This often meant that you could just pop by next door anytime to discuss ideas or ask questions, and that the entire team had lunch together - getting to know each other on a more personal level. Supervisors once in a while even invite all their PhD students to their place to eat and have a good time together. Overall, it was an amazing experience to be in Grenoble and I would like to thank both, MAGIC and Inria for supporting me during this internship. [Alexandre Bléron](http://maverick.inria.fr/Members/Alexandre.Bleron/), a PhD student from Inria in Grenoble Rhône-Alpes will be joining us at MAGIC at the beginning of September, as we seem to have started an unofficial exchange program between both research institutes. I look forward to welcoming him here in Singapore.

<!-- PHOTOS OF INRIA -->
<figure class="pull-center half">
	<a href="{{imgPath}}/2016/inria1.jpg"><img src="{{imgPath}}/2016/inria1_low.jpg" alt="image"></a>
  <a href="{{imgPath}}/2016/inria2.jpg"><img src="{{imgPath}}/2016/inria2_low.jpg" alt="image"></a>
	<figcaption>Fun times at Inria, Grenoble Rhône-Alpes</figcaption>
</figure>

## End of the year panic!

--- December-January
{: .subtitle}

Unfortunately, at the end of my internship in France, I got notice that the extension that I previously submitted to Computers & Graphics did not meet the criteria of 30% new material, required for the journal publication... and that I had 30 days to make a major revision, which should include a bigger contribution. The anonymous reviewers recommended conducting an informal user-study among artists using the system... Merry Christmas!

<!-- PHOTOS OF Christmas -->
<figure class="pull-center half">
	<a href="{{imgPath}}/2016/germany1.jpg"><img src="{{imgPath}}/2016/germany1_low.jpg" alt="image"></a>
  <a href="{{imgPath}}/2016/germany2.jpg"><img src="{{imgPath}}/2016/germany2_low.jpg" alt="image"></a>
	<figcaption>Christmas in Germany with my family</figcaption>
</figure>

I immediately asked for a two-week extension, as the probability of getting enough artists to conduct a user-study over the Christmas holidays was minimal - not to mention that I also wanted to spend Christmas with my family and not in front of a pixel box. The extension gave me until the 17th of January to submit the revised paper and to make the most out of it. Thankfully, the Watercolor system was already stable enough to be deployed to any artist, but being a system with low-level stylization control on top of Autodesk Maya, a certain level of expertise and skill-set was required to achieve good results. My first focus towards this revision was on recruiting experienced artists and creating video training material to bring all users to the same level. Thankfully, some amazing artists stepped in to participate in the user study, including Joan Cabot, Jason Labbe, Eduardo Altamirano, Miquel Cabot and Pierre Coffin (he didn't officially participate, but still sent me some amazing renders and feedback). Participants had two weeks to spend at least 2 hours stylizing their own assets. At the end, their feedback was recorded in the form of a questionnaire. I was honestly overwhelmed by the responses and the amount of time they dedicated to thoroughly evaluate the stylization system and to produce amazing stylized watercolor renders.

The conducted user study was a success, as it not only validated all the effort that I have put into developing the technology, but also supported and strengthened the contribution of the extended paper significantly. These guys were awesome and thanks to them, the journal paper was finally accepted! You may find the paper in the academic world as [“Art-directed watercolor stylization in real-time”](http://www.sciencedirect.com/science/article/pii/S0097849317300316) and on my [website](/articles/Art-directed-watercolor-stylization-of-3D-animations-in-real-time/). Together with this paper, our implementation has been released for [download](https://docs.google.com/forms/d/e/1FAIpQLSf6vhIwRn02zS_B8iOpWJb5NQjtVL5pAo-xPm1GcnJd5Bb3eg/viewform?c=0&w=1) to everyone and over 180 artists around the world have registered to use it. It has been amazing and truly motivating hearing friends telling me that other colleagues of them have been sharing the accompanying video of the paper and saying good things about the look. It has been a wild ride!

## Back in Singapore

--- January-February
{: .subtitle}

After the revised journal paper was submitted, things settled down a for a brief time, which was extremely enjoyable. I was back in Singapore with warm weather and normal working hours, and I continued working with both, the Singaporean and French supervision (as they kind of adopted me as their unofficial PhD student =). It's a bit tricky to have so many people involved now, but I'm happy to receive input from different perspectives and to continue working with Joëlle, Pierre and Romain - these guys know their stuff!

Apart from continuing my research in Singapore, I was also a teaching assistant for the [Rigging for Animation](http://www.adm.ntu.edu.sg/Programmes/Undergraduate/UndergraduateProgrammes/Undergraduate-Degree/Pages/DT3004.aspx) course with my mentor [Davide Benvenuti](http://research.ntu.edu.sg/expertise/academicprofile/Pages/StaffProfile.aspx?ST_EMAILID=DBENVENUTI). The course is given to young undergraduate students from the School of Art, Design and Media of NTU. This has been an enjoyable experience, where I tried my best to teach a little bit of the technical side of rigging to students from the art school (not an easy task). We spent a total of 13 weeks teaching them, it was fun! Thankfully, the reception and evaluation of the class by the students was quite positive. This experience allowed me to reaffirm my determination to teach at University someday (if I get tired of working in the industry).

<!-- PHOTOS OF SINGAPORE -->
<figure class="pull-center half">
	<a href="{{imgPath}}/2017/singapore1.jpg"><img src="{{imgPath}}/2017/singapore1_low.jpg" alt="image"></a>
  <a href="{{imgPath}}/2017/singapore2.jpg"><img src="{{imgPath}}/2017/singapore2_low.jpg" alt="image"></a>
	<figcaption>Back in Singapore - celebrating Chinese new year</figcaption>
</figure>

At the end of February, we decided to try our best to submit new work to two new conferences. We aimed for [Expressive 2017](https://expressivesymposium.com/) and [Real-time Live! at Siggraph](http://s2017.siggraph.org/content/real-time-live), both held and co-located in Los Angeles. The only tricky part was that even if I got accepted into Real-time Live!, I could only go and present if my new conference paper was also accepted at Expressive 2017. A lot of crunch-time came with these goals, which is why I haven't been able to update this blog for a while. This will all come in a latter post. However, I can already share that we made it into both! If you happen to be reading this and coming to Siggraph this year, let's meet up!

Until next time,


Santiago.
