<?php

    require_once "../strumenti_condivisi/connessione.php";

    $connection = new AccessDB;

    if ($connection->open_connection()) {
        // Cerco numero di giocatori
        $n_players = $connection->execute_query("SELECT Num_Giocate FROM Quiz WHERE ID='" . $_GET['quizID'] . "'")[0]['Num_Giocate'];  
        $n_players++;

        // Faccio azione di modifica giocate
        $connection->execute_mod_DB('Quiz', 'ID='.$_GET['quizID'], 'Num_Giocate', $n_players); 
        
        // Ritorno numero di giocate
        echo $n_players;
    }

    $connection->close_connection();
?>
