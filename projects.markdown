---
layout: default
title: Moje projekty

---
<h2>Moje projekty</h2>
- [Timelog](#timelog)
- [Scotland](#scotland)
- [Certified net/http requests](#certified-net-http-requests)
- [MWSTT](#mwstt)
- [Můj profil na github.com](https://github.com/roolo)

{% capture ajax_link %}<a href="http://cs.wikipedia.org/wiki/AJAX">AJAX</a>{% endcapture %}
{% capture bootstrap_link %}<a href="http://twitter.github.com/bootstrap/">Twitter Bootstrap</a>{% endcapture %}
{% capture db_postgres_link %}<a href="http://www.postgresql.org/">PostgreSQL (produkce)</a>{% endcapture %}
{% capture db_sqlite_link %}<a href="http://www.sqlite.org/">SQLite (vývoj)</a>{% endcapture %}
{% capture gems_link %}<a href="http://rubygems.org/">RubyGems</a>{% endcapture %}
{% capture git_link %}<a href="http://git-scm.com/">Git</a>{% endcapture %}
{% capture rack_link %}<a href="http://rack.rubyforge.org/">Rack</a>{% endcapture %}
{% capture rails_link %}<a href="http://rubyonrails.org/">Ruby on Rails</a>{% endcapture %}
{% capture ruby_link %}<a href="http://www.ruby-lang.org/en//">Ruby</a>{% endcapture %}



{% capture name %}Timelog{% endcapture %}
{% capture name_id %}timelog{% endcapture %}
{% capture perex %}Aplikace pro vytváření oriantačních bodů v čase. Jedná se vlastně o zjednodušenou verzi desktopové aplikace [GTimeLog](http://mg.pov.lt/gtimelog/).{% endcapture %}
{% capture description %}
{% endcapture %}
{% capture image_name %}generic{% endcapture %}
{% capture url_code %}https://github.com/roolo/timelog{% endcapture %}
{% capture url_app %}http://webtimelog.heroku.com/{% endcapture %}
{% capture technologies %}
	{{rails_link}},
	{{ruby_link}},
	{{git_link}},
	{{ajax_link}},
	{{bootstrap_link}},
	{{gems_link}},
	{{db_postgres_link}},
	{{db_sqlite_link}}
{% endcapture %}
{% include project.markdown %}

{% capture name %}Scotland{% endcapture %}
{% capture name_id %}scotland{% endcapture %}
{% capture perex %}Šablona pro spouštění soustav dokumentací kódu systému [YARD](http://yardoc.org/) jako aplikací {{rack_link}}. Vytvářeno pro použití na serveru [Pow](http://pow.cx/).{% endcapture %}
{% capture description %}
{% endcapture %}
{% capture image_name %}generic{% endcapture %}
{% capture url_code %}https://github.com/roolo/scotland{% endcapture %}
{% capture url_app %}https://github.com/roolo/scotland#readme{% endcapture %}
{% capture technologies %}
	{{ruby_link}},
	{{git_link}},
	{{gems_link}},
	{{rack_link}}
{% endcapture %}
{% include project.markdown %}


{% capture name %}Certified net/http requests{% endcapture %}
{% capture name_id %}certified-net-http-requests{% endcapture %}
{% capture perex %}
Knihovna pro certifikované https požadavky na [Mac OS X](http://cs.wikipedia.org/wiki/Mac_OS_X_Lion) v {{ruby_link}} prostředí.{% endcapture %}
{% capture description %}
V současné době (24.4.2012) je k Mac OS X Lion přibalen seznam certifikačních autorit poněkud staršího data. To v {{ruby_link}} skriptech způsobuje, že i servery, které mají svůj certifikát v pořadku, jsou označeny za nedůveryhodné. 

Tato moje knihovna používá [neoficiální seznam certifikačních autorit ze stránek projektu cURL](http://curl.haxx.se/docs/caextract.html). Použitím mojí knihovny, jsou automaticky všechny https požadavky, prováděny přes knihovnu [net/http](http://ruby-doc.org/stdlib-1.9.3/libdoc/net/http/rdoc/Net/HTTP.html), prověřovány za pomocí certifikačních autorit z tohoto seznamu. Nástroj přibalený v mé knihovně je také schopen používaný seznam certifikačních autorit aktualizovat.
{% endcapture %}
{% capture image_name %}generic{% endcapture %}
{% capture url_code %}https://github.com/roolo/certified-net-http-requests{% endcapture %}
{% capture url_app %}https://rubygems.org/gems/certified-net-http-requests{% endcapture %}
{% capture technologies %}
	{{ruby_link}},
	{{git_link}},
	{{gems_link}}
{% endcapture %}
{% include project.markdown %}


{% capture name %}MWSTT{% endcapture %}
{% capture name_id %}mwstt{% endcapture %}
{% capture perex %}Zjednodušeně se jedná o aplikaci na měření času (time tracker).{% endcapture %}
{% capture description %}
Přihlášený uživatel má k dispozici jednoduchý dialog, ve kterém napíše na čem zrovna pracuje a stiskem tlačítka se započne počítaní času. Dalším stiskem tlačítka ukončí počítání času k dané aktivitě. Uživatel může vidět jak průběžný čas během práce na dané aktivitě, tak i procházet dřívější aktivity. Pokud uživatel vyplňuje název aktivity, na které již dříve pracoval, tak je mu tento název nabídnut a čas je pak vidět pod aktivitou s daným názvem.

Každá práce na aktivitě může být označkována, přiřazena pod projekt a označena jako zapsaná v centrálním time trackeru (ctt). Značkování umožňuje uživateli mít jednoduchý přehled na jakém typu úkolů nejvíce pracuje, pomocí značkového mraku (tag cloud), popřípadě najít předešlé, podobné práce na aktivitách. S pojmem ctt aplikace pracuje, protože mnoho firem i samostatných vývojářů již nějaké řešení na zaznamenávání času využívá. Označením aktivity jako (ne)zapsané v ctt je možné pohodlně udržovat přehled nad jaké časy jsou již zapsány ve firemním time trackeru, u klienta, či v jiné aplikaci.

V rámci svého účtu si uživatel může nastavit uživatelské jméno, jazyk prostředí (čeština, angličtina), časovou zónu z jaké pochází, sadu ikon pro prostředí aplikace a změnit svoje přístupové heslo ke svému uživatelskému účtu.
{% endcapture %}
{% capture image_name %}generic{% endcapture %}
{% capture url_code %}https://github.com/roolo/mwstt{% endcapture %}
{% capture url_app %}http://mwstt.heroku.com/{% endcapture %}
{% capture technologies %}
	{{rails_link}},
	{{ruby_link}},
	{{git_link}},
	{{ajax_link}},
	{{gems_link}},
	{{db_postgres_link}},
	{{db_sqlite_link}}
{% endcapture %}
{% include project.markdown %}
