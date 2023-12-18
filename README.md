# TEC-WEB

## Server Setup

Per testare con un server a casa dovete scaricare [xampp](https://www.apachefriends.org/) lasciandogli installare tutto
Dopodiché fatelo partire e nel suo control panel cliccate start su Apache e MySQL
Ora aprite un browser ed andate su “localhost/phpmyadmin”

## DB Creation

Per creare il db per il sito:

1.  a sinistra cliccate su nuovo dopodichè come nome dategli quello che volete nei miei prime file di test (che non so se pusho) l’ho chiamato login_sample_db e l’esmpio lo farò per questo
2. Create una o più tabelle da N colonne nome 
    - tabella: users
    - colonne: 5
3. Definire le colonne 
    - NOMI: id, user_id, user_name, password
        - id è l’id del server mentre user_id è l’id che diamo noi alla creazione
    - TIPI: bigint, bigint, varchar, varchar, timestamp
    - LUNGHEZZA/VALORI: i varchar a 20 il resto vuoto
    - id a destra va selezionato primary (essendo chiave primaria) e attivare auto increment
    - salvare
        - Ora vi dovrebbe portare nella sezione struttura della tabella se no cliccate la tabella e poi in alto struttura
4. Selezionare “più” a destra delle colonne della struttura e poi index in modo da creare un indice per quel valore per user_id user_name password e date
