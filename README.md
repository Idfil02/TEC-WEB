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
