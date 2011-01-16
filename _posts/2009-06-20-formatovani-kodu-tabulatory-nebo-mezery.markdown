--- 
name: formatovani-kodu-tabulatory-nebo-mezery
layout: post
title: "Formátování kódu - tabulátory nebo mezery"
date: 2009-06-20 20:30:00 +02:00
tags: 
- !binary |
  U8OtxaU=

- !binary |
  dsO9dm9qw6HFmQ==

- kolaborace
- !binary |
  dsO9dm9q
excerpt:  |-
  Tento post pojednává o nekonečném tématu – odsazování zdrojového kódu při psaní. Psát kód jenom podle  svého přesvědčení mi přijde naprosto zcestné a proto jsem si vzal na pomoc ten Internet, když vo ňom všichni tak básněj. Post je tedy spíše souhrnem informací a názorů, které jsem našel, občasně doplněný názory mými.


---
### Pojmy

Klávesa Tab píše buďto znak tabulátoru, nebo v editoru nastavený počet mezer. Nastavení, kdy Tab napíše znak tabulátoru nazýváme hard tab, pokud napíše nastavený počet mezer, je to softtab, nebo také emulovaný tab. Tabulátory a mezery nám slouží k odsazení, či zarovnání, dle užití. Tabulátor a mezera patří do skupiny bílých znaků. Odsazením se rozumí vzdálenost prvního "černého" znaku" z leva( u normálního našince ). Zarovnání pak slouží k zarovnání například parametrů funkce, operátorů, atp, pod sebe.  Tyto pojmy nejsou exaktní fakta. Pouze dávám přiblížení pojmů v následujícím textu. Na černém znaku si samozřejmě trvám;)

### Hardtab

Pro použití hardtabu hovoří to, že si každý může nastavit nakolik bude mít text odsazený. Je vkládán pouze znak tabulátoru a jeho interpretace zavisí na editoru - je to interpretovaný znak. To je výhoda i nevýhoda. Výhodou je, že si každý nastaví zobrazení tabulátoru, tak jak mu to vyhovuje. Nevýhodou je, že můžete narazit na editor, který tabulátory nerespektuje, nebo je jen suše zobrazí jako znaky tabulátoru. Další nevýhodou je, že váš kód může potkat nehoda, při které o tabulátory nějakým způsobem příjdete, popřípadě se z nich stanou jiné, jistě velice zajímavé znaky. Mě se to snad ještě nikdy nestalo, ale podle účastníků různých fór jde o vcelku běžný jev.

### Softtab

Softtab - vkládání mezer na místo tabů, je snad nejoblíbenějším způsobem vzdalování kódu od okraje. Jeho zastánci hovoří hlavně o tom, že mezerám se nemůže nic stát. Ať jsem v jakémkoliv editovacím nástroji odsazení je vždy stejné. To je také výhoda i nevýhoda. Nebožák, který ma nevšímavé oko, potřebuje odsazení vetší a už je tu problém. Jenom pro zajímavost, při procházení dokumentačních materiálů k frameworku Symfony jsem narazil na hlášku, že se ve frameworku nepoužívají tabulátory, protože to prostě v editoru <a href="http://fabien.potencier.org/">Fabiena Potenciera</a> vypadá ošklivě.

### Zombietab

Existují i tací, kteří ani nevědí co píší. Jejich Editor prostě odsadí a je jim jedno jak. To je varianta, která by měla být vymícena, nicméně je celkem běžná.

### Závěrem

