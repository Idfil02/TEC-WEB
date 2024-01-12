<?php

    require_once "../strumenti_condivisi/connessione.php";

    $connection = new AccessDB;

    if ($connection->open_connection()) {
        $query_result = $connection->execute_query("SELECT * FROM Domande WHERE Quiz='" . $_GET['quizID'] . "'");  
        
        echo json_encode($query_result);
    }

    $connection->close_connection();

?>
