---
layout: post
title: Externí monitor na notebooku s Ubuntu
topics:   [dualhead, linux, multihead, pokročilý, Systém, twinview, ubuntu]
time:  2011-01-16 19:06:24 +01:00
excerpt: |-
  V tomto postu popíši jak na notebooku s Ubuntu 10.10 nastavit fungování s externím zobrazovacím zařízením( ve většině případů se bude jednat o monitor/display ). Koho nezajímá omáčka a chce rovnou soubor xorg.conf tak je k dispozici na adrese&nbsp;<a href="https://gist.github.com/gists/777004/download">https://gist.github.com/gists/777004/download</a>,&nbsp;k prohlédnutí pak na adrese&nbsp;<a href="https://gist.github.com/777004">https://gist.github.com/777004</a>. Na odkazech jsou dva soubory. Původní soubor, který jsem měl na začátku( xorg.conf-default ) a soubor xorg.conf, který vznikl postupným nastavováním. V tomto postu se budu zabývat tím jaký má rozdíl mezi těmito soubory význam. Pro úplnost je přiložen i poslední log nastavovaného X serveru &ndash; <a href="https://gist.github.com/777004#file_xorg.0.log">Xorg.0.log</a>.

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

V ServerLayout je popsáno z čeho se to co vidíme skládá a název tohoto rozložení. To znamená například z jakých se skládá obrazovek a jak jsou vůči sobě rozestavěné ve fyzickém světě.

V sekci ServerLayout se již odkazuje na názvy obrazovek ze sekce `Screen`. Těchto sekcí může být v souboru více, pokud X server běží na více obrazovkách. Sekce Screen obsahuje nastavení jedné obrazovky. Nastavuje se zde barevná hloubka obrazovky, z jakého zařízení jde na obrazovku obraz, atp.

Zařízení ze kterého jde obraz na obrazovku je definováno v sekci `Device`. Tato sekce obsahuje informace vetšinou o grafické kartě, používaném ovladači pro tuto kartu a jak by se měl ovladač chovat.

Než se vrhneme do změn v souboru xorg.conf, tak uvedu dvě věci.
0. Před jakýmikoliv změnami si je dobré si udělat kopii tohoto souboru, aby bylo k čemu se vracet, při špatném nastavení X serveru
0. Do konfigurace toho pište co nejméně. Jak je vidět z <a href="https://gist.github.com/777004#file_xorg.0.log">mého logu</a>, tak X server si toho dost nadetekuje sám

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

Další věc kterou musíme udělat je vytvořit pro každou obrazovku, sekci Screen. Většinu voleb mám u displaye zabudovaného v NTB. Je zde opět identifikátor a dále barevná hloubka obrazovky. Volba `"TwinView" "1"` znamená, že poběží jeden X server a plocha jeho obrazu bude vykreslována na všech obrazovkách. V případě že by tato volba byla nahrazena za `"Xinerama" "1"`, běžel by na každé obrazovce samostatný X server. Volba Device říká z jakého zařízení na tuto obrazovku přichází obraz. Použivá se zde název definovaný v sekci Device volbou `Identifier`.

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

Restartovaní X serveru v tuto chvíli by mělo vést k jeho spuštění přes dvě obrazovky. Později si ukážeme jak mezi těmito režimi přecházet bez restartovaní. Nemusíme se bát spuštění X pokud nebudeme mít připojen externí monitor. X budou vykreslovat na dva monitory, pouze pokud budou oba připojené při startu. To znamená, že pokud externí obrazovku nepřipojíme před startem, tak s ním nebude pracovat ani X server.

### Přepínání více-monitorovosti

Pokud si nyní budeme chtít odnést notebook někam kde již náše externí obrazovka nebude připojena, tak bychom ho museli "Disablovat" přes `nvidia-settings`. Nastavení X serveru nám však umožňuje nastavit si takzvané `metamodes`. Jedná se o předvolby nastavení obrazovek. V mém případě jsem si nastavil metamodes nasludujícně.

    Option "metamodes" 
        "CRT: nvidia-auto-select +0+0, 
         DFP: nvidia-auto-select +1024+0; 
         
         CRT: null, 
         DFP: nvidia-auto-select +0+0"

(Já jsem příklad zalomil do více řádků kvůli prostoru, ale toto nastavení by samozřejmě mělo být tak jak je to v souborech odkazovaných v hlavičce)

Je zde schéma

0.  Externí monitor( CRT ) je úplně vlevo a interní display( DFP ) je o 1024 pixelů dále. Obě obrazovky mají rozlišení automaticky detekované ovladačem. Toto schéma předpokládá, že má externí monitor rozlišení 1024xneco
0.  Externí monitor( CRT ) je nepoužívaný( null ) a interní display( DFP ) je úplně vlevo. Interní display má rozlišení automaticky detekované ovladačem.

Mezi těmito schématy mohu přepínat programem `randr` a to konkrétně příkazem `xrandr -s 0` a `xrandr -s 1`. 0 pro první schéma a 1 pro druhé schéma. Pokud budeme mít schémat více, tak se bude číslo u parametru `-s` s každým takovým schématem zvedat o jednu;)

### Pořadí zobrazujících zařízení

Z počátku používání více monitorů na NTB mě trápilo umístění lišt o oken po přepnutí do více obrazovkového režimu. Zkrátka a dobře jsem měl okna a lišty na externím monitoru. To se dalo řešit vypnutím a zapnutím vestavěného displaye NTB, ale samozřejmě jsem to bral jako workarround. Toto chování se dá ovlivnit volbou `TwinViewXineramaInfoOrder` v konfiguraci X serveru. Tato volba určuje pořadí v jakém jsou monitory/displaye označeny. Taková volba vypadá zhruba takto:

    Option         "TwinViewXineramaInfoOrder" "DFP-0, CRT-0"

`DFP-0` je prvním zobrazovacím zařízením a `CRT-0` je druhým. Ve většině případů by mělo fungovat toto nastavení. Je samozřejmě možné, že se názvy zařízení budou lišit pokud se zobrazuje přes TV out, či jiný out;). Já jsem zjistil svá zařizení z [logu X serveru](https://gist.github.com/777004#LC149 "Odkaz na řádek v mém logu").

### Závěrem

Jsem rád, že jsem se konečně dostal k tomu si toto nastavit. Když doma zapnu počítač, tak jedu automaticky i na externím monitoru, když externí monitor nepotřebuji, tak si ho klávesovou zkratkou vypnu. Jediné co mě zklamalo je, že toto nastavení mi již tak dobřé neslouží, pokud si například v práci připojím projektor. 
