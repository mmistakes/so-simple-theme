# Freifunk Westerwald Webseite
Jeder Commit in diesem Repository von Travis überprüft.  
[![Build Status](https://travis-ci.org/FreifunkWesterwald/Jekyll-Website.svg?branch=master)](https://travis-ci.org/FreifunkWesterwald/Jekyll-Website)

Dieses Repository enthält sowohl die Inhalte der Website
[freifunk-westerwald.de](https://freifunk-westerwald.de/), als auch einen
Fork des Jekyll Themes [so-simple-theme](https://github.com/mmistakes/so-simple-theme).

Zur Erstellung der Html Seiten wird der 'static site generator'
[Jekyll](https://jekyllrb.com/) verwendet.


## Änderungen machen:
Jeder ist herzlich eingeladen Informationen hinzuzufügen oder Fehler zu korrigieren.
Um die Texte auf der Seite zu ändern müssen nur die dazu
gehörigen [Markdown](http://markdown.de/) Dateien angepasst werden.  
Das kann man z.B. machen in dem man einfach direkt in GitHub auf bearbeiten klickt, dann wird ein Pull-Request erzeugt und jemand aus dem Team muss die Änderungen noch bestätigen.
Wenn man die Änderungen direkt in der Seite sehen möchte empfiehlt es sich die
Seite [lokal einzurichten](#lokale-installation).


## Wo gibts was zu tun?
Alle Aufgaben werden [hier](https://github.com/FreifunkWesterwald/issues/issues) verwaltet.

## Lokale Installation
### Voraussetzungen
Um die Website bei sich lokal zum laufen zu bringen, werden folgende
Programme benötigt:
- [git](https://git-scm.com/)
- [ruby](https://www.ruby-lang.org/de/)
- [jekyll](https://jekyllrb.com/)
- [bundler](http://bundler.io/)
- [nodejs](https://nodejs.org)
- [bower](http://bower.io)
- [grunt](http://gruntjs.com/) (nur für Anpassungen am Source Code)

Falls nicht vorhanden, können diese z.B. unter Arch-Linux folgendermaßen
installiert werden. Bei andern Systemen müssen statt pacman die individuellen
Paketmanager verwendet werden, bzw. unter Windows die Programme einzeln von
den Hersteller-Seiten geladen werden.

```sh
sudo pacman -S git
sudo pacman -S ruby
gem install bundler
gam install jekyll
sudo pacman -S nodejs
sudo pacman -S npm #Wird bei anderen Paketmanagern oft mit node installiert
sudo npm install -g bower
sudo npm install -g grunt-cli
```

### Herunterladen
Um später die Änderungen auch wieder hochladen zu können, ist es sehr zu
empfehlen git zu verwenden.

```sh
git clone https://github.com/FreifunkWesterwald/Jekyll-Website.git
cd Jekyll-Website
```

### Installation der Abhängigkeiten
```sh
npm install
```

### Erstellen der Seite
```sh
grunt
bundle exec jekyll build
grunt gulp:hypher
```

### Server starten und auf Änderungen warten

```sh
npm start
```

Die Seite kann dann im browser unter [localhost:4000](http://localhost:4000/) aufgerufen werden.
