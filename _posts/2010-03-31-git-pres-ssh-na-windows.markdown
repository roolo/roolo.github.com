--- 
name: git-pres-ssh-na-windows
layout: post
title: Git pres ssh na Windows
date: 2010-03-31 02:43:00 +02:00
categories: 
- systém
- služby
- git
- vývoj
- vývojář
- záčátečník

excerpt:  |-
  V tomto postu popíši rozjetí toho co píši v nadpisu a zároveň uvítám čtenáře v novém roce 2010. Omlouvám se za to sproste slovo v nadpisu, začinajicí na W, ale okolnosti si to žádají. Zjistil jsem, že nejeden vyvojař u kterého dokonce hrozí, že dosáhne vysokoškolského vzdělání, které jej bude identifikovat jako IT specialistu, není sto rozjet git přes ssh na Windows (myslím tím tu klientskou část). Proto jsem se jal tuto exotiku vyzkoušet na vlastní kůži.

---

### "Vo co tady jako de?!"

Git - decentralizovaný systém pro správu verzí. Jiné jsou například Mercurial, Bazaar, či Subversion (!svn je centralizované! uvádím ho jen pro jeho rozšířenost)
SSH - Secured SHell. Slouží pro vykonávání příkazů na počítačí přes zabezpečené spojení

Git obstarává práci s repozitáři a to přes zabezpečené spojení v případě, že použijeme například SSH. Na fungování takového spojení ho nejdřive musíme vytvořit. V tomto postu budu používat sadu prográmků z toolsetu <a href="http://putty.very.rulez.org/download.html">PuTTY</a>.

V tomto postu budu také přepokládat, že git je na serveru zpřístupněn přes gitosis a to pod uživatelem git. Nastavení, či instalaci gitosis jako takového tento post nepokrývá.

### SSH Klíč

Co budeme potřebovat úplně nejdříve je SSH klíč, kterým nás server na kterém je kýžený repositář bude identifikovat. Použiji k tomu PuTTYgen ve verzi release 0.60. Jenom upozorním, že popisky políček a tlačítek se nejspiše mení s jazykovou mutací PuTTYgenu, kterou používáte, ale mělo by se jednat o překlad slov která zde uvádím.

Pokud úplně dole v <em>Parameters </em>-&gt; <strong>Type of key to generate</strong> není zvolen typ SSH-2 RSA, tak ho zvolte. Pokud zvolen je, zvolte ho ještě víc;) Zvolit tento typ klíče je celkem důležité.

Kliknutím na tlačítko <strong>Generate</strong> se počne generovat klíč.

Text v políčku <strong>Key comment</strong> vás bude identifikovat na serveru, takže vyplňte něco co se dobře čte a je pokud možno jedinečné. Já v příkladu zvolil <em>mailo@theWMachine</em>

**Key passphrase**: Toto políčko je vlastně takové vaše heslo vygenerovaného klíče. Bude potřeba zadat pokaždé, když budete chtít klíč použít. Upozorňuji, že to není důvod k tomu toto políčko nevyplňovat, ale právě naopak. Já v příkladu zvolil passphrase <em>heslo</em>.

#### Ukládáme klíče
Toolset PuTTY používá z mě naprosto neznámého důvodu několik druhů klíčů. Z tohoto důvodu uložte co můžete. Tzn tlačitko Save public key, Save private key, Conversions -&gt; Export OpenSSH key, Conversions-&gt; Export ssh.com key.

Všechny klíče ukládejte do &lt;<em>domovský adresář</em>&gt;\.ssh. Domovský adresář je při standartní konfiguraci na systémech W.. XP v adresáři \Documents and Settings\&lt;<em>jméno uživatele</em>&gt;. Na systémech W... Vista \Users\&lt;<em>jméno uživatele</em>&gt;. Jako <em>jméno uživatele</em> beru uživatele systému W.. pod kterým budete klíče používat.

Tlačítkem Conversions -&gt; <strong>Export OpenSSH key</strong>  uložte klíč pod názvem <em>id_rsa</em>

Tlačítkem <strong>Save public key</strong> uložte klíč pod názvem <em>public</em>

Tlačítkem <strong>Save public key</strong><em> </em>(ano podruhé to samé tlačitko)<em> </em>uložte klíč pod názvem <em>id_rsa.pub</em>

Tlačítkem <strong>Save private key</strong> uložte klíč pod názvem <em>private.ppk</em>

Zbytek ukládání dle libosti;)

