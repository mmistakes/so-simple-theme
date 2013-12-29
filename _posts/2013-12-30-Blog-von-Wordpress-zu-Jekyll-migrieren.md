---
comments: true
layout: post
title: "Blog von Wordpress zu Jekyll migrieren"
tags:
- "How-To"
- Erfahrungsbericht
- Jekyll
---
Vor einiger Zeit hat sich mein Blog-Update-Intervall drastisch erhöht. Nachdem die [Blog-Challenge 2012](http://johannes.nagl.name/2012/2012/) verloren wurde, verlor ich auch ein wenig meine Lust am Texten. Das und die Tatsache, dass ich jedes Mal, bevor ich los bloggen konnte, WordPress updaten musste, nervten mich extrem.

Also entschloss ich vor einigen Monaten meine Blog-Software zu wechseln. Inspiriert durch meinen sonst auch (fast) überall durchgezogenen Lebensstil ("weniger ist mehr") habe ich mich dazu entschlossen, auf eine ganz minimalistische Plattform zu wechseln. In diesem Fall: Auf simple, statische HTML Files - die ich nicht einmal selbst hoste.

### Say [Hello to Jekyll](http://jekyllrb.com)! Transform your plain text into static websites and blogs.

Jekyll ist ein Ruby Gem, das ohne viel zu tun aus einigen wenigen Konfigurationsdateien und Posts (die im Markdown oä Format abgelegt werden) automatisch einen ganzen Blog bastelt.

**Die Vorteile liegen auf der Hand**:

* **Reduced to the max**: Billige, mit jedem Editor editierbare HTML/Markdown Texte
* **No Updates required**: Da es sich um HTML-Files handelt, kann es zu keinen Security-Problemen kommen, wenn man einige Zeit keinen Bock auf Bloggen/Updates hat
* **Speed**: Da es sich um HTML-Files handelt, werden diese auch super schnell an die Besucher ausgespielt, egal wie viel Traffic mein Blog tatsächlich erhalten sollte. Interessant hierbei auch folgender [Blog-Post von Martin](http://www.mthie.com/wie-schnell-man-seiten-ausliefern-kann.html).
* **Hosting-free**: Da ich mein Jekyll-Repository auf GitHub hoste, läuft mein Blog auch direkt auf den Servern von GitHub. Ich muss also weder etwas administrieren, noch zahle ich dafür (da es sich um ein public repo handelt).
* **Easy Hosting**: Da es sich um HTML-Files handelt, könnte ich die fertig erzeugte Blog-Version bei jedem Webhoster ohne Probleme hochladen.
* **Easy Migration**: Es gibt für alle nahmhaften Blog-Systeme (ala WordPress, Movable Types, Ghost, Drupal,Tumblr, …) fertige Migrations-/Import-Skripte, die das Konvertieren der Einträge sehr einfach machen.

Jedes System hat natürlich auch **seine Nachteile**, die nicht verschwiegen werden sollen:

* **Not for everyone**: Grundkenntnisse der Programmierung sollten beim erstmaligen Einrichten des Blogs vorhanden sein.
* **Not for everyone**: Das Tool skaliert sicher nicht für Blogs mit mehreren Autoren/vielen Postings
* **Not for everyone**: Die Auswahl an Themes und Plugins ist sehr überschaubar.
* **Not for everyone**: Kein Fancy Online-Editor für Text + Bilder vorhanden.
* **Not for everyone**: Kommentare und Suche sind out of the box nicht vorhanden, können aber teilweise ergänzt werden. Dazu im Anschluss mehr.
* **Not for everyone**: Es gibt zwar Import-Tools, aber defacto keine fertigen Export-Möglichkeiten. Ob man also jemals wieder von Jekyll wegkommt hängt stark von seinen Programmier-Kenntnissen ab.

Ich denke, man sieht anhand der beiden Aufzählungen sehr gut, dass nur einige wenige Anwendungsszenarien für Jekyll-Blogs vorhanden sind. (Vermutlich ist das Anwendungsgebiet für Jekyll-Webseiten deutlich höher).

### Migration

Wie bereits vorhin erwähnt: Das Thema [Blog Migrationen](http://jekyllrb.com/docs/migrations/) ist bei Jekyll kein Thema. Schnell hat man das passende Kapitel in der guten Dokumentation gefunden, schon kanns los gehen. In meinem Fall habe ich den [fertigen Importer für WordPress](http://import.jekyllrb.com/docs/wordpress/) verwendet.

Zusätzlich noch ein gutes, hübsches, zurückhaltendes, und technisch sauber umgesetztes [Theme](https://github.com/mmistakes/so-simple-theme) gefunden und fast ist man fertig!

In meinem Fall hat dann noch ein GitHub-Repo (mit speziellem Namen) gefehlt: Aber auch das ist aufgrund der tollen [GitHub Pages Dokumentation](http://pages.github.com/) innerhalb weniger Minuten eingerichtet und ready to rock. Schnell noch eine CNAME Datei mit dem Inhalt 'johannes.nagl.name' angelegt und der Blog war fertig migriert.

Zwei Punkte waren dann noch ausständig:

### Kommentare

Diese verliert man leider bei der Migration. In meinem Fall kein Problem, da ich nur rund 30-40 hatte. Da statische HTML-Dateien keine Möglickeit zum Hinterlassen von Kommentaren bieten, muss man in diesem Fall auf Anbieter wie [Disqus](http://disqus.com/) zurückgreifen.

### Fotoalben

Nun ja, diese sind immer noch ausständig :) Kommt Zeit, kommen alte Fotoalben. Mal schauen, welche Lösung ich dafür finde. Bisher war ich zu faul dazu mir eine Lösung für alte Galerien, wie [hier](http://johannes.nagl.name/2012/leckeres-sushi-maki-selber-machen/) zu überlegen.

### Suche

Leider auch etwas halbherzig funktioniert die Suche: Da keine Datenbank bzw. server-seitige Programmiersprache zur Hand ist, kann nur mittels "billigem" JS-String-Vergleich nach Titeln oder Tags einzelner Artikel gesucht werden. Macht in meinem Fall nichts: Entweder Besucher kommen direkt via Google auf einen gezielten Beitrag oder klicken auf einen Tweet/Fb-Link von mir.

### Fazit / Management Summary

Mir hat der Wechsel gut getan und ich konnte viele Altlasten bezüglich Hosting/Wartung ein für alle Mal abhaken. Seitdem sehe ich meinen Blog wieder mit ganz anderen Augen und die "lightweight" Form macht Spass. Ich denke viel mehr über Themen als über Technik nach. Das ist gut so.

Jeder der einen Umstieg überlegt, sollte sich jedoch vorher mit den Hosted Services von [WordPress(.com)](http://www.wordpress.com) bzw. [Ghost](http://blog.ghost.org/hosted-platform-open/) (gab es zu meiner Zeit noch nicht) vertraut machen.

