<?php

    require_once "../strumenti_condivisi/connessione.php";

    $error = 'Ops! Qualcosa è andato storto. Al momento non siamo in grado di connetterci al server del quiz. Riprova più tardi. Se il problema persiste, contatta il supporto.';
    $connection = new AccessDB;

    if ($connection->open_connection()) {
        $query_result = $connection->execute_query("SELECT * FROM Domande WHERE Quiz='" . $_GET['quizID'] . "'");  
        
        if(is_array($query_result)) {
            echo json_encode($query_result);
        } 
        else{
            echo $error;
        }

        $connection->close_connection();
    }
    else {
        echo $error;
    }

?>
