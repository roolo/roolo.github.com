--- 
name: jak-na-jabber-xmpp-server
layout: post
title: Jak na Jabber/XMPP server
date: 2007-11-07 01:32:00 +01:00
categories: 
- server
- Systém
- jabber
- komunikace
- začátečník

---
## Co budu potřebovat
### Software

Jak je asi jasné pudete potřebovat nějaké to železo a nějaký ten <a title="Seznam Jabber serverů" href="http://www.jabber.org/software/servers.shtml" target="_blank">software</a>. Zatím jsem zkusil <a title="Stránky projektu" href="http://www.process-one.net/en/ejabberd/" target="_blank">ejabberd</a> a <a title="Stránky projektu" href="http://www.igniterealtime.org/projects/openfire/" target="_blank">Openfire</a>, takže se bude vše vztahovat k těmto kouskům s tím že pokud vyzkouším nějaké další, tak si to moc dlouho nenechám pro sebe.

### "Železo"

Záleží na tom co budete od svého Jabber serveru chtít a který server zvolíte. Doma mi na 650MHz, 128MB v pohodě běží ejabberd pro pět uživatelů u Openfiru to jde už trochu ztuha. Pokud máte v plánu nějaký velkolepý server je zde samozřejmě lepší sáhnout po silném stroji Oba dva se samozřejmě docela dlouho spouští.

## ejabberd

Tento server je napsaný v jazyce <a title="Stránky projektu" href="http://www.erlang.org/starting.html">Erlang</a> a je tedy snadno spustitelný na platformách pro které je portován Erlang Virtual Machine. Ihned po instalaci máte běžící základní Jabber server. Ve webovém rozhraní sice nastavíte všechno, ale už to není zas tak pohodlné jako je tomu u Openfire. Pokud se rozhodnete pro podnikové nasazení je zde velice zajímavá funkce sdílených rosterů, takže si nemusí každý pracovník přidávat kontakty na celé vaše zámožné impérium, ale objeví se mu ihned po prvním přihlášení.

## Openfire( dříve wildfire )

Tento server je napsaný v <a title="Český portál o Javě" href="http://java.cz/">Javě</a>, takže ho také spustíte defakto kdekoliv. Po nainstalovaní vás přívětivé webové rozhraní provede doinstalací a máte běžící server. K samotnému Jabber serveru si můžete ještě napluginovat SIP( IP telefonie ), integraci s Asterikem( telefoní ústředna ). Stejně jako instalace i administrační rozhraní je velice uživatelsky přívětivé. Tento server je poněkud větší zátěž, ale je dělán více pro běžné uživatele, kteří chtějí pro své přátelé udělat Jabber server.
