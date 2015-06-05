---
layout: post
title:  Quartz Composer
categories:   [dev,vývojář,začátečník,vývoj,tool,Apple]
excerpt: |-
  V tomto postu popíšu co to Quartz Composer je a jak jsem v něm vytvořil něco co je mi k užitku.

---


## Co je Quartz Composer
Quartz Composer (QC) je nástroj pro tvorbu kompozicí/maker na úpravu vstupních dat. Tato tvorba je uživateli zpřístupněna bez nutnosti znalosti nějakého programovacího jazyka. Uživatel/vývojář pracuje se vstupy vizuálně.
QC je z dílen firmy Apple. Dříve byl součástí Xcode, později byl z Xcode vyčleněn jako samostatný nástroj. Nejedná se o součást systému a pokud ho chce člověk používat, tak je jej nutné stáhnout ze stránek Apple pro vývojáře. QC je součástí balíčku [Graphics Tools for Xcode](https://developer.apple.com/downloads/index.action?q=quartz).

### Jak to funguje
První okno QC co uživatel uvidí je Root Macro Patch. V něm je dílo které tvoříme. Může obsahova buďto Patche -- úpravy vstupu, nebo další Macro Patche -- zapouzdřené logické celky obsahující zase Patche a Macro Patche.
Patch si můžeme představit jako skříňku do které něco pošleme a ono nám to z ní vyleze upravené (taková "počapanější" mikrovlnka).
Seznam hotových patchů je k nalezení v Patch Library (PL; ikonka v toolbaru úplně vlevo).
Poslední okno, které často uvidíme je Viewer. Toto okno nám zobrazuje výstup z naší kompozice.

## Praktická ukázka
Napřel jsem část svých sil do kreslení a občas si dělám "time-lapse". Je to zrychlený video záznam z mého snažení. Když to takhle někomu ukáži, tak se mne nejdříve zeptá kolik je synkovi co to kreslil a pak následuje otázka "Jak dlouho si to dělal". Když už time-lapse existuje a když už jí někomu ukážu, tak takovou věc dávno nevím a jak dlouho jsem dělal nějaké dílčí věci, to už nevím vůbec. Proto jsem si udělal kompozici, která mi vepíše průběžný čas záznamu přímo do videa. Když pak video zrychlím tak je v něm vidět jak celkový čas na konci, tak průběžný čas v průběhu.

## Jak na to

### Import videa
Jako první budu potřebovat dostat video do QC. V PL je k tomu patch Movie importer (dole je vyhledávání). Parametry patche si zobrazíme jejich tlačítkem Parameters v toolbaru. Vidíme že má patch jeden vstup a to Movie Location. Je to normalní text, do kterého zadáme cestu k souboru. Pokud se vám nechce psát cestu k souboru videa, tak stačí video jenom přetáhnout z Finderu do QC a automaticky se přidá Movie importer se správnou cestou k souboru.
Když budeme chtít toto video použít, tak k tomu máme výstup (puntík vpravo) Image.

### Zobrazení videa, vstupy a výstupy
K zobrazení všeličehos slouží v Quartz Composeru patch Billboard. Ten je k dispozici opět v Patch Library. Když ho dostaneme do našeho Macro Patche tak vidíme, že Movie Importer má výstup (puntík vpravo) Image a Billboard zase má vstup (puntík vlevo) Image.
Jak je asi patrné, tak potřebujeme propojit výstup Movie Importeru a vstup Billboardu, abychom video zobrazili. Není to nijak složité, prostě přetáhneme výstup Movie Importeru na vstup Billboardu (obojí Image). Pokud se tak stalo, tak by mezi nimi měla zůstat žlutá čára a ve Vieweru by se mělo dané video přehrávat. Pokud tomu tak není, ale ohlá, žlutá čára mezi výstupem a vstupem je, tak je chybně cesta k souboru videa, nebo je video v nepodporovaném formátu.

### Zobrazení času videa
Jak je vidět u patche Movie Importer v našem Macro Patchi, tak má výstup Movie Position. Ten skutečně vrací aktuální, časovou pozici v jaké se ve videu nacházíme. Údaj je číslo -- počet sekund se setinami sekund.  K zobrazení si přidáme další slouží nám již známý Billboard. Ten má ale v tuhle chvíli užitečný vstup akorát Image. V Patch Library nám s tím pomůže patch jménem Image With String. Výstup Movie Position připojíme na vstup Image With String, který se jmenuje String.
Když teď zkusíme propojit výstup Image z Image With String s Image u Billboardu, tak zjístíme, že se nám přeruší předchozí vazba. Billboard skutečně příjímá pro Image pouze jeden vstup. Ono tak nějak všchno příjímá pouze jeden výstup pro vstup. Z Patch Library si tedy vezmeme další Billboard. Tomu už bez problémů přípojíme na vstup Image, výstup Image z Image With String.
Vpravo nahoře u používaného Billboardu je číslo s rozbalovací nabídkou. Každý Billboard je taková vrstva obrazu. Toto číslo určuje pořadí vrstev. Billboardy jsou zobrazovány vertikálně odspodu, takže Billboard s nejnižším číslem bude úplně vespod. Pokud bychom dali Billboardu s videem například číslo 2 a Billboardu s časem videa 1, tak nám video překryje náš časový údaj.
Pokud vše proběhlo dobře, tak by v okně Vieweru mělo být něco podobné tomuto obrázku.

![Video with seconds](https://files.app.net/7hw4vSf-j.png)

### Čitelnost
Z obrázku je patrné, že text takto nemusí být vždy dobře čitelný. V PL je patch Image with Shadow, který nám s tím pomůže.
Na vstup Image připojíme výstup Image z Image With String a výstup z Image With Shadow připojíme na Image vstup u Billboardu zobrazujícího aktuální časovou pozici ve videu. Image With Shadow má také vstup Shadow Info. Data pro tento vstup vycházejí ze stejnojmeného patche v PL. Když je propojíme, tak bude text mnohem čitelnější, protože bude mít text stín opačné barvy, než je barva textu.

![Time with shadow](https://files.app.net/7hmm2nPVW.png)

### Formátování času
V PL je Date Formatter, který udělá z našich sekund něco lépe čitelného. Na vstup připojíme Movie Position z Movie importeru a výstup Date formatteru připojíme na String u Image With String. Nyní už ve Vieweru nemáme pouze spousty sekund, ale naformátovaný časový údaj. Ten je včetně datumové části, což asi úplně neoceníme, pokud naše video nemá třeba týden. Některé vestavěné patche mají krom vstupu a výstupu viditelných v editoru, také nastavení.

![Patch Settings](https://files.app.net/7hm7wPLGa.png)

Dostaneme se k nim v Patch Inspectoru přes horní selectbox. V nastavení patche řekneme, že chceme Date Formatting Style jako Custom, což v tuto chvíli způsobí, že v časovém údaji zbyde jenom čas.

![Cropped date part](https://files.app.net/7hm7bbcfE.png)

Tím jsme dokončili úkol ze začátku postupu. a naše kompozice vypadá zhruba takto.

![Composition -- Final](https://files.app.net/7hmh9hCXV.png)

Většina lidí nejspíš bude mít spoje mezi vstupy a výstupy zvlněné. Já je mám rovné, protože mám nainstalované [Origami](http://facebook.github.io/origami/download/) od Facebooku. To je dobré na prototypování mobilních aplikací a také umožňuje vykreslovat výsledný obraz kompozice do mobilní aplikace na zařízení připojeném kabelem.

Pokud chcete text přesunout, nebo zmenšit, hrajte si v Patch Inspectoru se vstupy Billboardu zobrazujícího čas.

## Co je dobré vědět

### Jednotky
Kdekoliv kde se v QC řeší délka, výška, může být matoucí, že zde schází jednotka. Jedná se o souřadnice, nebo jednu hodnotu ze soustavy -1 -- +1. Více v [Quartz Composer User Guide -- The Coordinate System](https://developer.apple.com/library/mac/documentation/GraphicsImaging/Conceptual/QuartzComposerUserGuide/qc_concepts/qc_concepts.html#//apple_ref/doc/uid/TP40005381-CH212-DontLinkElementID_5)
Pokud bychom třeba chtěli, aby naše video bylo přes celou výstupní plochu, tak v Patch Inspectoru nastavíme Billboardu zobrazujícímu video Width na 2, což odpovídá celému rozsahu ( -1 -- +1 ). Height se automaticky dopočítá, jedná se o defaultní nastavení v Settings Billboardu, které je možné zmenit.

### Pořádek

#### Macro patche
Kliknutím na Create Macro ho vytvoříme a následným double klikem do obsahu ho můžeme začít plnit. Občas se ale člověk dostane do situace, kdy už toho má v Root patchi moc a chtěl by zapouzdřovat logické celky. To je možné označením Patchů, které chceme v novém logickém celku a následným kliknutím na Create Macro. Vytvoří se nám Macro patch obsahující dříve vybrané Patche.

#### Jména
Když přetáhneme patch z PL do editoru, tak je v titulku Patche jeho název. Ve chvíli, kdy máme například 5 Billboardů vedle sebe, je to trochu nepřehledné. Double klikem na titulek Patche v Editoru, ho můžeme pojmenovat podle svých představ.

![Billboard naming](https://files.app.net/7hm1fnJZn.png)

### Jak dostat výsledné video z QC
Dříve byly dvě možnosti. Přímo v QC je Export as QuickTime Movie. Také bylo možné kompozici otevřít v QuickTime Playeru Pro a exportovat jako video.
V současné chvíli pro mne nefunguje ani jedna možnost a proto používám nástroj [QtzRendang](https://code.google.com/p/qtzrendang/).

### Příklady
V PL je seznam Patchů a pod ním dokumentace právě vybraného Patche. Na konci této dokumentace je většinou odkaz na ukázkovou kompozici, kde je právě vybraný Patch použitý, aby člověk věděl jak se s ním pracuje v praxi.

### Apple neinovuje, je alternativa?
QC si získalo velkou oblibu a vznikly i skupiny, které se zabývaly jeho rozšiřováním o nové Patche. Jedním takovým webem bylo [kineme](http://kineme.net). Vzhledem k absenci inovací v QC ze strany Apple, vzniklo [Vuo](https://vuo.org). Jedná se o placený nástroj, se stejnou myšlenkou jako byla v QC, ale s aktivnějším vývojem. K dispozici je tedy například napojení na data z [Leap motion](https://www.leapmotion.com)

<iframe src="https://player.vimeo.com/video/114212032" width="500" height="313" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> <p><a href="https://vimeo.com/114212032">Vuo</a> from <a href="https://vimeo.com/vuo">Vuo</a> on <a href="https://vimeo.com">Vimeo</a>.</p>
