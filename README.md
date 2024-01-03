# TEC-WEB

## Git in VS Code Setup
Per fare i commit e i push del codice che produrrete direttamente da vs code dovete scaricare git per windows da 
https://gitforwindows.org/ dopodichè aggiungere l'estensione di git a vs code.
Ora nella activity bar di sinistra ci dovrebbe essere un nuovo simbolo chiamato source control a cui si può accedere
anche premendo CTRL+SHIFT+G.
Adesso nelle schermata di welcome di vs cì sara una nuova scelta oltra a new file open file ecc... cioè clone git repository.
Premetale e nella barra sopra copiate il link della repo qullo che la repo vi da se premete sul tasto code verde facendo questo copierete la repo sul vostr pc.
Ora nella cartella creata troverete i file della repo all'interno che potete modificare in questa cartella adesso potete nache creare nuovi file ed utilizzando il source control dovreste poter fare add commit e push sulla repo

## Server Setup

Per testare con un server a casa dovete scaricare [xampp](https://www.apachefriends.org/) lasciandogli installare tutto
Dopodiché fatelo partire e nel suo control panel cliccate start su Apache e MySQL
Ora aprite un browser ed andate su “localhost/phpmyadmin”

## DB Creation

Per creare il db per il sito:

1.  a sinistra cliccate su nuovo dopodichè come nome dategli quello che volete nei miei prime file di test (che non so se pusho) l’ho chiamato login_sample_db e l’esmpio lo farò per questo
2.  Create una o più tabelle da N colonne nome
    - tabella: users
    - colonne: 5
3.  Definire le colonne
    - NOMI: id, user_id, user_name, password
      - id è l’id del server mentre user_id è l’id che diamo noi alla creazione
    - TIPI: bigint, bigint, varchar, varchar, timestamp
    - LUNGHEZZA/VALORI: i varchar a 20 il resto vuoto
    - id a destra va selezionato primary (essendo chiave primaria) e attivare auto increment
    - salvare
      - Ora vi dovrebbe portare nella sezione struttura della tabella se no cliccate la tabella e poi in alto struttura
4.  Selezionare “più” a destra delle colonne della struttura e poi index in modo da creare un indice per quel valore per user_id user_name password e date

    ## Idee di design

    Per ora i colori scelti sono
    --back: #121212; (background)
    --primary: #bb86fc; (colore primario)
    --secondary: #03dac5; (colore secondario)

    Separazione Classi con -

    Nome del sito: Quackwiz

    16 Domande a scelta multipla


## Creare pagina php
Dovete creare un file "nome_pagina.php" al cui interno copiate questo codice e modificate le variabili come scritto. Praticamente qui dò tutti i parametri alla funzione buildPage che crea la vostra pagina.
```
<?php 
    require_once "strumenti.php";       //vedete il vostro path

    $template = file_get_contents('template_layout.html');          //vedete il vostro path
    $main_content = file_get_contents('la_mia_pagina.html');        // modificare con il path della propria pagina in html

    $title = "QuackWiz";         //modificare con il proprio titolo della pagina
    $pageID = "Home";           //modificare con l'id della pagina (è praticamente l'id del body)
    $keywords = "xd";        //modificare con delle parole chiave per SEO
    $description = "lmao";      //modificare con una breve descrizione della pagina

    $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
    echo $page;         //mostra la pagina creata
?>
```
Per poter far funzionare la funzione buildPage vi servono poi i file **strumenti.php** e **template_layout.html** che trovate nel branch jessica :). Praticamente il primo contiene la definizione della funzione buildPage e il secondo è il layout base di tutte le pagine, nel quale dovete linkare il vostro css.
Ricordatevi, inoltre, che sull'html della vostra pagina non serve mettere nessun tag `<html>`, `<head>`, `<body>` etc.; semplicemente scrivete solo quello che mettereste dentro il body.

**Attenzione!** Per header e footer, siccome sono presenti in tutte le pagine non serve fare la pagina .php, però dovete modificare **strumenti.php** inserendo il vostro path di header e footer.