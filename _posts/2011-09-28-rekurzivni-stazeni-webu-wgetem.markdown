---
layout: post
title: Rekurzivní stažení webu wgetem
categories:   [client,server,tool,začátečník]
excerpt: |-
  V tomto postu píši o tom jak si stáhnout celý web pro offline prohlížení a to pomocí programu wget, který je dostupný pro spousty platforem.
  
---

Pro ty kdo pouze hledají onu sadu přepínačů, tak zde je příklad stažení tutoriálů ze stránek rastrového editoru Pixelmator.

    wget -r http://www.pixelmator.com/learn/ -k -c -X support/ -p -H \
     -Dpixelmator-tutorials.s3.amazonaws.com,www.pixelmator.com,tutorials.pixelmator.com

Tool wget je možné stáhnout ze stránek projektu http://... Teď se podíváme na všechny přepínače z uváděného příkazu.

`-r http://www.pixelmator.com/learn/` poví wgetu, že chceme stáhnout celý web, ale nemáme tak úplně vyhráno. Parametrem `-k` získáme po dokončení stahování, přepsání všech adres na lokální. Parametr `-c` je užitečný pokud například vypadne spojení a spouštíte příkaz znovu. Wget pak stahuje pouze soubory, či jejich části, které ještě stažené nemá. `-X <adresare>` vyjme vyjmenované ze stahovaných. `-p` stáhne vše co je potřeba pro správné zobrazení stranky -- styly, obrázky na pozadí, atp. Pokud jsou obrázky a ostatní stahované soubory na jiném serveru, tak je wget stáhne až po přidání přepínače -H. Při vyhodnocování, zda se jedná o stejný server se nekontroluje fyzický stroj, ale adresa. Takže www.pixelmator.com a tutorials.pixelmator.com jsou pro wget dva různé servery. S tímto přepínačem nám toho wget může stáhnout až zbytečně moc. Naštěstí můžeme vydefinovat z jakých serverů obsah stahovat. V našem příkladu je to `-Dpixelmator-tutorials.s3.amazonaws.com,www.pixelmator.com,tutorials.pixelmator.com`