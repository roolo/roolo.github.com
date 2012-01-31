---
layout: post
title: Rvm a rbenv
categories:   [ruby, dev, pokročilý]
excerpt: |-
  V tomto postu píši o způsobu fungování dvou pro mě nejznámějších manažerů Ruby verzí a prostředí.
  
---

### O co jde?

Jak rbenv, tak rvm jsou nástroje na správu verzí a prostředí ruby. V praxi to znamená, že vám tyto nástroje umožní přepínat mezi nainstalovanými verzemi ruby. To se hodí pokud je potřeba na jednom počítači pracovat s projekty v různych verzích ruby.

Příklad:

1. Projekt -- Ruby Enterprise Edition
2. Projekt -- Ruby 1.9.2
3. Projekt -- Ruby 1.9.3

Dokud bychom chtěli jenom Ruby 1.8 a 1.9, tak nám stačí jednu z verzí skompilovat se suffixem verze a máme vystaráno. Problémem může být, že si každý skompiluje suffixy jinak. Další věc je, že vývojář musí střídat verze tim jaký příkaz volá `ruby` / `ruby19` / `ruby1.8`. Oba zde popisované nástroje za vás tento problém vyřeší tím, že vám poskytnou prostředí ve kterých máte jenom jedno ruby a mezi těmito prostředími se můžete snadno přepínat buď příkazem, nebo automatizovanou konfigurací.

### Rvm
[Stránky projektu](http://beginrescueend.com/)

Rvm je kompletní systém na správu verzí ruby. Jedním příkazem se z internetu stáhnou a skompilují zdrojové kódy chtěné verze ruby, či se vytvoří sadu gemů, která bude sloužit pouze pro jeden projekt a nebo pro celou verzi ruby. Bylo by otravné přepínat verzi ruby pokaždé když přejdu do nějakého projektu. To řeší rvm dvěmi cestami. Budťo se příkazem nastaví defaultní ruby pro celý systém a nebo se pro daný adresář/projekt vygeneruje jiným příkazem soubor `.rvmrc`. Po tomto souboru se rvm při vstupu do adresáře poohlíží a v případě, že ho najde tak podle něj nastaví aktuální prostředí. Toto nastavení zahrnuje verzi ruby a volitelně i gemset (používaná sada gemů). Pokud by nebylo psaní do terminálu po chuti, tak má rvm celkem i povedené GUI [JewelryBox](http://unfiniti.com/software/mac/jewelrybox) pro systém Mac OS X.

Co se týče instalace, tak je určitě jednodušší rvm, kde se pouze do terminálu zkopíruje příkaz ze stránek projektu a je nainstalováno. Jednodušší je v rvm také instalace jednotlivých ruby verzí. Pokud chci v rvm například nainstalovat ruby-1.9.2, stačí mi jako verzi zadat pouze 1.9.2 a automaticky se instaluje verze ruby-1.9.2-p290, která je aktuální stable. To samé například s ree a ree-1.8.7-2011.12.

### Rbenv
[Stránky projektu](https://github.com/sstephenson/rbenv)

Rbenv si klade mnohem menší cíle a slouží pouze k přepínání verzí ruby. Neobsahuje tedy ani instalaci ruby ani správu gemsetů. Již v základu funguje automatické přepínání verzí na základě definičního souboru v projektu/adresáři. Oproti rvmrc, kde jde o sofistikovanější skript, se jedná o prostý soubor (`.rbenv-version`) obsahující pouze název ruby, které se má použít.

Pokud bychom chtěli, aby nám rbenv i instaloval jednotlivé verze ruby, dopomůže nám k tomu jiný nástroj od autora rbenv a to [ruby-build](https://github.com/sstephenson/ruby-build). Tento nástroj se instaluje naklonováním repozitáře a spuštěním instalačního skriptu v nově naklonovaném repozitáři. Podobně jde doinstalovat i podpora gemsetů, naklonováním [rbenv-gemset](https://github.com/jamis/rbenv-gemset) do adresáře `~/.rbenv/plugins`.

V případě rbenv je nutné při instalaci uvést celé jméno verze, kterou chceme nainstalovat a celou verzi pak psát i při další práci s daným ruby. Proto je vhodné pro projekty/adresáře používat dříve zmíněné definiční soubory pro chtěnou verzi ruby.

### Závěrem

Rbenv je oproti rvm o dva roky mladší a jistě neposkytuje tak bohatý systém pro správu verzí, ale jeho velké plus je jednoduchost, rychlost a ekologie;) Jedna z věcí, které občas uživatelům rvm vadí je, že core příkazy rvm implementuje jako funkce v shellu. Naproti tomu rbenv jde cestou jednoho adresáře se "spustitelnými soubory", který je v path a "spustilné soubory" jsou ve skutečnosti jen linky na spustistelné soubory z právě potřebné verze ruby.
