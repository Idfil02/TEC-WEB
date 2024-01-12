<?php

    require_once "../strumenti_condivisi/connessione.php";

    // Se utente è loggato
    session_start();
    if (isset($_SESSION['user_id'])){
        $connection = new AccessDB;

        if ($connection->open_connection()) {
            $isSaved = $connection->execute_query("SELECT * FROM Salvati WHERE Quiz=" . $_GET['quizID'] . " AND Utente=" . $_SESSION['user_id']);
            // Ritorno 1 se utente ha salvato il quiz o 0 altrimenti
            echo ($isSaved != NULL) ? true : false;
        }

        $connection->close_connection();
    } 
    
    // Se l'utente non è loggato il check è inutile
    else {
        echo -1;
    }
   
?>