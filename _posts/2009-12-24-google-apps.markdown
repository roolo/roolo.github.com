--- 
name: google-apps
layout: post
title: Google Apps
date: 2009-12-24 19:48:00 +01:00
topics: 
- pokročilý
- Síť
- Služby
- webové služby
- google
excerpt:  |-
  Google Apps je službou, která umožňuje mít služby společnosti Google pro svojí doménu. Nemáte už pak například mail na emil.suchar@gmail.com, ale například emil@suchar.cz( mailem to nekončí ). V tomto článku popíši jak to zhruba funguje a jak si Google Apps zřídit.


---

### Jak to funguje

U společnosti Google si zaregistrujete učet pro vaši doménu. Ve chvíli registrace učtu na google.com by neměla být nutná její existence, ale je samozřejmě lepší mít již doménu pro kterou Google Apps( GA ) zamýšlíte zaregistrovánu. Nikdy nevíte, jestli vám ji někdo "nevyfoukne před nosem". V administraci své domény si změníte nebo přidáte zaznámy <a title="DNS na wikipedii" href="http://cs.wikipedia.org/wiki/DNS">DNS</a>( popíšu dále ).

### Doména

Jako první je potřeba mít svoji doménu druhého řádu( např. suchar.cz ). Tu si zařídíte u registrátora domén( např <a title="Registrace domén na FORPSI" href="https://www.forpsi.com/domain/">forpsi</a> ), nebo vám registraci domény zařídí firma, u které si zaregistrujete <a title="Webhosting na wikipedii" href="http://cs.wikipedia.org/wiki/Webhosting">webhosting</a>( <a title="Firma nabízející webhosting" href="http://www.cesky-hosting.cz/">Česky Hosting</a>, <a title="Fima nabízející webhosting" href="https://www.onebit.cz/">ONEbit</a>, <a title="Firma nabízející webhosting" href="http://www.profitux.cz/">Profitux</a> ). Jenom podotknu, že webhosting jako takový pro Google Apps mít nemůsíte. K provozování GA pouze potřebujete mít dříve zmíněnou doménu druhého řádu a přes ní budete( po správném nastavení DNS ) přistupovat ke Google službám k vaší doméně

### <a title="Registrace učtu pro Google Apps" href="http://www.google.com/a/cpanel/domain/new?hl=cs">Registrace na Google.com</a>

Zde o sobě vyplníte pár základních údajů a budete muset nechat google ověřit, že vám doména opravdu patří. To probíhá nahráním souboru se specifickým jménem a obsahem. Průvodce registrací provede naprosto jednoduše a "bezbolestně".

### Nastavení DNS

V jádru jde o to říci ve svých DNS záznamech, že pokud někdo chce tu a tu službu, tak se má obrátit na ten a ten server. Tedy když se budu držet dřívějších příkladů, že pokud někdo příjde na adresu mail.suchar.cz, má se tímto požadavkem zabývat server Googlu.

Asi nejsnažší konfigurace DNS pro služby GA, kterou jsem si zatím prošel byla na webhostingu ONEbit. Samozřejmě, že si nastavíte GA pro každou doménu u které můžete měnit záznamy DNS, ale zde máte k dispozici šablonu, která to usnadní a vy si pak už jenom přidávate záznamy pro subdomény/jednotlivé služby.

Výsledné nastavení pak vypadá nějak takto:

#### CNAME záznamy - odkazování na služby

<table border="0">
<tbody>
<tr>
<td>calendar.suchar.cz</td>
<td>ghs.google.com</td>
<td>3600</td>
</tr>
<tr>
<td>docs.suchar.cz</td>
<td>ghs.google.com</td>
<td>3600</td>
</tr>
<tr>
<td>mail.suchar.cz</td>
<td>ghs.google.com</td>
<td>3600</td>
</tr>
<tr>
<td>moderator.suchar.cz</td>
<td>ghs.google.com</td>
<td>3600</td>
</tr>
</tbody></table>

#### MX záznamy - pošta

<table class="dns-rcs" border="0">
<tbody>
<tr>
<th>Doména</th>
<th>Cíl</th>
<th>TTL</th>
<th>Priorita</th>
</tr>
<tr>
<td><strong>suchar.cz</strong></td>
<td>ASPMX.L.GOOGLE.COM</td>
<td>3600</td>
<td>1</td>
</tr>
<tr>
<td><strong>suchar.cz</strong></td>
<td>ALT1.ASPMX.L.GOOGLE.COM</td>
<td>3600</td>
<td>5</td>
</tr>
<tr>
<td><strong>suchar.cz</strong></td>
<td>ALT2.ASPMX.L.GOOGLE.COM</td>
<td>3600</td>
<td>5</td>
</tr>
<tr>
<td><strong>suchar.cz</strong></td>
<td>ASPMX2.GOOGLEMAIL.COM</td>
<td>3600</td>
<td>10</td>
</tr>
<tr>
<td><strong>suchar.cz</strong></td>
<td>ASPMX3.GOOGLEMAIL.COM</td>
<td>3600</td>
<td>10</td>
</tr>
<tr>
<td><strong>suchar.cz</strong></td>
<td>ASPMX4.GOOGLEMAIL.COM</td>
<td>3600</td>
<td>10</td>
</tr>
<tr>
<td><strong>suchar.cz</strong></td>
<td>ASPMX5.GOOGLEMAIL.COM</td>
<td>3600</td>
<td>10</td>
</tr>
</tbody></table>

V žádném případě nebuďte nervózní, pokud vše nebude hned fungovat. Hostingy většinou provádějí aktualizaci DNS záznamů jednou za nějaký časový interval.
