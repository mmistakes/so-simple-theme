---
comments: true
layout: post
title: "Mein perfektes (Mac) Developer Setup"
tags:
- "Mac OS X"
- "How-To"
- Erfahrungsbericht
- Weltverbesserung
---
Ich bin vor einem Jahr sehr pragmatisch in die Apple-Welt gewechselt. Ich war in der Windows Welt nie wirklich *un*zufrieden. Ich hatte funktionierende Workflows und sehr viel Erfahrung mit dem System (kann ich doch von Win 3.11 hin bis zu Windows 7 auf einige Jahre und sogar einige Monate als Systemadministrator zurückblicken). Doch mit Windows 8 wollte ich mich nicht anfreunden und so dachte ich mir: Wenn so viele Entwickler auf OSX setzen: Warum nicht ich auch?

Und so musste ich innerhalb kürzester Zeit feststellen: Ja, es lässt sich auch auf der Mac-Plattform super arbeiten/entwickeln. Und es gibt super Programme, die einige bisherige Workflows noch einfacher abbilden lassen. Welche das sind, möchte ich hier näher auflisten.

**Disclaimer:** Die genannten Programme/Abläufe beschreiben die Arbeitsweise einer Person, die im kleinen Team an kleinen bis mittelgroßeren Webprojekten arbeitet. Für Einzelpersonen können durchaus andere Abläufe besser funktionieren.

