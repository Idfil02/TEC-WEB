<?php

    require_once "../strumenti_condivisi/connessione.php";

    $error = 'Si è verificato un errore nella connessione al database. Ci scusiamo per il disagio. Riprovare più tardi o contattare l\'amministratore se il problema persiste.';
    $connection = new AccessDB;

    if ($connection->open_connection()) {
        $quiz = $_GET['quizID'];

        // Cerco numero di like
        $query_res = $connection->execute_query("SELECT Num_Like FROM Quiz WHERE ID='" . $quiz . "'"); 
        if(!is_array($query_res)){
            echo $error;
        }
        else {
            $n_likes = $query_res[0]['Num_Like'];

            // Eventuali modifiche al numero di likes
            if(isset($_GET['action'])){
                $err_found="";
                session_start();
                // Se utente loggato
                if(isset($_SESSION['user_id'])) {
                    $user = $_SESSION['user_id'];
                    // Controllo tipo di modifica da svolgere
                    switch ($_GET['action']) {
                        case "+1":
                            $n_likes++;
                            $mod_res = $connection->execute_mod_query('INSERT INTO Salvati (Utente, Quiz) VALUES (' . $user . ', ' . $quiz . ')');       // aggiungo a tabella salvati
                            break;
                        case "-1":
                            $n_likes--;
                            $mod_res = $connection->execute_mod_query('DELETE FROM Salvati WHERE Utente=' . $user . ' AND Quiz=' . $quiz);     // elimino da tabella salvati      
                            break;
                        default:
                            echo "Operazione invalida";
                            break;
                    }
                    if ($mod_res == '1') {
                        $mod_res .= $connection->execute_mod_query("UPDATE Quiz SET Num_Like=" . $n_likes . " WHERE ID=" . $quiz);      //eseguo modifica nel db dei likes  
                    }                
                }
                // Se utente non loggato 
                else{
                    $n_likes = -1;
                }
            }
            if($mod_res != '11') {        // entrambe le mod_query sopra devono ritornare true (=1)
                echo $error;
            }
            else {
                // Ritorno numero di likes
                echo $n_likes;
            }
        }
        $connection->close_connection();
    }
    else {
        echo $error;
    }

?>
