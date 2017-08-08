---
comments: true
layout: post
title: "(Git Tower) Error: Agent admitted failure to sign"
tags:
- "Git"
- "Software"
---
Mit dem Update auf Version 1.5.3 hat Git Tower anscheinend ein Problem mit SSH Keys. Nach dem Update heute hatte ich auf zwei Macs folgenden, gleichen, Fehler:

> Agent admitted failure to sign using the key.
> Permission denied (publickey).

Nach dem ich einige Minuten gegooglet habe, fand ich folgende Lösung auf GitHub:

> ssh-add (opt: Name vom Key)

Ausführlichere Informationen (auf Englisch) dazu hier:
[https://help.github.com/articles/error-agent-admitted-failure-to-sign](https://help.github.com/articles/error-agent-admitted-failure-to-sign)

## Management Summary in English:

If you encounter an error when upgrading to Git Tower 1.5.3, that you can't pull/push because of a failure signing your ssh key, you should run the "ssh-add" command. Follow this link for more information:
[https://help.github.com/articles/error-agent-admitted-failure-to-sign](https://help.github.com/articles/error-agent-admitted-failure-to-sign)

## Update (2014-02-28):

It looks like, that the error returns after restarting your mac. At the moment of writing, best way to solve this problem is to downgrade to 1.5.2 (as described @ [Stack Overflow](http://stackoverflow.com/questions/22076434/agent-admitted-failure-to-sign-using-the-key-osx))
