---
layout: post
title: Git - Kdiff3 na MOX Lion
categories:   [git, vcs, dev, začátečník, tool]
excerpt: |-
  V tomto postu píši o tom jak si na MacOS X Lion nastavit mergovací nástroj Kdiff3 jako mergtool pro verzovací systém Git
  
---

### O co jde?

Při práci více lidí na jednom repositáři se celkem běžně stane, že dojde k takzvanému merge konfliktu. Jedná se o stav, kdy již originál našich změn neexistuje, tedy že nás někdo se změnami na daném místě "předběhl". Ve verzovacím systému Git k tomu dochází například při použití při příkazu [merge](http://schacon.github.com/git/git-merge.html), či [pull](http://schacon.github.com/git/git-pull.html). Výsledný konflikt se řeší buďto ručně v textovém editoru, nebo pomocí příkazu [mergetool](http://schacon.github.com/git/git-mergetool.html). Tento post popisuje jak zařídit, aby příkaz `git mergetool` použil nástroj [Kdiff3](http://kdiff3.sourceforge.net/). Tento postup byl již na internetu mnohokráte popsán, ale přijde mi že všechny mnou nalezené návody jsou až zbytečně složité. Kdyby to nebylo tak úplně jasné, tak celá konfigurace probíhá v terminálu.

### Příprava

- Ze stránek [Kdiff3](http://kdiff3.sourceforge.net/) si [stáhneme aplikaci pro Mac](http://sourceforge.net/projects/kdiff3/files/latest/download). Mělo by se jednat o klasickou Mac aplikaci (adresář s příponou app).
- Zjistíme si které adresáře máme v path -- `echo $PATH`
- Naklonujeme si repozitář pro testování merge konfliktu -- `git clone git://github.com/roolo/merge-with-conflict.git`

### Nastavujeme Git

V adresáři testovacího projektu spustíme mergování větve, obsahující konfliktní změny.

    $ git merge origin/side-changes
    Auto-merging TextFile
    CONFLICT (content): Merge conflict in TextFile
    Automatic merge failed; fix conflicts and then commit the result.

Vyvolaná zpráva by se měla dost podobat té mé, pokud nebude úplně stejná. Říká nám, že se Gitu nepodařilo změny sloučit automaticky a je potřeba interakce uživatel (to je v tomto případě dobře;)). Máme tedy náš testovací merge konflikt. Zkusíme teď tento konflikt vyřešit příkazem `mergetool`.

    $ git mergetool
    merge tool candidates: opendiff kdiff3 tkdiff xxdiff meld tortoisemerge gvimdiff diffuse ecmerge p4merge araxis bc3 emerge vimdiff
    Merging:
    TextFile

    Normal merge conflict for 'TextFile':
      {local}: modified file
      {remote}: modified file
    Hit return to start merge resolution tool (opendiff):

Git nám teď říká, že budeme řešit mergovací konflikt, ale že neví jaký nástroj použít a nabízí nám příkaz opendiff. Příkaz opendiff na MacOS X otevře diffovací nástroj zvolený prostředím Xcode. V defaultu se jedná o aplikaci FileMerge. Hned v prvním řádku výpisu můžeme vidět co jiného se dá na vyřešení našeho mergovacího konfliktu použít. Mezi jiným zde vidíme i kdiff3. Nastavíme tedy kdiff3 jako mergovací nástroj a zkusíme to znovu.

    $ git config --global merge.tool kdiff3
    $ git mergetool
    Merging:
    TextFile

    Normal merge conflict for 'TextFile':
      {local}: modified file
      {remote}: modified file
    Hit return to start merge resolution tool (kdiff3): 
    The merge tool kdiff3 is not available as 'kdiff3'

V tomto případě již Git ví, že má použít kdiff3, ale nemůže ho najít. V tuto chvíli vstupuje do hry aplikace stažená v sekci příprava. Nakopírujeme tuto aplikaci (kdiff3) do složky `/Applications`. V tuto chvíli je již kdiff3 mezi ostatními aplikacemi, kam patří a po chvíli by se i mohl zobrazit v Launchpadu. Bohužel to Gitu stačit nebude. Ten hledá spustitelný soubor obsažený v adresáři vyjmenovaném v proměnné PATH. Přejdeme tedy v terminálu do některého z dříve zjištěných adresářů a vytvoříme zde link na spustitelný **soubor** kdiffu. Ideálně by se mělo jednat o cestu končící `/bin`. V mém případě volba padla na adresář `/opt/local/bin/`. Poté zkusíme zase spustit `mergetool`.

    $ cd /opt/local/bin
	$ sudo ln /Applications/kdiff3.app/Contents/MacOS/kdiff3
    Password:
    $ git mergetool 
    Merging:
    TextFile

    Normal merge conflict for 'TextFile':
      {local}: modified file
      {remote}: modified file
    Hit return to start merge resolution tool (kdiff3): 

V tuto chvíli jsme na konci naší cesty. Git ví, že na vyřešení merge konfliktu chceme použít nástroj kdiff3, spustí ho a ten už na nás cení porovnávací panely. Přeji hodně nepravděpodobně šťastných chvil při jeho užívání. Ne snad, že by kdiff3 byl špatný nástroj, naopak. Ale když už dojde na potřebu interakce uživatele při mergi, tak už se většinou jedná o nějakou zapeklitost.
