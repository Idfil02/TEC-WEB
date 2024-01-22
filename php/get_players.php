<?php

    require_once "../strumenti_condivisi/connessione.php";

    $error = 'Ops! Qualcosa è andato storto. Al momento non siamo in grado di connetterci al server del quiz. Riprova più tardi. Se il problema persiste, contatta il supporto.';
    $connection = new AccessDB;

    if ($connection->open_connection()) {
        // Cerco numero di giocatori
        $query_res = $connection->execute_query("SELECT Num_Giocate FROM Quiz WHERE ID='" . $_GET['quizID'] . "'");  

        if(is_array($query_res)) {
            $n_players = $query_res[0]['Num_Giocate'];
            $n_players++;

            // Faccio azione di modifica giocate
            if($connection->execute_mod_query("UPDATE Quiz SET Num_Giocate=" . $n_players . " WHERE ID=" . $_GET['quizID'])){
                echo $n_players;
            }
            else {
                echo $error;
            }
        }
        else {
            echo $error;
        }
        $connection->close_connection();
    }
    else {
        echo $error;
    }


?>
