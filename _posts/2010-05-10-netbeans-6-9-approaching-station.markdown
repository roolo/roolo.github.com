--- 
name: netbeans-6-9-approaching-station
layout: post
title: Netbeans 6.9 approaching station
time: 2010-05-10 01:46:00 +02:00
tags: 
- !binary |
  dsO9dm9qw6HFmQ==

- subversion
- netbeans
- !binary |
  dsO9dm9q

---
Jelikož jsem zvidava opička, tak jsem si nainstaloval a používám vývojovou verzi Netbeans 6.9 Beta. V tomto testu tedy popíši čeho jsem si zatím všiml a na co se tedy můžeme těšit. V nové verzi jistě bude novinek více. Já zde uvádím ty se kterými jsem se potkal při běžné práci s PHP projekty a CVCS Subversion (Git se rýsuje kdesi v dáli)<br/><a name='more'></a><br/><h2>Zaškrtávátka při commitu</h2><br/>Až doteď, když jste chteli commitnout jenom něco ze souborů, ve kterých jsou změny jste museli vybrat jenom to co chcete commitnout v changes, nebo v commit okně dat Exclude from commit. V NB 6.9M1 (testovano s svn) jsou již dispozici u každé commitované změny zatrhávatka zda chcete tuto změnu commitnout. Položky Exclude from Commit a Include in Commit tu zůstaly (také nevím proč) a navíc k nim přibylo Exclude Recursively a Include Recursively, což se hodí, když tuto operaci chcete provést nad nějakým stromem.<br/><br/><h2>Zvýraznění todos</h2><br/>Jde sice o plugin, ale vcelku prijemný. Zvýrazní vám v kódu řádky na kterých máte napsáno nějaké todo - vec kterou je potreba dodelat. Co je todo se ridi nastavenim todos v nastaveni NB<br/><br/><h2>Commit message ze šablony</h2><br/>Pri commitování se vám otevře okno s možností zaškrtat co vše budete commitovat a hned nad výběrem souborů, je pole pro textový vstup zprávy popisující co jste změnili. Od verze NB 6.9 můžete tuto zprávu načítat ze šablony. To vám usnadní práci pokud pracujete na projektu, který má svůj standart pro commit message a vám se nechce vytvářet formát zprávy zas a znovu. <br/><br/><h2>Kontextová nabídka pro soubory v diffu</h2><br/>Pokud si dáte v NB diff nad více soubory máte je všechny vypsány pod sebou nad samotným diffem. Do verze 6.9 se dala kontextová nabídka rozklikávat pouze v dialogu Show changes. Od verze 6.9 se dá nabídka rozklikávat i v diffu.<br/><br/><h2>Textový diff (pohled jako na patch)</h2><br/>Diff je v netbeans již dlouho zobrazen jako dva soubory vedle sebe s tím že je zvýrazněno co na které straně chybí, nebo přebívá. Ve verzi NB 6.9 Přibyla možnost zobrazit si změny v souboru jako patch. To ocení zejména lidé, kteří jsou zvyklí pracovat s textovými diffy. Další užití je možné pokud chcete rychle vytvořit patch na nějaký soubor, nebo změny do hlavní větve odesíláte mailem.