Co říci závěrem. Jak Softtab, tak Hardtab mají svoje výhody. K přecházení na jinou variantu než je ta, kterou právě používáte je pracné a měl by k němu být dobrý důvod. Samozřejmě pokud používáte Zombietab, tak přejděte okamžíte na kterýkoliv ze dvou výše zmíněných. Celkem zajímavou variantou, kterou jsem na internetu potkal je skloubení Soft a Hard tabu. V této variantě se užívá buďto Hardtabu pro odsazení bloku kódu a Softtab pro zarovnání v rámci bloku a nebo Hardtab pro odsazení veškerého kódu a Softtab pro zarovnání například parametrů ruzných volání fcí pod sebe. Důležitou roli při volbě stylu psaní kódu hraje postoj píšícího k cizímu kódu a editorům. Pokud používá cízí kód, například hotové knihovny, měl by píšící zvolit styl psaní, jaký je běžný v těchto  cizích kódech, jinak narazí na kompatibilitu těchto dvou skupin kódů. Tedy je lepší dodržovat rozšířenou konvenci pro prostředí ve kterém se píšící pohybuje. V odkazech níže si můžete prohlédnou popisy konvencí pro některá prostředí. Druhá věc je, že některé editory, či jiné nástroje mohou chybně interpretovat řídící znaky( tedy i tabulátory ). Ať se přidáte k jakékoliv vývojové skupině, bude chtít aby jste používaly její styl psaní kódu, kvůli verzovacím systémům, kompatibilitě s ostatními vývojáří a tak podobně. Tato skupina má jistě své důvody, pro užití toho, či onoho stylu psání kódu a vy by jste se měly přisbůsobit, nebo jim jejich názor rozumnými argumenty vyvrátit. Pro své kódy samozřejmě užijte co uznáte za vhodné vy.

#### Jak to vidím já

Zastávám názor, že je zbytečné znovu vymýšlet kolo a že neexistuje vhodné řešení, ale vhodné řešení pro určitou problematiku. To mě vede k tomu, že když vidím pěknou knihovnu, tak ji použiji a když mi na něco vyhovuje nějaký editor, tak ho na to používám. Primárně píši webové aplikace v php a snad zatím v každém takovém kódu jsem viděl užití mezer( <a href="http://phpmailer.svn.sourceforge.net/viewvc/phpmailer/">phpMailer</a>, <a href="http://dotproject.svn.sourceforge.net/viewvc/dotproject/">dotProject</a>, <a href="http://www.mantisbt.org/bugs/plugin.php?page=Source/list&amp;id=7">Mantis</a> ) pro veškeré vzdalování textu. Ve svých kódech užívám mezer a nikdy jsem neměl problém. Mezery jsou téměř nezničitelné okolními vlivy a budou to vzdycky mezery a ne to pro co se rozhodne editor. Toto mé rozhodnutí mám podpořené konvencemi psaní kódu pro různé jazyky a systémy( viz níže ). Zarovnávání parametrů volání různých fcí používám jed zřidka kdy a když chci zarovnat parametry volání jedné fce( například, když jich má mnoho, nebo jsou dlouhé ) užívám tabulátor, tedy opět mezery.

Tato sekce postu by neměla sloužit jako vyznění tohoto článku. Je to pouze příklad jak to dělá jeden člověk a jaké k tomu má důvody.

### Odkazy

Tento post je zajímavým doplněním k následujícím odkazům.

- [Odsazování](http://php.vrana.cz/odsazovani.php) - Vránovo pozastavení obecně nad psaním kódu
- [Coding Standards](http://pear.php.net/manual/en/standards.php) - Standardy psaní kódu pro <abbr title="PHP Extension and Application Repository">PEAR</abbr>
- [Linux kernel coding style](http://www.kernel.org/doc/Documentation/CodingStyle) - Dokumentace ke psaní kódu pro linuxové jádro
- [Style Guide for Python Code](http://www.python.org/dev/peps/pep-0008/) - Dokumentace k psaní kódu v jazyce Python. U jazyka Python a jemu podobných je otázka odsazování velice důležité, jelikož zde má funkční význam. Je zde totiž použito pro vytváření sub-bloků. Například těl podmínek, metod, tříd a tak podobně
- [YAML](http://www.yaml.org/spec/current.html#id2519916) - Část specifikace toho serializačního jazyka pojednávající o odsazování

