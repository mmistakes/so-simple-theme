---
layout: en-page
title: Events
excerpt: "An overview of events on a map."
search_omit: true
---

<div id="map" class="post-map-header" style="height: 400px"></div>

<ul class="post-list">
{% for post in site.categories.event %} 
	{% if post.categories contains 'en' %}
		<li><article><a href="{{ site.url }}{{ post.url }}">{{ post.title }} <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%B %d, %Y" }}</time></span>{% if post.excerpt %} <span class="excerpt">{{ post.excerpt }}</span>{% endif %}</a></article></li>
	{% endif %}
{% endfor %}
</ul>

<link href='//api.tiles.mapbox.com/mapbox.js/v1.6.1/mapbox.css' rel='stylesheet' />
<script src='//api.tiles.mapbox.com/mapbox.js/v1.6.1/mapbox.js'></script>
<script>
var geoJson = [{"type":"FeatureCollection","features":[
{% for post in site.categories.event %} 
    {% if post.categories contains 'en' %}
    {"type":"Feature","properties":{"marker-color":"#2A2B26"},"geometry":{"type":"Point","coordinates":[{{post.location}}]},
            "properties": {
                "description": "{{post.locationName}}",
                "tile" : "{{post.title}}"
            },
        }
        {% if forloop.last == false %},
        {% endif %}
    {% endif %}
{% endfor %}]}],
map = L.mapbox.map('map', 'katydecorah.h41bj3lj'),
markerLayer = L.mapbox.markerLayer().setGeoJSON(geoJson).addTo(map);
map.fitBounds(markerLayer.getBounds());
</script>