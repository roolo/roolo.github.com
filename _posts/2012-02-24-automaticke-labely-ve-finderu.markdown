---
layout: post
title: Automatické labely ve Finderu
categories:   [mox, uživatel, začátečník, applescript]
excerpt: |-
  Jak si zařídit, aby se nově přidané položky ve složce označovaly barevným labelem. To se může hodit například pokud máte adresář s dokumenty, které chcete projít -- žluté nové, zelené projduté.
  
---
### O co jde?
Každý soubor, či adresář je možné ve Finderu označit barevným labelem. Výber barvy je možný v kontextové nabídce souboru / adresáře. V současné verzi Mac OS X -- Lion je možné nadefinovat adresářům při změně obsahu, spuštění zvoleného AppleScriptu. V postu se bude dost používat přecházení mezi adresářemi, takže tomu kdo o ní neví povím o klávesové zkratce &#x2318;&#x21E7;+g, která slouží ke skoku do zadaného adresáře. Jako bonus podporuje doplňování tabulátorem. Kdo to nechce zkoušet na vlastní Mac, tomu poslouží [video ukázka](http://youtu.be/QO6bCYQWPYA)

### Jak na to
Vytvoříme si adresář `/tmp/fa-test`. Vytvoříme soubor pro AppleScript -- aplikace "AppleScript Editor" zatím klidně prázdný a uložíme ho do adresáře `~/Library/Scripts/Folder Action Scripts` s názvem souboru `add - yellowize`. Pokud adresář neexistuje, tak ho vytvořit. Nyní otevřeme nastavení akcí adresáře -- &#x2303;+klik na adresář `fa-test` a zvolit `Folder Actions Setup...`. Ihned po spuštění nástroje budeme dotázáni jaký skript chceme adresáři přiřadit. Zvolíme náš `add - yellowize` a potvrdíme tlačítkem Attach. Po zavření okna pro nastavení akcí adresáře se vrátíme zpět do AppleScript editoru. Náš skript naplníme následujícím obsahem.

    on adding folder items to this_folder after receiving these_items
    	tell application "Finder"
    		repeat with one_item in these_items
    			set label index of one_item to 3
    		end repeat
    	end tell
    end adding folder items to

Obsah je celkem samo popisný. Jediné co je trochu nejasné, je číslo tři. Toto číslo se dá odvodit z kontextové nabídky souboru / adresáře, kde za sebou vidíme jednotlivé barvy. Číslo 4 by tedy byla barva zelená. Soubor uložíme a když teď nahrajeme nějaký testovací soubor do adresáře `/tmp/fa-test`, tak se nám označí žlutě.