---
layout: default
title: Blogysek Mailicka
---
{% for post in site.posts %}
<div class="post">
<h2><a href="{{post.url}}">{{post.title}}</a></h2>
<p class="post-excerpt">
{{post.excerpt}}
</p>
<p>
<a href="{{post.url}}">Zbytek textu</a>
</p>
<p>
<span style="color: #999;">Publikováno</span>
<span style="color: #F90;">{{post.date | date:"%d.%m.%Y %H:%M"}}</span>
</p>
</div>
{% endfor %}
