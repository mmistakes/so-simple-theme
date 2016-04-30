---
layout: page
modified:
categories:
excerpt: "Die FAQ rund um uns und unser Netz"
title: FAQ
omit_search: false
tags: []

date: 2015-11-12T19:53:06+01:00
---

### Erlaubt mein Internet-Provider Freifunk über meinem Internetzugang?

Einige Anbieter von DSL-Flatrates verbieten die Mehrplatznutzung in ihren AGBs. Uns sind allerdings bisher keine Beschwerden von Providern bekannt.

### Ich wohne abseits bzw. auf dem Land. Lohnt sich überhaupt ein Knoten bei mir?

Der Aufbau eines Freifunkknotens lohnt sich immer. Wir haben schon häufig festgestellt das Freifunkrouter, bei denen nicht mit einer starken Nutzung gerechnet wurde, sich sehr gut entwickelt haben. Nur durch neue Router kann sich die Freifunkidee entfalten. Jeder stellt doch letztlich gerne seinem Besuch einen unkomplizierten Internetzugang zur Verfügung. Bei dem Zugang zu einem Freifunkknoten muss weder der WLAN Schlüssel ausgetauscht werden, noch eine Registrierung erfolgen. Das private WLAN kann natürlich parallel betrieben werden.

### Ich habe Probleme mit meinem Router oder dem Netz. An wen kann ich mich wenden?

Du kannst eine E-Mail an support @ freifunk-westerwald.de schreiben oder ein Ticket unter <https://tickets.freifunk-westerwald.de/> eröffnen.

### Wie rechtfertigt ihr Urheberrechtsverletzungen, welche über das Freifunknetz begangen werden können?

Gar nicht. Wir sind nicht davon angetan, wenn Freifunk für kriminelle Zwecke missbraucht wird. Allerdings ist es, wie mit so vielen Dingen im Leben, etwas das für gute Sachen genutzt werden kann, kann ebenso auch für schlechte Sachen genutzt werden. Es erscheint weit hergeholt, dass man beispielsweise scharfe Messer verbieten würde, weil man damit Menschen schädigen kann. Würden wir alle Technologien verbieten, mit denen man einem Menschen Schaden zufügen könnte, wären wir immer noch am Anfang der Steinzeit. Wir stehen für eine freie und ungehinderte Verbreitung von Wissen und Ressourcen. Wir möchten Technologien nicht für gesellschaftliche Probleme verantwortlich machen.

<style>
    h3 {
        position: relative;
        cursor: pointer;
    }
    h3 > i {
        position: absolute;
        top: calc(50% - 15px);
        left: -33px;
    }
    h3 + p {
        display: none;
    }
    h3.active + p {
        display: block;
    }
</style>
<script>
    document.addEventListener( "DOMContentLoaded", function( event ) {
        // HACK: iterate over elements
        Array.prototype.forEach.call(document.getElementsByTagName( "h3"), ( function( headline ){
            var icon = document.createElement( "i" );
            icon.className = "fa fa-plus-circle";
            headline.appendChild( icon );

            headline.addEventListener("mousedown", function() {
                var active = !!this.className;
                this.className = active ? "" : "active";
                icon.className = active ? "fa fa-plus-circle" : "fa fa-minus-circle";
            });
        }));
    });
</script>
