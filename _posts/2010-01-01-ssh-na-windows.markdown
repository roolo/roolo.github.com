--- 
name: ssh-na-windows
layout: post
title: SSH na Windows
date: 2010-01-01 00:59:00 +01:00
categories: 
- server
- pokročilý
- Síť
- Systém
- Služby
- komunikace
excerpt:  |-
  V tomto silvestrovskem postu( posledni v roce 2009 ) popíšu rozjetí ssh na windows s autentizaci přes klíče.

---

### K čemu je to dobré

Tento postup vám zpřístupní příkazovou řádku vašeho systému a to odkukoliv kde máte s sebou svůj klíč (viz. níže). Také slouží jako cesta pro <abbr title="Distributed Version Controll System">DVCS</abbr>, ale o tom až jindy


### Jak to funguje

Na počítači vám běží program, který zpřístupňuje vaši příkazovou řádku přes ssh protokol. Vy se akorát musíte přihlásit předem stanoveným způsobem.


### Co budeme potřebovat

-  systém s windows
-  freeSSHd - <a href="http://www.freesshd.com/freeSSHd.exe">http://www.freesshd.com/freeSSHd.exe</a>
-  PuTTY - <a href="http://the.earth.li/~sgtatham/putty/latest/x86/putty-0.60-installer.exe">http://the.earth.li/~sgtatham/putty/latest/x86/putty-0.60-installer.exe</a>, nebo si <a href="http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html">vyberte</a>

### freeSSHd

Během instalace nejsou žádné záludnosti, takže popíši jen jeho nastavení. Snad jen doporučím, že jestli se jedná o osobní počítač, tak neinstalujte jako freeSSHd jako službu.

Po spuštění je běžící instance reprezentována systray ikonou (nabídka pravým tlačítkem). Pro nás nejduležitější karty nastavení jsou Autentication a Users. V autentication si nastavíme kde budeme skladovat veřejné klíče a zda je budeme používat. Soubor veřejného klíče by se měl jmenovat stejně jako uživatel ke kterému klíč přísluší. V users pak vytvoříme uživatele, který se bude přihlašovat. Pokud chceme používat autentizaci přes klíče (a to my v tomto postu chceme;) ) nastavíme při vytváření uživatele Authorization na Public key... Pozor při ukládání voleb. V hlavním okně nestačí dat pouze Apply, ale musíme dat Ok, protože až tehdy si ssh server opravdu načte naše nové volby.

### PuTTY

PuTTY je sada nástrojů pro práci se spojeními přes SSH atp. My z této sady použijeme PuTTYgen, PuTTY a Pageant.

#### PuTTYgen

Jedná se o nástroj pro práci s klíči. My ho použijeme pro vygenerování svých klíčů určených na autentizaci SSH serveru.

Tlačítkem Generate v Actions dáme klíč generovat. Jako pseudo náhodná data pro generování klíče vyžívá PuTTYgen pohyb myši. Takže jakmile dáte generovat, tak můžete jít zkouknout Novinky a po nějaké té chvíli hýbání myší máte klíč vygenerován. Doporučuji nastavit si i passphrase, což je takové heslo na které budete vždy při pokusu o použití privátního klíče požádání.V horní části je vypsán veřejný klič. Ten vložte do souboru v adresáří, který je nastaven v freeSSHd jako skladiště veřejných klíčů. Jenom ještě jednou zopakuji, že soubor by se měl jmenovat stejně jako uživatelské jméno pro které je určen. Ve spodní části Actions si poukládejte zbylé klíče.

#### PuTTY

Nyní si otestujeme naše spojení. Do pole hostname dáme localhost ( počítač na kterém právě děláte ) a klikneme na open. Otevře se nám okno se session a po chvilce výzva na zadání uživatelského jména. Ale co to?! Ona se potom zobrazí i výzva k zadání hesla. Vždyť jsme zvolily autentizaci přes klíče

#### Pageant

Tento hodný prográmek se nám stará o klíče a hesla k nim. Námi vygenerovaný klíč mu dáme z kontextové nabídky systray ikony přes položku Add. Objeví se dialogové okno pro nalezení klíče. Jedná se o ppk klíč, tedy soukromý. Po jeho přidání ještě budeme požádáni o heslo ke klíči pokud jsme ho zvolili. Pokud vše proběhlo tak jak má, tak by jste se nyní měli přes putty přihlásit pouze uživatelským jménem a zbytek udělá Pageant.

### TIP

Pokud jste zvyklí vzdaleně pracovat s Linuxovým/Unixovým systémem, tak doporučuji nainstalovat si ještě <a href="http://gnuwin32.sourceforge.net/">GnuWin32</a>. Jedná se o sadu prográmků, které se běžně v těchto prostředích vyskytují, zkompilovaných pro běh ve windows.
