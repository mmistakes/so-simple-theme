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

Da es in letzter Zeit ein paar Nachfragen zur geplanten Funkregulierung in den USA/Europa und deren Auswirkungen auf Freifunk gab, haben wir einen Heise Artikel zum Anlass genommen das mal etwas näher zu erklären. In den USA gibt es ebenso wie in Europa von politischer Seite das Bestreben, die Software auf Routern strenger zu regulieren. Nachdem die ersten Gerüchte über ein mögliches Verbot alternativer Firmwares aufkamen, ist es in den USA zu ersten Protesten der Open Source Community gekommen, so dass sich die FCC (US Regulierungsbehörde) genötigt sah ihre Anforderungen etwas genauer darzustellen (siehe Artikel). Wir wollen hier aufzeigen was das, unserer Meinung nach, für den Freifunk bedeutet.
Speziell scheint es der FCC darum zu gehen ein Senden auf falschen Frequenzen oder mit zu viel Leistung im 5GHz Band zu verhindern. Die FCC gibt keinen Grund an, warum sie das tun möchte, wahrscheinlich ist aber, das man das 5GHz Band auch recht intensiv für militärische Zwecke, Radaranwendungen und Satellitenkommunikation verwendet. Daher soll WLAN nicht überall auf der Welt mit den gleichen Frequenzen betrieben werden. Ein Senden auf der falschen Frequenz oder mit zuviel Leistung könnte diese Anwendungen stören. Zusätzlich gibt es in den Routern auch Systeme, welche den Betrieb anderer Systeme aktiv schützen. So wird z.B. mit DFS (Dynamic Frequency Selection) der WLAN Kanal gewechselt, sobald der Router das Signal von einem Wetterradar empfängt. Daraus ergibt sich die Frage was für Maßnahmen die Hersteller ergreifen werden um der neuen Regelung zu entsprechen.
Eine Möglichkeit wäre, dass der Router nur signierte, also quasi unterschriebene, Firmwares akzeptiert. Für das Freifunkprojekt wäre das die ungünstigste Variante. Ähnlich wie bei Smartphones werden wohl auch diese Signaturen nicht lange sicher sein. Wer will schon eine potentiell illegale Aktion begehen um Software auf Router zu flashen? Vom Aufwand her mal ganz zu schweigen.
Was bleibt ist eine eigene länderspezifische Hardwareversion, welche die entsprechenden Parameter des jeweiligen Landes sicherstellt. Dabei stellt sich allerdings auch die Frage ob die Hersteller das beim Erlass einer entsprechenden Regelung auch zeitnah umsetzen können. Uns ist bisher kein WLAN-Chipsatz bekannt der entsprechende Funktionen enthält. Entsprechende Chipsätze müssten erst produziert werden. Die Software für diese Funktionen müsste vermutlich auch noch entwickelt werden. Es ist leider unwahrscheinlich, dass Hersteller diesen Weg gehen, wenn sich elektronische Signaturen mit einer Firmware quasi zum Nulltarif umsetzen lassen.

All diese Möglichkeiten haben gemein, das sie (wahrscheinlich) bewusste Fehleinstellungen oder Konfigurationen des Benutzers verhindern sollen. Wer bewusst hohe Sendeleitungen oder andere Frequenzbereiche nutzen möchte, wird das erreichen.

Für den Freifunk bedeutet das: Der aktuelle Status bedeutet weder Alarmstufe Rot noch eine Entwarnung. Wir müssen diese Entwicklung auch weiter im Auge behalten und rechtzeitig mit entsprechender Lobbyarbeit aktiv werden.

Dabei zählen wir auf euch.
