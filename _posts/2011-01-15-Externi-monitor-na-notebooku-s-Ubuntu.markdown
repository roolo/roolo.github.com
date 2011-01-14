---
layout: post
title: Externí monitor na notebooku s Ubuntu
topics:   [dualhead, linux, multihead, pokročilý, Systém, twinview, ubuntu]
excerpt: |-
  V tomto postu popíši jak na notebooku s Ubuntu 10.10 nastavit fungování s externím zobrazovacím zařízením( ve většině případů se bude jednat o monitor/display ). Koho nezajímá omáčka a chce rovnou soubor xorg.conf tak je k dispozici na adrese&nbsp;<a href="https://gist.github.com/gists/777004/download">https://gist.github.com/gists/777004/download</a>,&nbsp;k prohlédnutí pak na adrese&nbsp;<a href="https://gist.github.com/777004">https://gist.github.com/777004</a>. Na odkazech jsou dva soubory. Původní soubor, který jsem měl na začátku( xorg.conf-default ) a soubor xorg.conf, který vznikl postupným nastavováním. V tomto postu se budu zabývat tím jaký má rozdíl mezi těmito soubory význam. Pro úplnost je přiložen i poslední log nastavovaného X serveru - Xorg.0.log.

---
### Relevantní konfigurace

* **Notebook:** NB ASUS M50VC-AS001C 15.4C T8400 DVDRW 320G 4G W B FP VHP
* **Systém:** Ubuntu&nbsp;10.10&nbsp;Maverick&nbsp;Meerkat( `Linux kazimir 2.6.35-24-generic-pae #42-Ubuntu SMP Thu Dec 2 03:21:31 UTC 2010 i686 GNU/Linux` )
* **Grafická karta:**&nbsp;NVIDIA GeForce 9300M G (&nbsp;DSUB/VGA&nbsp;)
* **Externí monitor:**&nbsp;BENQ FP91G+ ( DVI + DSUB/VGA )
* **Manažer desktopu:**&nbsp;GDM 2.30.5
* **X server:**&nbsp;xorg-server 2:1.9.0-0ubuntu7.1


### Schéma nastavení

Celé nastavení se odehrává v souboru&nbsp;/etc/X11/xorg.conf. Schéma nastavení v tomto souboru je zhruba následující. Jednotlivé komponenty nastavení jsou každá ve své sekci( `Section` ). Celé složení toho co vídíme po spuštění grafického systému se nachází v sekci `ServerLayout`.

V ServerLayout je popsáno z čeho se to co vidíme skládá a název tohoto rozložení. To znamená například z jakých se skládá obrazovek a jak jsou vůči sobě rozestavěné ve fyzickém světě.&nbsp;</div>

V sekci ServerLayout se již odkazuje na názvy obrazovek ze sekce `Screen`. Těchto sekcí může být v souboru více, pokud X server běží na více obrazovkách. Sekce Screen obsahuje nastavení jedné obrazovky. Nastavuje se zde barevná hloubka obrazovky, z jakého zařízení jde na obrazovku obraz, atp.

Zařízení ze kterého jde obraz na obrazovku je definováno v sekci `Device`. Tato sekce obsahuje informace vetšinou o grafické kartě, používaném ovladači pro tuto kartu a jak by se měl ovladač chovat.

Než se vrhneme do změn v souboru xorg.conf, tak uvedu dvě věci.
0. Před jakýmikoliv změnami si je dobré si udělat kopii tohoto souboru, aby bylo k čemu se vracet, při špatném nastaveni X serveru
0. do konfigurace toho pište co nejméně. Jak je vidět z mého logu, tak X server si toho dost nadetekuje sám

### Nastavení více obrazovek

Na to aby X server vykresloval na dvě obrazovky je potřeba definovat mu dva zdroje obrazu( sekce Device ). U mého notebooku se jedná o jednu grafickou kartu, takže obě dvě sekce instruují k použití stejného ovladače a to `nvidia`. Aby bylo možné se později odkazovat na každou zvlášť, má každý výtup mé karty jiný identifikátor( volba Identifier ). Další čím se tato dvě zařízení liší je volba Screen. Zabudovaný display notebooku má tuto volbu nastavenu na 0( první zařízení ) a VGA výstup má volbu nastavenu na 1( druhé zařízení ).

    Section "Device"
        Identifier	"Default Device"
        Driver	"nvidia"
        Option	"NoLogo"	"True"
        Screen	0
    EndSection

    Section "Device"
	    Identifier	"External screen device"
	    Driver	"nvidia"

	    Screen 1
    EndSection

Další věc kterou musíme udělat je vytvořit pro každý display/monitor sekci Screen. Většinu voleb mám u displaye zabudovaného v NTB. Je zde opět identifikátor a dále barevná hloubka obrazovky. Volba `"TwinView" "1"` znamená, že poběží jeden X server a plocha jeho obrazu bude vykreslována na všech obrazovkách. V případě že by tato volba byla nahrazena za `"Xinerama" "1"`, běžel by na každé obrazovce samostatný X server. Volba Device říká z jakého zařízení na tuto obrazovku přichází obraz. Použivá se zde název definovaný v sekci Device volbou `Identifier`.

    Section "Screen"
	    Identifier	"Default Screen"
	    DefaultDepth	24

	    Option "TwinView" "1"

	    Device	"Default Device"
    EndSection

    Section "Screen"
	    Identifier	"External Screen"
	    DefaultDepth	24

	    Device "External screen device"
    EndSection

Restartovaní X serveru v tuto chvíli by mělo vést k jeho spuštění přes dvě obrazovky. Později si ukážeme jak mezi těmito režimi přecházet bez restartovaní.
