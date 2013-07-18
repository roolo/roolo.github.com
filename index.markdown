---
layout: default
title: ''
---
{% for post in site.posts %}
<article>
  <h2><a href="{{post.url}}">{{post.title}}</a></h2>
  <p>
    {{post.date | date:"%d.%m.%Y"}}
  </p>
  <p>
    {{post.excerpt}}
  </p>
  <p>
    <a href="{{post.url}}">Zbytek textu</a>
  </p>

</article>
{% endfor %}
