--- 
name: svn-vy-vysoky-výt-vyvijime-spolecne
layout: post
title: "SVN - Vy, vysok\xC3\xBD, v\xC3\xBDt, vyv\xC3\xADj\xC3\xADme spole\xC4\x8Dn\xC4\x9B"
time: 2008-08-31 00:24:00 +02:00
topics: 
- vývoj
- vývojář
- subversion
- programování
- Síť
excerpt:  |-
  V tomto článku popisuji základní práci se <a href="http://en.wikipedia.org/wiki/Subversion_(software)">Subversion</a>(SVN) a programy pro hostování projektů na SVN. Neřeším teď jeho kvality, nebo vhodnost na něco. Prostě s ním pracuji, tak o něm píšu.
---
Pokud chcete začít svn používat pro soukromé vývíjení, tak nejsnažší cesta je zaregistrovat se na <a href="http://code.google.com/hosting/createProject">Google</a>, nebo <a title="Registrace na sf.net" href="http://sourceforge.net/account/registration/">Sourceforge</a>( nabízí i CVS ). Na obouch dvou musíte mít nejdříve učet a pak teprve založit projekt. Na sf.net sice trvá celkem dlouho, než projekt projde schvalovanim, ale zato pak máte více možností. Předesílám, že pokud člověk něco vyvíjí sám, tak pro něj tyto služby nemají až takový smysl a je lepší si <a title="Popis instalace Subversion" href="http://svnbook.red-bean.com/en/1.4/svn.intro.install.html">SVN</a>, či <a title="Popis instalace CVS" href="http://www.idevelopment.info/data/Programming/change_management/unix_cvs/PROGRAMMING_Installing_CVS.shtml">CVS</a> rozjet lokálně.

Při prvním nahrávání a při nahrávání zcela nových souborů užijete akci <a title="Detailní popis akce import" href="http://svnbook.red-bean.com/en/1.0/re12.html">import</a>.

    svn import -m "Komentar k importu" lokalni_adresar_se_zdrojaky/  \
    https://nazev_vaseho_projektu.svn.sourceforge.net/svnroot/nazev_vaseho_projektu \
    --username=vase_uzivatelske_jmeno

**svn** je binárka subversion, **import** je akce, kterou zrovna provádíte, **-m** "cosi" je komentář k právě prováděné akci( uvdíte později ), **lokalni_adresar_se_zdrojaky/** je lokání umístění importovaných souborů a za ním následuje adresa vašeho repozitáře SVN. Posledním parametrem je **--username** jak je z něj patrné označuje vaše uživatelské jméno pro repozitář nad kterým právě provádíte akci.

SVN má dále tři nejvíce používané akce:

### checkout

Vytvoří lokální kopii souborů z repozitáře &ndash; pracovni kopie.

    svn co \
    https://nazev_vaseho_projektu.svn.sourceforge.net/svnroot/nazev_vaseho_projektu

To znamená, že soubory stáhne do lokálního adresáře a vytvoří k nim informační soubory, které obsahují data o verzi lokálního souboru a adrese repozitáře ze kterého pochazí. Místo <strong>co</strong> můžete také použít <strong>checkout</strong>, ale kdo by psal to delší, když nemusí, že:)

### commit
Slouží pro nahrávání změn v repozitáři existujících souborů

    svn commit -m "Popis toho co jste se soubory udelali"

Možná vám přijde trochu divné, pročpak to má tak málo parametrů. Tento příkaz se spoušti v kořenovem adresáři vašich vyvíjených souborů, takže data o repozitáři a verzích jsou načitána z adresářové struktury aktuálního adresáře, takže je nemusíte( možná ani nemůžete ) zadávat.

### update
Slouží pro aktualizaci lokální kopie.

    svn update

Mezi tím co jste pracovali možná pracoval na souborech i někdo jiný v týmu, takže je dobré si čas od času lokální kopii aktualizovat. Opět zde platí, že data o repozitáři a verzích nezadáváte, protože jsou obsažena v adresářové struktuře vašich souborů.

Výše jsem popsal konzolové příkazy. Pokud se jim chcete vyhnout, tak celkem ušle pracuje s SVN <a title="Netbens ke stažení" href="http://www.netbeans.org/downloads/">Netbeans</a> a <a title="jEdit ke stažení" href="http://www.jedit.org/index.php?page=download">jEdit</a>. Práci s SVN v Netbeans a jEditu se nejspíše budu věnovat v nějkém z pozdějších postů. Pokud by vám zde nějaká informace chyběla, neváhejte napsat mi mail, nebo do příspevků.
