---
layout: post
title: World's Largest Maze
excerpt:
modified: 2016-11-21T08:34:46-05:00
categories: projects
tags:
image:
  feature: maze-header-image.jpg
  credit: Leah4Evah
  creditlink: https://suwalls.com/nature/hedge-maze-30469
share: true
---

This project was aimed at generating the world's largest maze on my humble MacBook. To do so
required both memory efficient algorithms and extremely efficient implementations.

# Origin Story

It all began one fateful day when I was looking for my next coding project. I stumbled across
a [video][vsauce-maze] online talking about a "World's Largest Maze". After quickly watching
[The Maze Runner][maze-runner] I knew my destiny was clear. I must forge an even larger maze
from the spirit in my heart and the keystrokes of my MacBook. This was to be no simple task,
however upon looking into the eyes of the maze gods I gleaned their secrets. I now had the
tools necessary to generate the world's largest maze and fulfill my destiny.

# Secrets of the Maze Gods
The core maze generation process is written in Java and uses the Hunt-and-Kill maze generation algorithm. The maze data is then written out to a maze.dat file. Next, a C process runs to interpret the maze.dat file and write out a maze.bmp file containing the resulting maze image.

This implementation is designed to be memory efficient to allow very large mazes to be generated. My humble MacBook can generate a 16,383 x 16,383 maze in just over 3 minutes. This is impressive considering the resulting maze image file is 134 MB and is large enough to crash my default image viewer. Further improvements could perhaps be coding everything in C or utilizing multiple threads.

# Becoming a Maze Apprentice
If you would like to dabble in maze generation yourself, you can do so by cloning my repo.
You can generate a 1337 x 1337 passage maze with the following:
```
git clone git@github.com:ScottBouloutian/massive-maze.git
cd massive-maze
gradle build
gradle generate -Psize=1337
```

# Results
The previous largest maze on the internet measured 16383 x 16383 passages. I was able to
generate a maze double that size resulting in a maze 32766 x 32766 passages. The maze
generation process took 13 minutes 35.243 seconds to generate a maze of that size.
The resulting maze bmp file is a whopping 536.9 MB. That's over half a gigabyte of pure
maze! Compressed the file is 318.4 MB. The bmp file is too large for my computer to open.
A future project of mine might include coding an image editor capable of viewing such a massive
image file. Both a link to my source code and the record breaking maze are included below.

<div markdown="0"><a href="https://github.com/ScottBouloutian/massive-maze" class="btn">Source Code</a></div>
<div markdown="0"><a href="https://s3.amazonaws.com/scottbouloutian/maze/maze.zip" class="btn">Maze Bitmap</a></div>

[vsauce-maze]: https://www.youtube.com/watch?v=t2ZWf-DeexY
[maze-runner]: http://www.imdb.com/title/tt1790864
