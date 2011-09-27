---
layout: post
title: VPN server na MOX Lion (10.7)
categories:   [pokročilý, Systém, mox, lion, server]
date:  2011-09-27 19:48:36 +01:00
excerpt: |-
  V tomto postu popisuji jak si na desktopovém MacOS X Lion rozjet VPN server. Já osobně si od toho slibuji OTA sync i když nebudu na jedné síti se svým iOS zařízením. Náplň postu je z většiny překlad souhrnu článku a komentářů na http://blog.theilluminatedengineer.com/?p=136.
---

Předesílám, že během postupu bude dost možná vyžadován restart celého systému. Editace souborů jsem prováděl přes `mate <názav souboru>`. Systém se pak při ukládání zeptal na zda uložení souboru posvětím svými přihlašovacími údaji.

### Nastavení VPN serveru

MOX v desktopové verzi obsahuje server VPN, akorát k němu není automaticky k dispozici hezké GUI jako je tomu v případě MOX Server. Spustitelný soubor VPN serveru - vpnd, příjmá jako parametr jak se má chovat po spuštění serveru a id serveru, který chceme spustit. Nový server si nadefinujeme v /Library/Preferences/SystemConfiguration/com.apple.RemoteAccessServers.plist nasledujícím obsahem

    {
        ActiveServers = ("com.apple.ppp.l2tp");
        Servers = {
            "com.apple.ppp.l2tp" = {
                Addresses = ("XXX.XXX.XXX.XXX");
                DNS = {OfferedSearchDomains = (); OfferedServerAddresses = (); };
                IPv4 = {
                    ConfigMethod = Manual;
                    DestAddressRanges = ("YYY.YYY.YYY.YYY", "ZZZ.ZZZ.ZZZ.ZZZ");
                    OfferedRouteAddresses = ();
                    OfferedRouteMasks = ();
                    OfferedRouteTypes = ();
                };
                Interface = {SubType = L2TP; Type = PPP; };
                L2TP = {
                    IPSecSharedSecret = "com.apple.ppp.l2tp";
                    IPSecSharedSecretEncryption = Keychain;
                    Transport = IPSec;
                };
                PPP = {
                    AuthenticatorPlugins = (DSAuth);
                    AuthenticatorProtocol = (MSCHAP2);
                    IPCPCompressionVJ = 0;
                    LCPEchoEnabled = 1;
                    LCPEchoFailure = 5;
                    LCPEchoInterval = 60;
                    VerboseLogging = 1;
                    DSACLEnabled = 1;
                    Logfile = "/var/log/ppp/vpnd.log";
                };
                Server = {
                    Logfile = "/var/log/ppp/vpnd.log";
                    MaximumSessions = 128;
                    VerboseLogging = 1;
                };
            };
        };
    }

Znát význam celého souboru není v tuto chvíli potřeba. Je potřeba nahradit XXX.XXX.XXX.XXX IP adresou na které VPN server poběží a "YYY.YYY.YYY.YYY", "ZZZ.ZZZ.ZZZ.ZZZ" hranicemi rozsahu adres, ze kterého může vpnd přiřazovat. IP adresa počítače se na MOX zjití příkazem `ifconfig`. Hledejte řádek podbný `inet 192.168.5.10`

Dále je potřeba nadefinovat službu pro launchd. Definici souboru umístíme do souboru /System/Library/LaunchDaemons/com.apple.ppp.l2tp.plist .

    <?xmlversion="1.0"encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plistversion="1.0">
        <dict>
            <key>Label</key>
            <string>com.apple.ppp.l2tp</string>
            <key>ProgramArguments</key>
            <array>
                <string>/usr/sbin/vpnd</string>
                <string>-x</string>
                <string>-i</string>
                <string>com.apple.ppp.l2tp</string>
            </array>
            <key>OnDemand</key>
            <false/>
        </dict>
    </plist>
    
Nyní by melo být možné spustit službu VPN serveru nasledujícím příkazem

    launchctl load /System/Library/LaunchDaemons/com.apple.ppp.l2tp.plist

Přihlašování k VPN serveru probíha přes uživatelské jméno a uživatelské heslo. Nechtěl jsem dávat v šanc svůj vlastní uživatelský účet, tak jsem si vytvořil nový, jenom pro učely přihlašování k serveru. Na konci postu budu mluvit ještě o jedné věci, kvůli které jsem radši že mám zvlášť účet na VPN.