Teď příchází krok, který nejde tak úplně udělat přímo v PuTTY Key Generatoru. Asi je vám divné proč jsme dvakrát klikali na to samé tlačitko a napodruhé volili jiný název souboru. Bylo to jenom proto, abychom nemuseli ručně soubor s tímto názvem vytvářet. Otevřete tedy nyní soubor s názvem id_rsa.pub v nějakém textovém editoru (ne, MS Word není textový editor) přinejhořším v notepadu, který by měl být na každé verzi W... Obsah tohoto souboru nahraďte obsahem z políčka <em>Public key for pasting into OpenSSH authorized_keys file</em>. Soubor uložte (<strong>velice důležité</strong>) a editor zavřete (volitelné).

#### Jak se můj klíč dostane na server s repozitářem?

Nyní je potřeba předat klíč administrátorovi repozitářů se kterými chcete pracovat. Administrátor potřebuje <strong>ssh public key</strong>. Jiný mu nedávejte i kdyby vám vyhrožoval. Jedná se o klíč v souboru <strong>id_rsa.pub</strong>. Tento klíč můžete bezstarostně šířit mezi svými znamými. To co vás od nich odlišuje je, že máte privátní klíč. Řekl bych, že každý administrátor uvítá, když mu pošlete celý soubor a ne jenom jeho obsah.

### Otestování spojení

Až se k vám dostane zpráva, že to již můžete zkusit, tak přichází na řadu další nástroj z toolsetu PuTTY a to nástroj Pageant.

Pageant je hodná tray icona s kloboukem, která se nám postará o práci s naším pracně vygenerovaným klíčem. Spusťte nástroj Pageant a k trayikonám (ty srandovní obrázky u hodin vpravo dole) vám přibude obrázek počítače s kloboukem. Klikněte na něj pravým tlačitkem a v nabídce klikněte na <strong>Add key</strong>. Nyní zvolte námi vygenerovaný klíč pro PuTTY. Je to ten s příponou ppk. Budete dotázaní na heslo. To zadejte a kliknete na tlačitko Ok. Nyní znovu klikněte pravým tlačitkem na počítač s kloboukem, ale nyní v nabídce klikneme na New Session. Jediné co je zde potřeba vyplnit je políčko <em>Host Name (or IP address)</em>. Zadejte adresu serveru na kterém jsou tolik chtěné repositáře. Ve spodní části okna vyberte <em>Close window on exit: <strong>Never</strong></em>. Klikněte na <strong>Open</strong> ve spodní části okna nástroje PuTTY. Otevře se okno s černým obsahem a po chvili budete vyzváni k zadání uživatelského jména. Zadejte git a stiskněte Enter. Pokud nebudete dotázáni na heslo, tak je vše tak jak to chceme. Systém na který se připojujete může vrátatit chybu podobnou následující

    login as: git
    Authenticating with public key "mailo@theWMachine" from agent
    Server refused to allocate pty
    ERROR:gitosis.serve.main:Need SSH_ORIGINAL_COMMAND in environment.

To je v naprostém pořádku a nemusíte se tím znepokojovat. Jediné co nás v tuto chvili může vyvést z míry je, když se nás systém zeptá na heslo.

#### Konečně Git

Nyní již konečně můžeme pracovat s Gitem. Ja jsem se v gitosis pridal k projektu test, takže ho teď zkusím naklonovat (něco zhruba, trochu, velice málo podobného checkoutu v Subversionu):

    ##CENSORED##>git clone ssh://git@##CENSORED##/test
    Initialized empty Git repository in ##CENSORED##/test/.git/
    The authenticity of host '##CENSORED##' can't be established.
    RSA key fingerprint is ##CENSORED##.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added '##CENSORED##' (RSA) to the list of known hosts.
    Enter passphrase for key '##CENSORED##.ssh/id_rsa':
    remote: Counting objects: 9, done.
    remote: Compressing objects: 100% (3/3), done.
    remote: Total 9 (delta 0), reused 0 (delta 0)
    Receiving objects: 100% (9/9), done.

Ve vašem případě by se nemělo zobrazovat <em>##CENSORED##</em>, ale nějaké konkrétní adresy;)

To je k rozběhání Gitu pres SSH na W... vše. Doufám, že vám vše funguje tak jak chcete a že jste cely postup ve zdraví přežily. Pokud máte pocit, že v postu něco schází, nebo jste našli chybu, neváhejte mi to prosím sdělit v komentářích.
