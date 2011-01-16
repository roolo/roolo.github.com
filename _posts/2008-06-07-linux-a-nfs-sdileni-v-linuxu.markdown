--- 
name: linux-a-nfs-sdileni-v-linuxu
layout: post
title: "Linux a NFS ( Sdílení v Linuxu )"
date: 2008-06-07 01:22:00 +02:00
topics: 
- server
- pokročilý
- Síť
- linux
- kolaborace
excerpt:  |-
  Dobrý večer, pokud jdete kalit, dobré ráno pokud už jste zvraceli. V tomto postu popíšu jakže se dá v linuxu nasdílet adresář. Překvapilo mě jak je to jednoduché, takže jsem možná vynechal některé drobnosti, které nejsou až tak důležité, ale funguje to no:)
---

Predtim nez zacnete se ujistete, ze mate nainstalovane baliky nfs-kernel-server a nfs-common. Celá konfigurace spocivala v editaci tří souborů:

**/etc/hosts.allow** *Obsahuje seznam strojů, které mohou přistupovat k místním službám*

    lockd: 192.168.1.0/255.255.255.0
    rquotad: 192.168.1.0/255.255.255.0
    mountd  192.168.1.0/255.255.255.0
    statd 192.168.1.0/255.255.255.0

Zde nastavované služby používá nfs pro své fungování.

Syntaxe je: `služba: adresa`

Adresa může být buď pro počítač, či síť. Pokud by jste chtěli zadat více adres. Musíte je oddělit mezerami. Já jsem zvolil síť, abych nemusel přidávat počítač pokaždé, když někdo přijde a bude si chtít prohlédnout mé fotky, či tak něco. Pokud bych chtěl například povolit přístup ke službě lockd pro výše zmíněnou síť a jeden počítač 192.168.0.10 vypadalo by to asi takto:

    lockd: 192.168.1.0/255.255.255.0 192.168.0.10

**/etc/hosts.deny**

Funkčně se jedná o podobný soubor jako předešlý, ale slouží k opačnému účelu. Uvádí se zde počítače a sítě, které ke svému spinavému prádlu pustit nechcete.</blockquote>

**/etc/exports**

Tento soubor již konečně obsahuje nastavení toho jaké adresáře se mají sdílet a jak. Syntaxe je podobná jako u předešlých souborů.

    /media/         192.168.1.0/255.255.255.0(ro)

Syntaxe je opravdu hodně podobná. První na řádku je adresář, který budeme sdílet. Následuje adresa počítače, či sítě, který s může s daným adresářem dělat to co je nalepené hned u adresy. Jako u předešlých souborů můžete za mezeru vkládat další a další stroje, či sítě.

Pro načtení nastavení sdílení zadejte v konzoli jako uživatel root příkaz:

    mujstroj:/# exportfs -ra
    
Pokud jste vše nastavili správně, tak by jste měli na jiném počítači vidět služby běžící na vámi nastavovaném stroji:

    pepa@depo:/$ rpcinfo -p mujstroj
    program vers proto   port
    100000    2   tcp    111  portmapper
    100000    2   udp    111  portmapper
    100003    2   udp   2049  nfs
    100003    3   udp   2049  nfs
    100003    4   udp   2049  nfs
    100021    1   udp  32770  nlockmgr
    100021    3   udp  32770  nlockmgr
    100021    4   udp  32770  nlockmgr
    100003    2   tcp   2049  nfs
    100003    3   tcp   2049  nfs
    100003    4   tcp   2049  nfs
    100021    1   tcp  40920  nlockmgr
    100021    3   tcp  40920  nlockmgr
    100021    4   tcp  40920  nlockmgr
    100005    1   udp  32771  mountd
    100005    1   tcp  34484  mountd
    100005    2   udp  32771  mountd
    100005    2   tcp  34484  mountd
    100005    3   udp  32771  mountd
    100005    3   tcp  34484  mountd
    100024    1   udp  32797  status
    100024    1   tcp  58528  status

Pokud jste viděli něco podobného, tak již niní můžete připojit adresář z druhého počítače. V našem případě připojíme z počítače depo adresář z počítače mujstroj

    pepa@depo:/$ sudo mount mujstroj:/media/ /mnt/mujstroj_media/
    pepa@depo:/$ ls /mnt/mujstroj_media/
    cdrom  cdrom0  floppy  floppy0  ipod  usb

Zdroje:

<a title="Linux NFS-HOWTO" href="http://nfs.sourceforge.net/nfs-howto/index.html"><strong>http://nfs.sourceforge.net/nfs-howto/index.html</strong></a>
<blockquote>Asi nejdůležitější jsou tam:
<blockquote><a title="3. Setting Up an NFS Server" href="http://nfs.sourceforge.net/nfs-howto/ar01s03.html"><em>http://nfs.sourceforge.net/nfs-howto/ar01s03.html</em></a>
<a title="4. Setting up an NFS Client" href="http://nfs.sourceforge.net/nfs-howto/ar01s04.html"><em>http://nfs.sourceforge.net/nfs-howto/ar01s04.html</em></a>
<a title="7. Troubleshooting" href="http://nfs.sourceforge.net/nfs-howto/ar01s07.html"><em>http://nfs.sourceforge.net/nfs-howto/ar01s07.html</em></a></blockquote>
</blockquote>
