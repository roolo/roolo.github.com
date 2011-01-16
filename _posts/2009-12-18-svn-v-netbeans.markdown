--- 
name: svn-v-netbeans
layout: post
title: SVN v Netbeans
date: 2009-12-18 23:04:00 +01:00
topics: 
- vývojář
- subversion
- netbeans
- kolaborace
- vývoj
excerpt:  |-
  A je to tady. Slibovaný článek o Subversionu v Netbeans je tu. Pokusím se popsat možnosti jaké nám Netbeans nabízí pro Subversion. Soustředit se budu na každodení úkony. Tento post předpokládá, že již znáte základní pojmy SVN a trochu se orientujete v Netbeans. Popisovat budu možnosti v aktualní verzi 6.8
---
Předesílam, že integrací <abbr title="Subversion">SVN</abbr> do <abbr title="Netbeans">NB</abbr> nezískáte <abbr title="Snowboard">SNB</abbr>. Instalace probíha dvěmi cestami. K oběma dojde přirozenou cestou. Ve chvíli kdy chcete něco checkoutnou a nemáte nainstalovaný Subversion, NB se po něm začnou ptát. Nabídne vám dvě možnosti.

### 1) Nainstalovat bundle NB
Prostě se stáhne balík, který se nainstaluje a restartují se NB a po startu již máte k dispozici SVN v NB

### 2) Navést NB k binárce SVN.
Tuto možnost zvolte, pokud chcete SVN používat i mimo NB a máte již stažené <a title="Stránky pro downloadu SVN" href="http://subversion.tigris.org/" target="_blank">binárky SVN</a>. Vhodné pro konzolisty, kteří nevěří zbytečným GUI a složitější operace si radši udělají ručně v konzoli a ty jednodušší svěři rozhraní v NB

Jak tedy provedete onen první checkout? Tato akce se skrývá v nabídce Team=&gt;Subversion=&gt;Checkout. Checkout nám nabízí kromě jiného také možnost detekovat adresář s projektem NB. Nemusíme pak tedy nic nastavovat a NB a máte založený projekt. Druhou příjemnou věcí je, že v prvním kroku checkoutu nám stačí zadat jenom adresu repositáře. V druhém kroku pak můžeme vybrat přesnou větev k checkoutu přes repository browser.

Tak jsme tedy checkoutly a udělaly nějakou tu změnu a teď bychom rádi commitly změny. Ale co to? Byly jsme tak činí, že jsme udělaly práci obsaženou v osmi ticketech. Pokud chceme commitnout naší práci na vícekrát máme opět dvě možnosti. Při rozbalení kontextové nabídky projektu najdeme pod Subversion položku commit. Otevře se dialogové okno pro commit. Nabízí velké textové pole pro log message commitu a pod ním seznam souborů které commitujete. My jsme toho dnes udělaly až příliš, takže něco commitovat nebudeme. U každé změny můžeme buď nechat defaultně vybraný Add as test, Add as binary, nebo exclude commit, pokud nechceme daný soubor vůbec commitnou. My budeme commitovat po ticketech a v prvních dvouch commitech bude souborů, které nechceme commitnout většina. Proto provedeme commit druhou cestou. Z kontextové nabídky projektu si v SVN najdeme show changes. Po kliknutí se nám zobrazí ve spodní části NB seznam změn, které jsme udělaly. Zde vybereme soubory, které chceme commitnout a tuto akce pak nad výběrem proveme z kontextové nabídky. Otevře se nám již známé dialogové okno pro commit. Vídíme zde, že opravdu commitujeme soubory, které jsme vybraly.

Dále můžeme v kontextové nabídce projektu/adresare/souboru v SVN vytvořit novou větev - Copy to - udělá se commit do složky v repositáří zvolené v nabídnutém repo browseru. Také se můžeme do nějaké větve přepnout - Switch to copy - opět s repobrowserem. Třetí hlavní možností je merge - také s repo browserem
