---
layout: post
title:  Yahoo Pipes
categories:   [dev,vývojář,pokročilý,vývoj,webové služby,tool]
excerpt: |-
  V pomto postu popíšu jak si přes Yahoo Pipes (YP) vyrobit vlastni RSS/JSON feed.

---

## Roury
[YP](http://pipes.yahoo.com) je webový nástroj na práci se strankami a vstupy od uživatele. (@todo přepsat aby dávalo smysl ;) ). Jedná se o takové spojení [IFTTT](https://ifttt.com), a [Quartz Composer](https://www.google.cz/search?q=quartzcomposer&safe=off&client=safari&rls=en&source=lnms&tbm=isch&sa=X&ei=1kGcU8DxAbKu7AaN24CAAQ&ved=0CAkQ_AUoAg&biw=1280&bih=683). Prostě tomuto webovému toolu naházíte vstupy od uživatele či z webu a YP je prožene naklikanými moduly s nějakými nastaveními.

K používání tohoto nástroje potřebujete [účet na Yahoo](https://edit.yahoo.com/registration).

## Tvoříme
[Při vytváření začínáme s téměř čistým plátnem](https://pipes.yahoo.com/pipes/pipe.edit), které pak plníme moduly na zpracování našeho vstupního obsahu. Jakmile nějaký modul přetáhneme z levého panelu (seznam dostupných modulů) do plátna, tak se nám automaticky spulu s ním zobrazí blok Pipe Output.
Na plátně mají moduly (krom prvního a posledního) nahoře a dole takové kuličky. Jejich tažením moduly propojujete. Nahoře je vstup modulu a dole výstup.

![Obrázek mojí Pipy](https://files.app.net/2q9jvzd9e.png)

## Promítané filmy
Já jsem si jako ukázku vytvořil feed promítaných filmů, grabovaný z [ČSFD](http://www.csfd.cz/kino/program/).
Použil jsem následující moduly

### Sources/XPath Fetch Page
URL jsem předhodil již odkazovaných program -- 'http://www.csfd.cz/kino/program/', tuto adresu bude naše Pipe stahovat a hledat v ní. Jako XPath výraz jsem dal '//div[@class="content"]/table/tr/th/a', ta nám vrátí všechny odkazy v hlavičkách, řádků, tabulek, které jsou v divech s třídou content. V jazyce stránky programu filmů na ČSFD jsou to nazvy filmů ;) Tento modul nám tedy vrátí seznam názvů filmů, který my si ale ještě trochu vyšperkujeme

### Operators/Unique
Modul se nám postará o to, aby se nám Filmy ve výsledném seznamu neopakovaly. Každé položce v seznamu se kterou tento modul pracuje říká *item* a my chceme filtrovat podle obsahu elementu odkazu z předchozího modulu. Náš výraz tedy bude *item.content*. Modul Unique projde všechny položky ze seznamu. Ty které mají hodnotu *item.content* jako položka již obsažena v nově vytvářeném seznamu, v novém seznamu prostě nebudou

### Operators/Sort
Tento modul se nám postará o seřazení položek. V této základní verzi nepracuji s časy, takže řadím dle mého oblíbeného názvu filmu ;) -- *item.content* in *ascending* order.

### Operators/Create RSS
Nakonec si z našeho snažení necháme vytvořit feed, který pak můžeme používat v jiných nástrojích. Jediné mnou použíté nastavení je zde *Title* a jeho hodnotaáááá (virbl) je *item.content*

## Debug
Jak postupně moduly přibývají, je možné a velice vhodné sledovat jak se nám mění výstup celé Pipy napojením výstupu posledního modulu na vstup modulu *Create RSS*. Ve spodním panelu pak kliknem na Refresh a vydíme ten skvost co nám po zpracování vzniká ;)

# Užití
Výsledná data si můžete nechat vypsat přímo v YP, či v ruzných dasboardovacích službách, nebo zajímavější varianta... rovnou si je stáhovat jako data. K dispozici je RSS/XML,  JSON a aspoň pro mě trochu bizarní -- serializované asociativní pole. Já jsem zvolil XML a právě promítané filmy si teď můžu přehledně zobrazit na iPadu v [Panic Statusboardu](https://panic.com/statusboard/).

![Obrázek Statusboardu](https://files.app.net/2q97rE251.png)
