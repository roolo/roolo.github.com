---
layout: default
title: Projekty na kterých dělám

---
<h2>Projekty na kterých dělám</h2>

{% capture rails_link %}<a href="http://rubyonrails.org/">Ruby on Rails</a>{% endcapture %}
{% capture ruby_link %}<a href="http://www.ruby-lang.org/en//">Ruby</a>{% endcapture %}
{% capture git_link %}<a href="http://git-scm.com/">Git</a>{% endcapture %}
{% capture ajax_link %}<a href="http://cs.wikipedia.org/wiki/AJAX">AJAX</a>{% endcapture %}
{% capture bootstrap_link %}<a href="http://twitter.github.com/bootstrap/">Twitter Bootstrap</a>{% endcapture %}

{% capture name %}mwstt{% endcapture %}
{% capture name_id %}mwstt{% endcapture %}
{% capture description %}
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
{% endcapture %}
{% capture image_name %}generic{% endcapture %}
{% capture url_code %}https://github.com/roolo/mwstt{% endcapture %}
{% capture url_app %}http://mwstt.heroku.com/{% endcapture %}
{% capture technologies %}
	{{rails_link}},
	{{ruby_link}},
	{{git_link}},
	{{ajax_link}},
	{{bootstrap_link}},
{% endcapture %}
{% include project.markdown %}