Zatím poslední věc kterou musíme udělat na serveru je nastavení sdíleného klíče pro přihlášení na VPN server.

    sudo security add-generic-password -a com.apple.ppp.l2tp \
        -s com.apple.net.racoon -T /usr/sbin/racoon -p "sdileny klic" \
        /Library/Keychains/System.keychain

Sdílený klíč je v této ukázce "sdileny klic" ;)

Následujícím příkazem je možné sledovat co se ve VPN serveru děje.

    tail -f /var/log/ppp/vpnd.log

Dá se zde například zjistit, jakou IP adresu ziskal počítač připojující se k serveru a obecně co se dělo při připojování. Toho využiji v závěru postu.

### Nastavení klienta
_iPod touch - 4.3.5 (8L1)_

V aplikaci pro nastavení se VPN server přidá v cestě VPN > Přidat konfiguraci VPN...

- Typ připojení(Horní taby) : L2TP
- Server: &lt;IP adresa serveru na kterém je nastaven VPN server>
- Účet: &lt;uživatelský účet zamýšlený k přihlašování na VPN>
- RSA SecureId: Vypnuto
- Heslo: &lt;uživatelské heslo k účtu>
- Sdílený klíč: &lt;sdílený klíč nastavený v závěru nastavování serveru>
- Odeslat vše: Zapnuto
 
- Proxy:  Vypnuto (Taby úplně dole)

Tlačítkem uložit, uložíme konfiguraci a přesuneme se na hlavní obrazovku správy VPN spojení. Tapnutím na nově vytvořené spojení se pouze zvolí jako používané. Samotný pokus o připojení probíhá až po aktivaci položky VPN v horní části obrazovky. Pokud vše dopadlo dobře, tak vám nyní na obrazovce beží čas jak dlouho jste k VPN připojeni.

### MCHAP fix

Já štěstí neměl a objevila se mi hláška o chybě autentizace. Pro ty z vás, které potkalo to samé tedy jesště jeden a snad i poslední krok.

U mě se chyba projevila následujícím textem v logu vpnd

    Thu Sep 22 12:52:35 2011 : CHAP peer authentication failed for vpnuser

Pravděpodobně se bude lišit časová značka a jméno přihlašujícího se užitele, které je na konci řádku. Řešení chyby je ukryto v komentářích původního článku.

    dscl . change /users/vpnuser AuthenticationAuthority ';ShadowHash;HASHLIST:<SALTED-SHA512,SMB-NT>' ';ShadowHash;HASHLIST:<SALTED-SHA1,SMB-NT,SMB-LAN-MANAGER>'

Dscl je teminálový nástroj na správu domén. Když se podíváme do manuálové stránky, tak si můžeme přeložit předchozí přikaz jako

    dscl . <operace> <cesta k datům> <klíč v datech> <původní hodnota klíče> <nová hodnota klíče>

Puvodní hodnota pravděpodobně bude odlišná od mnou uvedené. Pokud se pokusíte zavolat příkaz s chybnout původní hodnotou, tak vám to dá dscl vědět hláškou podobnou této

    <main> attribute status: eDSAttributeNotFound
    <dscl_cmd> DS Error: -14134 (eDSAttributeNotFound)

Aktuální původní hodnotu je potřeba zjistit přes následující přikaz

    dscl . read /users/vpnuser AuthenticationAuthority

Dscl vrátí celé AuthenticationAuthority. Nás z něj zajímá akorát ShadowHash. Po úspěšné změne údajů, o kterém vás dscl informuje tím, že nevypíše zhola nic, by již mělo spojení proběhnou bez potíží.

### DNS

VPN server může sloužit i pro běžné prohlížení internetu, či kontaktování ostatních strojů pomocí doménových jmen. V konfiguraci (soubor com.apple.RemoteAccessServers.plist) se uvedou IP adresy DNS serverů.

    DNS = {OfferedSearchDomains = (“mojedomena.cz”); OfferedServerAddresses = ("<sem dopsat ip adresy google>"); };

V ukazce jsou IP adresy veřejných DNS serverů Google http://odkaz na google public dns . 

### Závěrem

Doufám, že bude tento post někomu nápomocen. Pokud by v něm byly nějaké chyby, nepřesnosti, či nejasnosti, tak se o nich rád dovím přes komentáře pod postem.