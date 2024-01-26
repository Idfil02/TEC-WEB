<?php

    require_once "../strumenti_condivisi/connessione.php";

    $error = 'Ops! Qualcosa è andato storto. Al momento non siamo in grado di connetterci al server del quiz. Riprova più tardi. Se il problema persiste, contatta il supporto.';
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
                session_start();
                // Se utente loggato
                if(isset($_SESSION['user_id'])) {
                    $user = $_SESSION['user_id'];
                    // Controllo tipo di modifica da svolgere
                    switch ($_GET['action']) {
                        case "+1":
                            if($connection->execute_mod_query('INSERT INTO Salvati (Utente, Quiz) VALUES (' . $user . ', ' . $quiz . ')')){       // aggiungo a tabella salvati
                                $n_likes++;
                            }
                            break;
                        case "-1":
                            if($connection->execute_mod_query('DELETE FROM Salvati WHERE Utente=' . $user . ' AND Quiz=' . $quiz)){       // elimino da tabella salvati
                                $n_likes--;
                            }
                            break;
                        default:
                            echo "Operazione invalida";
                            break;
                    }
                    if($connection->execute_mod_query("UPDATE Quiz SET Num_Like=(SELECT COUNT(*) FROM Salvati WHERE Salvati.Quiz = Quiz.ID) WHERE ID=" . $quiz)){
                        echo $n_likes;
                    }
                    else{
                        echo $error;
                    }
                }
                // Se utente non loggato 
                else{
                    echo "-1";
                }
            }
            // Se no modifiche
            else {
                echo $n_likes;
            }
        }
        $connection->close_connection();
    }
    else {
        echo $error;
    }

?>
