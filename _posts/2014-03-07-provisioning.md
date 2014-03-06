---
layout: post
title:  Provisioning - Tools
categories:   [provisioning,dev,systém,vývojář,pokročilý,server,ansible,puppet,chef,salt]
excerpt: |-
  V tomto postu z rychlíku popisuji nejpoužívanější nástroje na provisioning. Původně tento text měl být pouze email
  pro kamaráda, ale nějak jsem se rozepsal, tak jsem si řekl, že to hodím sem :)

---

Všechny čtyři nástroje v ryzí formě fungují tak, že máš jednu/dvě instance
jejich démona a kolem spousty klientů, kteří se čas od času zeptají, jestli
jsou nastavení tak jak mají být. Za všema čtyřma stojí firmy, který maji byznys
postavený na tom, že ti poskytují infrastrukturu pro distribuci a managovaní
konfigurací tvých strojů. Já to zatím používám bez serverů. Prostě to pustím
lokálně a ono to aplikuje konfigurace na aktuální stroj.

Tyhle nástroje se používají ve škálovaní pokud potřebuješ nahodit 33. stroj
podobného ražení, tak abys to nemusel dělat ručně. Další využití je na
vývojářské virtuály. Popíšeš jak má stroj vypadat a nemusíš se bát, že když bys
o mašinu přišel (nebo ji prostě zahodil ;) ), tak bys musel vše sám nastavovat
znova.

### Ansible

Na prestižním českém webu mi vyšel článek o [Ansible](http://www.rooland.cz/2014/02/26/ansible.html).
To je zatím první nástroj se kterým jsem i [něco](https://github.com/roolo/provision-ansible) stvořil :)
Napsané to je v Pythonu. Lidové repozitáře konfiguračních modulů jsou na
[https://galaxy.ansible.com](https://galaxy.ansible.com), ale ještě se mi to nepodařilo rozběhat to jako balíčkovací
systém. Těmto modulům se říká [Role](http://docs.ansible.com/playbooks_roles.html).

### Chef

V současné době se učím s nástrojem [Chef](http://www.getchef.com/chef/), ale
zatím mi [to](https://github.com/roolo/provision-chef) jde ztuha.
Napsaný to je v Ruby. Lidové repozitáre konfiguračních modulů jsou na
[http://community.opscode.com](http://community.opscode.com). Těmto modulům se říká
[Recepty](http://docs.opscode.com/essentials_cookbook_recipes.html). Ve spojení s třeba
[Berkshelfem](http://berkshelf.com) je fakt celkem snadný si přidávat hotový věci od jiných
lidí. Ano Berkshelf je od lidí co dělají LoLko ;)

Další hlavní hráči na trhu jsou Puppet a Salt.

### Puppet

Puppet má hodně pěkně udělané [úvodní tutoriály](https://puppetlabs.com/learn/library).
Akorát se člověk musí zaregistrovat což myslím nebyl žádný informační pain. Napsaný to je v Ruby. Lidové repozitáře
konfiguračních modulů jsou na [https://forge.puppetlabs.com](https://forge.puppetlabs.com), ale nedostal jsem
se v Puppetu tak daleko abych je použil.

### Salt

[Salt](http://docs.saltstack.com) je celkem podobný Ansible ale mě přišlo že
se moc zažírá do systému. Je to napsaný v Pythonu. Nemá to úplně volně
přispěvatelné repozitáře modulů, ale [tady je aspoň něco](https://github.com/saltstack-formulas/).
Těmto modulům se říká [Formule](http://docs.saltstack.com/topics/conventions/formulas.html)
(né ty co dělaj rámus a lítaj vzduchem ;)).


Tvým úkolem Jíme, pokud ho přijmeš, je si ty nástroje vyzkoušet a říct mi svůj
názor.

