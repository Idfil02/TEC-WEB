<?php

    require_once "../strumenti_condivisi/connessione.php";

    $connection = new AccessDB;

    if ($connection->open_connection()) {
        $quiz = $_GET['quizID'];

        // Cerco numero di like
        $n_likes = $connection->execute_query("SELECT Num_Like FROM Quiz WHERE ID='" . $quiz . "'")[0]['Num_Like']; 

        // Eventuali modifiche al numero di likes
        if(isset($_GET['action'])){
            session_start();
            // Se utente loggato
            if(isset($_SESSION['user_id'])) {
                $user = $_SESSION['user_id'];
                // Controllo tipo di modifica da svolgere
                switch ($_GET['action']) {
                    case "+1":
                        $n_likes++;
                        $connection->insert_elem_db('Salvati (Utente, Quiz)', '(' . $user . ', ' . $quiz . ')');        // aggiungo a tabella salvati
                        break;
                    case "-1":
                        $n_likes--;
                        $connection->delete_elem_db('Salvati', 'Utente=' . $user . ' AND Quiz=' . $quiz);           // elimino da tabella salvati
                        break;
                    default:
                        echo "Operazione invalida";
                        break;
                }
                $connection->execute_mod_DB('Quiz', 'ID='.$quiz, 'Num_Like', $n_likes);    //eseguo modifica nel db dei likes   
            }
            // Se utente non loggato 
            else{
                $n_likes = -1;
            }
        }

        // Ritorno numero di likes
        echo $n_likes;
    }

    $connection->close_connection();
?>
