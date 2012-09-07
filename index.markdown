---
layout: default
title: ''
---
<section id="articles">
{% for post in site.posts %}
  <article data-identifier="{{post.title}}" ng-hide="hasNotFound('{{post.title}}')">
    <h2><a href="{{post.url}}">{{post.title}}</a></h2>
    <p>
      {{post.date | date:"%d.%m.%Y %H:%M"}}
    </p>
    <p>
      {{post.excerpt}}
    </p>
    <p>
      <a href="{{post.url}}">Zbytek textu</a>
    </p>

  </article>
{% endfor %}
</section>
