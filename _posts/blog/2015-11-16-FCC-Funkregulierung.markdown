---
layout: post
title: Neue Funkregulierung
author: justelex
share: true
comments: true
modified:
categories: blog
excerpt:
tags: []
image:
  feature:
date: 2015-11-16T20:42:36+01:00
---

Da es in letzter Zeit ein paar Nachfragen zur geplanten Funkregulierung in den USA/Europa und deren Auswirkungen auf Freifunk gab, haben wir einen Heise Artikel zum Anlass genommen das mal etwas näher zu erklären. In den USA gibt es ebenso wie in Europa von politischer Seite das Bestreben, die Software auf Routern strenger zu regulieren. Nachdem die ersten Gerüchte über ein mögliches Verbot alternativer Firmwares aufkamen, ist es in den USA zu ersten Protesten der Open Source Community gekommen, so dass sich die FCC (US Regulierungsbehörde) genötigt sah ihre Anforderungen etwas genauer dazustellen (Siehe Artikel). Wir wollen hier mal etwas aufdröseln was das unserer Meinung nach für Freifunk bedeutet.
Speziell scheint es der FCC darum zu gehen ein senden auf falschen Frequenzen oder ein senden mit zuviel Leistung im 5GHz Band zu verhindern. Die FCC gibt keinen Grund an, warum sie das tun möchte, wahrscheinlich ist aber, das man das 5GHz Band auch recht intensiv für Militärische Zwecke, Radaranwendungen und Satellitenkommunikation verwendet und WLAN nicht überall auf der Welt mit auf den gleichen Frequenzen betrieben werden darf. Ein senden auf der falschen Frequenz oder mit zuviel Leistung kann diese Anwendungen stören. Zusätzlich gibt es in den Routern auch Systeme, welche den Betrieb anderer Systeme aktiv schützen. So wird z.B. mit DFS der WLAN Kanal gewechselt sobald der Router das Signal von einem Wetterradar empfängt. Daraus ergibt sich die Frage was für Maßnahmen die Hersteller ergreifen werden um der neuen Regelung zu entsprechen.
Eine Möglichkeit wäre das der Router nur signierte, also quasi unterschriebene, Firmware akzeptiert. Für das Freifunkprojekt wäre das die ungünstigste Variante. Zwar wird auch die Signatur nicht lange sicher sein, ähnlich wie bei Smartphones, wird es nach einer weile geknackt und damit offen sein. Aber wer will schon eine potentiell illegale Aktion begehen um Software auf Router flashen? Vom Aufwand mal ganz zu schweigen.
Was bleibt ist eine eigene länderspezifische Hardwareversion, welche die entsprechenden Parameter des jeweiligen Landes sicherstellt. Dabei stellt sich allerdings die Frage ob die Hersteller das beim Erlass einer entsprechenden Regelung auch zeitnah umsetzen können. Uns ist bisher kein WLAN-Chipsatz bekannt der entsprechende Funktionen enthält, was bedeutet, das entsprechende Chipsätze, Treiber und Software müssten entwickelt und produziert werden. Es ist leider unwahrscheinlich, das die Hersteller diesen Weg gehen, wenn sich eine elektronische Signatur unter der Firmware fast umsonst umsetzen lässt.

Alle diese Möglichkeiten haben gemein, das sie (wahrscheinlich) bewusste Fehleinstellungen oder Konfigurationen des Benutzers verhindern sollen. Wer bewusst hohe Sendeleitungen oder andere Frequenzbereiche nutzen möchte, wird das erreichen. so oder so.

Für Freifunk bedeutet das: Der Aktuelle Status bedeutet daher weder Alarmstufe rot noch Entwarnung. Wir müssen diese Entwicklung auch weiter im Auge behalten und rechtzeitig mit entsprechender Lobbyarbeit aktiv werden.

Dabei zählen wir auf euch 
