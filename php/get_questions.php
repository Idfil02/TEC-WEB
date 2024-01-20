<?php

    require_once "../strumenti_condivisi/connessione.php";

    $error = 'Si è verificato un errore nella connessione al database. Ci scusiamo per il disagio. Riprovare più tardi o contattare l\'amministratore se il problema persiste.';
    $connection = new AccessDB;

    if ($connection->open_connection()) {
        $query_result = $connection->execute_query("SsELECT * FROM Domande WHERE Quiz='" . $_GET['quizID'] . "'");  
        
        if(is_array($query_result)) {
            echo json_encode($query_result);
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
