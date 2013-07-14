--- 
name: git-co-to-je-a-co-s-t-m
layout: post
title: "Git - co to je a co s tím"
date: 2010-04-05 21:30:00 +02:00
alias: /programovani/2010/04/git-co-to-je-a-co-s-tim/
categories: 
- git
- vývojář
- programování
- kolaborace
- vývoj
- záčátečník
excerpt:  |-
  V tomto postu popíšu takový základ fungování gitu a příkazy, které použijete při práci nejčastěji.

---

[Git](http://git-scm.com) je <a href="http://en.wikipedia.org/wiki/Distributed_version_control_system"><abbr title="Distribuovaný/Decentralizovaný Systém pro Kontrolu Verzí">DVCS</abbr></a>. Jako takový nevyžaduje pro své fungování, žádný server. Repozitář máte celý u sebe. To je výhoda, ale některé lidi to zkrátka děsí. Většina obav plyne z objemu dat, které musí mít vývojář u sebe. Vetšinou se ale jedná o necelou velikost pracovní kopie navíc. To neznamená pouze, že můžete pracovat i bez připojení k serveru, ale také že je většina opearací rychlejší, protože se nic nepřenáši po síti, ale pouze se čte z disku.

Další věc která vyplívá z distribuovatelnosti je rozhození čísel revizí. V systému Git se spíš než pojem revize používá pojem changeset. Jedná se o sadu změn, kterou jste provedli při jednom commitu, nebo jeho doplnění (git commit --amend). Takový changeset je identifikován hashem SHA-1. Tento hash je tvořen právě změnami, které jste provedli.

Spolupráce mezi vývojáři probíhá buďto přes centrální server, nebo přes souborový systém. V případě serveru je to buďto nějaký váš server. Pokud takový nemáte můžete využít nějaký z veřejně provozovaných. Uvedu například <a href="http://github.com/">github</a>, <a href="http://gitorious.org/">Gitorious</a>, <a href="http://repo.or.cz/">repo.or.cz</a>. Autentizace probiha přes ssh klíče a vy vlastně čtete soubory pres ssh. Nedávno jsem publikoval posty <a href="http://www.rooland.cz/system/2010/03/31/git-pres-ssh-na-windows/">Git pres ssh na Windows</a> a  <a href="http://www.rooland.cz/komunikace/2009/12/ssh-na-windows/">SSH na Windows</a>. Ty vám mohou pomoci při rozjíždění kolaborace s jinými vývojáři. Celkem pěkně je postup zpracován také na <a href="http://help.github.com/msysgit-key-setup/">Githubu</a>.

### Základní workflow
#### Zapojení se do existujícího projektu

Jako první si musíte repozitář stáhnout k sobě. V systému git se této operaci říká Klonování:

    git clone git://github.com/git/hello-world.git

Provedete nějaké zmeny a commitnete je:

    git add .
    git commit

Pri commitu se systém git chová trochu jinak než třeba svn. Commit v systému git necommituje automaticky všechny změny, ale akorát ty co mu řeknete. git add přidá všechny změny ke commitnutí. Pokud by jste pouzily prikaz <em>git add surface.c</em> budou commitovány pouze změny v souboru surface.c. Nutno dodat že soubor bude commitován ve stavu při kterém jste použily <em>git add</em>. Pokud nechce používat staging (pripravovani ke commitu), můžete přidat příkazu commit přidat parametr -a:

    git commit -a

Takhle git commitne všechny změny.

Takhle můžeme udělat třebas 20 commitů a teprve až potom nahrát změny na server, či kolegovi. V systému git se používá pojem push.

    git push

Bez parametrů git pushuje na server origin. To je v tomto případě server ze kterého jste klonovaly.

#### Vytvoření a zveřejnění projektu

Verzovaný adresář vytvoříme v systému git příkazem init v adresáři projektu a přidáním jeho obsahu k verzování:

    git init
    git add .

Zbytek je stejný jako v předešlé části až do pushe. Tady nebude git vědět co po něm chcete, protože projekt nenese informaci o žádném jiném repositáři. Ta se přidává přikazem remote.

    git remote add origin git://github.com/git/hello-world.git

Stejně by jste si klidně mohly přidat repozitář kolegy Petra

    git remote add petr git://github.com/git/hello-world.git

V tomto případě by asi adresa byla jiná, ale radši jsem použil existující repozitář. Při pushi k Petrovi byto pak bylo:

    git push petr


### Grafické nástroje

Součástí instalace Gitu jsou i nástroje gitk a git-gui. Oba se spouští v adresáři, který je verzovaný systémem pro správu verzí Git.

Gitk je nástroj pro prohlížení historie projektu. Zobrazí vám graf historie, jak se větve mergeovaly. Jednotlivé changesety s jejich podrobnymi informacemi, pokud na nejaky kliknete.

Git-gui je grafická nadstavba nad příkazy systému git. Umožní vám pohodlně commitovat, stageovat a tak podobně.

### Závěrem

To je k základnímu workflow vše. Pokud by vás zajímaly složitější postupy, tak napište do komentářů a můžeme se sejít u dalšího postu na podobné téma;) Dále také můžu vřele doporučit knihu Pro Git, která je volně k dispozici (<a href="http://progit.org/">http://progit.org/</a>). Kniha také vyšla v češtine od cz.nic - <a href="http://knihy.nic.cz/">http://knihy.nic.cz/</a>, kde je také k volně dispozici v češtině a zároveň si ji můžete koupit, pokud dáváte přednost papíru. Anglický originál jsem nečetl, ale v českém vydání se informace trochu rozcházejí s jinými zdroji dokumentace. Nejdená se však o nějaké velké odlišnosti, kvůli kterým by jste neměli být schopni se systémem pracovat.
