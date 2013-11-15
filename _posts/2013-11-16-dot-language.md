---
layout: post
title: Dot language
categories:   [formáty, začátečník, jazyky]
excerpt: |-
  V tomto postu zběžně představuji Dot, jazyk na tvorbu diagramů.
  
---

### O co jde
Samozřejmě je zde mnoho toolů na tvorbu diagramů  na většina bude pro spoustu lidí pohodlnější. O Dotu píšu protože ho občas na něco použiji a mě osobně pohodlný přijde. Jedná se o jazyk pro popis diagramů. Na definujeme si jednotlivé body v diagramu a pokud mají body nějaké vazby, tak i ty. 

### Takhle z kraje
Body (nodes) a jejich spojení (edges) mohou mít popis toho jak vypadají. Tyto dva nejčastější ůčastnici diagramu nad se out mají ještě diagram samotný. Hlavní diagram může ještě mít pod diagramy (subgraph) a jejich struktura je shodná se strukturou diagramu hlavního.

### Příkladem

    digraph G {
      parent
      child1
      child2

      child1 -> parent
      child2 -> parent
    }

![Výstup předchozího kódu](https://files.app.net/0rdvBwM3.png)

Vytvořili jsme diagram se třemi nodami 'parent', 'child1' a 'child2'. Dále jsme nadefinovali, že 'child1' a 'child2' mají vazbu na node 'parent'.  

V hranatých závorkách můžeme dát prvku nějaké atributy jako například barvu, styl, nebo orientaci.

    digraph G {
      parent [label="Praotec Čech"]
      child1 [label="František Ringo Čech"]
      child1 [label="Svatopluk Čech"]
    
      child1 -> parent [label="Potomstvo";color="blue"]
      child2 -> parent [label="Potomstvo";color="green"]
    }

![Výstup předchozího kódu](https://files.app.net/0r6t57XX.png)


Pokud nejsou atributy u žádného z našich prvků, tak patří přímo diagramu, nebo se jedná o defaultní hodnoty. Teď například nastavíme *nodes*, aby byly červenou barvou, *edges* aby byly růžové a aby byl celý diagram, aby byl z prava do leva.


    digraph G {
      rankdir=RL
  
      node[color="red"]
      edge[color="pink"]
  
      parent [label="Praotec Čech"]
      child1 [label="František Ringo Čech"]
      child2 [label="Svatopluk Čech"]

      child1 -> parent [label="Potomstvo";]
      child2 -> parent [label="Potomstvo";]
    }

![Výstup předchozího kódu](https://files.app.net/0r6b7eiv.png)

### Závěrem

Tak to bychom měli pár ukázek. Pokud se chcete dozvědět o tomto jazyce více, doporučuji dokument [Drawing graphs with dot](http://www.graphviz.org/Documentation/dotguide.pdf). Jedná se o opravdu vyčerpávající popis jazyka a jeho možností. Neděste se toho, že je tak dlouhý. Já osobně jsem ještě nepoužil snad ani desetinu a k dokumentu přistupuji spíše referenčně, než jako k poutavému čtení.
