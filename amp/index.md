---
layout: amp/default
title: ''
---
{% for post in site.posts %}
<article>
  <h2><a href="{{post.url}}">{{post.title}}</a></h2>
  <time class="block bold my0" datetime="{{post.date | date:"%Y-%m-%d"}}">
    {{post.date | date:"%d.%m.%Y"}}
  </time>
  <p class="justify my1">
    {{post.excerpt}}
  </p>
  <div class="mt0">
    <a href="{{post.url}}">Zbytek textu</a>
  </div>

</article>
<hr/>
{% endfor %}
