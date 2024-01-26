<?php
require_once "../strumenti_condivisi/connessione.php";

$response = array();

if (isset($_POST['suggestion'])) {
    $suggestion = $_POST['suggestion'];

    $connection = new AccessDB;

    if ($connection->open_connection()) {
        // Sanitize the text
        $suggestion = htmlspecialchars($suggestion, ENT_QUOTES, 'UTF-8');
        
        session_start();
        if(isset($_SESSION['user_id'])){
            $user = $_SESSION['user_id'];
        }
        else {
            $user = -1;     // utente non autenticato salvato come anonimo
        }
        $query_res = $connection->execute_mod_query('INSERT INTO Suggerimenti (Utente, Testo) VALUES (' . $user . ', "' . $suggestion . '")');
        if($query_res!=1) {
            $response['success'] = false;
            $response['message'] = "Invio del messaggio fallito. Riprova più tardi.";
        }
        else {
            $response['success'] = true;
            $response['message'] = "Suggerimento inviato con successo.";
        }

        $connection->close_connection();
    } 
    else {
        $response['success'] = false;
        $response['message'] = "Invio del messaggio fallito. Riprova più tardi.";
    }
} 
else {
    $response['success'] = false;
    $response['message'] = "Inserire un suggerimento valido.";
}


header('Content-Type: application/json');
echo json_encode($response);

?>