Hier also die Auflistung meines Setups, die hauptsächlich dazu dienen soll, dass ich beim nächsten Update selbst wieder alle Programme/Einstellungen/Links finde. Zusätzlich hat mich Klaus Breyer heute durch das Teilen seines [Geld-Setups](http://klaus-breyer.de/in-eigener-sache/wie-ich-mit-geld-umgehe/234) dazu animiert/inspiriert, auch etwas mit euch zu teilen:

### Development Environment: [Vagrant](http://www.vagrantup.com/) (gratis)

Wir haben einen Wildwuchs an verschiedenen Systemen im Büro. So war es heuer Zeit für einige Projekte eine Schicht einzuführen, die das Arbeiten an gleichen Systemen ermöglicht. Hierzu hat sich Vagrant angeboten. Danke [Nico](https://www.twitter.com/nicolasdular) und [Andi](https://www.twitter.com/andreasklinger) für euer Basis-Setup hierzu!

Vagrant ist, in Kombination mit VirtualBox, VMWare, … dazu da, eine virtuelle (Entwicklungs-)Maschine für Projekte einzurichten. Der Initialaufwand zum Einführen von Vagrant ist, natürlich abhängig vom jeweiligen Projekt-Setup, recht überschaubar. Die Definition der virtuellen Maschine dient ebenfalls gleich als Dokumentation für die Minimal-Requirements des jeweiligen Projekts. Man nimmt eine Basis Box und ergänzt diese um einige Shell-Scripte, um danach seine App (die lokal am Entwicklungs-Host liegt) in die virtuelle Maschine zu mounten. Das heißt: Die Entwicklung und die Sourcecodeverwaltung finden weiterhin auf dem physischen PC statt, während die App dann in der virtuellen Maschine läuft.

**Vorteil 1**: Plötzlich ist am eigenen Laptop/PC nicht mehr viel notwendig, damit die jeweilige Web-App läuft. Vagrant und Virtualbox installieren, "vagrant up" im Terminal tippen und schon wird das jeweilige System bei sich installiert.

**Vorteil 2**: Nun ist auch gewährleistet, dass alle Entwickler im Team die gleichen Versionen (im besten Fall sind das dann auch die gleichen Versionen wie am Produktiv-System) verwenden/testen können. Im Nachhinein betrachtet: Das sinnvollste, das wir 2013 in der Firma testen konnten.

**Vorteil 3**: Kommt ein neuer Mitarbeiter hinzu, wechselt ein Mitarbeiter sein Betriebssystem-Setup, bzw. muss ein Mitarbeiter sein Gerät neu installieren, hält sich der Aufwand hierfür in allen Situationen in Grenzen.

### Sourcecodeverwaltung: [Git Tower](http://www.git-tower.com/) (49 EUR)

In der Firma sind alle Projekte in Git-Repos zur Verwaltung hinterlegt. Je größer das Projekt und je mehr [Feature-Branches](http://martinfowler.com/bliki/FeatureBranch.html), desto schneller kommt man mit seinen Git-Clients/-Knowhows ans Ende. Nicht jedoch mit Git Tower. Seitdem ich auf dieses Tool umgestiegen bin, hatte ich nie wieder wirklich große Probleme und konnte jedes Problem (vor allem das oftmals sehr mühsame [rebasen](http://git-scm.com/book/en/Git-Branching-Rebasing)) lösen. Für mich der Produktivitäts-Helfer Nummer 1 - hauptsächlich auch wegen der intuitiven Oberfläche und verständlichen Optionsauswahl. Somit geht der Preis von 49 EUR für mich vollkommen in Ordnung. Kein einziges Git-Programm (zb im App Store) hat für mich die Arbeit mit Repos so sehr vereinfacht.

Kostenlose Alternative: [SourceTree App](http://www.sourcetreeapp.com/)

### Datenbankverwaltung: [Sequel Pro](http://www.sequelpro.com/) (gratis)

Einer der größten Timesaver: Ein gut funktionierendes Datenbank-Tool ist das Um und Auf für schnelles Arbeiten. Dinge wie phpMyAdmin waren mir immer ein Dorn im Auge und mit der Shell wollte ich mich nie wirklich beschäftigen. Dazu bin ich dann doch noch zu sehr geprägter Windows User. Zum Glück hat mir [Fabian](https://www.twitter.com/i_am_fabs) mal von Sequel Pro erzählt und ich war sofort Feuer und Flamme dafür. Es bietet alle relevanten Dinge (Import, Export, Strukturverwaltung, Standardauflistung für Daten, Custom Query Support) und bedient sich sehr intuitiv. Killer-Feature für mich: Zugriff auf Datenbanken mittels SSH-Tunnels. Meist ist es ja so, dass der Zugriff auf Produktiv-Datenbanken nur direkt über localhost stattfinden kann. Hat man allerdings Zugriff auf einen Server mittels ssh, ist das Verbinden und Arbeiten mit Live-Datenbanken mit Hilfe von Sequel Pro jederzeit möglich. Achtung: Man sollte natürlich sehr vorsichtig sein, wenn man auf einer Live-Datenbank arbeitet. Ich habe mir daher angewöhnt, alle Produktiv Verbindungen mit "ACHTUNG: Servername" zu kennzeichen. Das gibt mir immer ein visuelles Backup, ob ich Queries tatsächlich ausführen sollte.

### Schriftart: [Source Code Pro](http://blogs.adobe.com/typblography/2012/09/source-code-pro.html) (gratis)

Programmierer sind eigen. Und deswegen sollten sie auch eigene Schriftarten verwenden. Unter Windows hatte ich mich schnell in die Consolas verliebt, doch als mir [Patrick](https://www.twitter.com/catearcher) vor einigen Monaten von Source Code Pro erzählte, war ich sofort Feuer und Flamme. Geeignete Unterscheidungen von 0, O und o, bzw. 1 I und l sind eine große Seltenheit. Auch mehrere Underscores sind leider oftmals schwer zu erkennen.

Kurzum: Für jedes System (auch Windows) unbedingt installieren - große Empfehlung meinerseits!

* Download hier: [https://github.com/adobe/source-code-pro/downloads](https://github.com/adobe/source-code-pro/downloads)
* [Anleitung für die Nutzung in Sublime Text](http://blogs.adobe.com/cantrell/archives/2012/10/using-source-code-pro-with-sublime-text-2.html)
* Auch sehr zu Empfehlen: Ebenfalls das Terminal umstellen, damit auch dieses die Font verwendet!

### Package Verwaltung: [Homebrew](http://thechangelog.com/install-node-js-with-homebrew-on-os-x/) (gratis)

The Missing Package Manager for Mac OS X. Super angenehm, um Entwickler-relevante Dinge (node.js, mySQL, …) zu installieren. Bei mir aktuell für folgende Dinge im Einsatz (es waren schon mal deutlich mehr (siehe Vagrant)):

* node.js (brew install node)

Wie man homebrew, node.js und grunt installiert, erfährt man hier sehr gut: [http://thechangelog.com/install-node-js-with-homebrew-on-os-x/](http://thechangelog.com/install-node-js-with-homebrew-on-os-x/)

### JavaScript Task Runner: [Gulp](http://gulpjs.com) (gratis)

Früher hatte ich einige Build-Tools direkt am Client in Verwendung. Es gab einzelne Plugins für Less, Jshint, Jsmin, Cssmin und Image Compress und die dazu notwendigen Konfigurationsdateien. Diese waren alle in den unterschiedlichen Programmen aufgeteilt und meine Kollegen hatten teilweise veraltete Versionen. Kurz um: Nervig. Mittels Gulp.js konnten wir in der Firma all die obgenannten Tasks sammeln und mittels [http://blog.nodejs.org/2012/02/27/managing-node-js-dependencies-with-shrinkwrap/](NPM Shrinkwrap) dafür sorgen, dass alle involvierten Teammitglieder immer die gleichen Versionen von den Dependencies nutzen können.

* Aufwand zum Einlernen: Gering.
* Alternative 1: [Grunt](http://gruntjs.com/) (gratis)
* Alternative 2: [CodeKit](http://incident57.com/codekit/) (28 USD)
* Alternative 3 (nur für Images): [ImageOptim](http://imageoptim.com/) (gratis)

### FTP/SSH Zugang: Terminal/[Transmit](http://panic.com/transmit/) (34 USD)

Klar: Jeder Entwickler muss sich früher oder später mal auf externe Server verbinden. Dazu empfehle ich folgende Dinge:

**Terminal/Git**:

Deployments lösen wir bei den meisten Projekten aktuell mittels Git. Dh das Verbinden mit einem externen Server kann über SSH stattfinden. Danach reichen einige wenige Kommandozeilen-Befehle aus. Hierfür ist nicht viel notwendig, außer:

* [SSH Logins mittels der Config-Datei hinterlegen](http://www.maclife.com/article/columns/terminal_101_easy_login_ssh_config_file)
* [SSH Keys anstelle von Passwörtern verwenden](https://help.github.com/articles/generating-ssh-keys)

Eine Alternative zum händischen Deployment wären Dienste wie [Deploy.do](https://www.deploy.do/) oder [lokale Deploy-Scripts in Kombination mit Grunt](https://npmjs.org/package/grunt-deploy).

**Transmit**:

Für Legacy-Projekte, oder kleine Datei-Suchen zwischen durch unerlässlich: Transmit. Super intuitiv, Favoriten können über Dropbox oder App Store automatisch gesynct werden. Bonus: Kann auch direkt auf S3 Buckets zugreifen.

### Texteditor: Sublime Text (3) (70 USD)

Sublime Text gibt es für alle Plattformen, somit gehe ich nicht näher darauf ein. Einfach der beste, den es zur Zeit gibt! Vor allem wegen der Plugins, Mini-Map, Konfigurationsmöglichkeiten und dem unvergleichbaren Speed sein Geld Wert!

Hier meine aktuell verwendeten Plugins/Einstellungen:

<pre>
{
    "bold_folder_labels": true,
  "color_scheme": "Packages/User/Monokai (SL).tmTheme",
  "font_face": "Source Code Pro",
  "highlight_line": true,
  "highlight_modified_tabs": true,
  "ignored_packages":
  [
    "Vintage"
  ],
  "scroll_past_end": false,
  "shift_tab_unindent": true,
  "tab_completion": false,
  "tab_size": 2,
  "translate_tabs_to_spaces": true,
  "trim_trailing_white_space_on_save": true
}
</pre>

**Verwendete Plugins zur Zeit:**

* [LESS syntax highlighting](https://github.com/danro/LESS-sublime)
* [Interactive code linting framework for Sublime Text 3](https://github.com/SublimeLinter/SublimeLinter3)
* [SublimeLinter plugin for JavaScript](https://github.com/SublimeLinter/SublimeLinter-jshint)

Bevor man die Plugins installieren kann, benötigt man den sehr bekannten Package Manager "[Package Control](https://sublime.wbond.net/installation)". Alles super flott installiert und schon steigt die Party!

### Security: FileVault aktivieren

Vor allem sinnvoll bei Laptops, aber meiner Meinung nach auch für Desktops relevant: Das Verschlüsseln der Festplatte! Unter *System Preferences* > *Security & Privacy* > Tab *FileVault* > *Turn on FileVault* klicken und zurücklehnen.

### Fazit

Alles in allem ist das Setup, vor allem durch das Auslagern vieler Dependencies in die Vagrant Machine, sehr kurz gehalten. Das Neuinstallieren meines Computers vor wenigen Tagen hat mich somit nur 1,5h gekostet. Sehr überschaubar, für die vielen Möglichkeiten, die mir das Setup bietet.

### Bonus: Code in die Dropbox legen

Persönlich benutze ich zwei Geräte. Das Synchronisieren der Dateien erledigt Dropbox. Das ist nichts spezielles. Zusätzlich lege ich aber meine lokalen Git-Repositories ebenfalls in die Dropbox. Vorteil: Auch wenn am Ende eines Arbeitstages alle Code-Änderungen auf Github hochgeladen wird, kann ich direkt zuhause im gewohnten Setup weiterarbeiten, ohne dass ich wieder alle Feature-Branches händisch auschecke.

### Ergänzungen?

Was sind eure Ergänzungen? Wobei verwendet ihr andere Tools? Was findet ihr furchtbar? :) Wenn ihr wollt, könnt ihr diesen Blog-Post einfach forken und um Korrekturen oder weitere Tipps ergänzen! Wie? Einfach hier [https://github.com/johannesnagl/johannesnagl.github.io/blob/master/_posts/2013-12-30-Mein-perfektes-Mac-Developer-Setup.md](https://github.com/johannesnagl/johannesnagl.github.io/blob/master/_posts/2013-12-30-Mein-perfektes-Mac-Developer-Setup.md) auf editieren klicken!
