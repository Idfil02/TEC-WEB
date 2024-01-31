<?php
require_once "../strumenti_condivisi/connessione.php";

$response = "";

if (isset($_POST['suggestion'])) {
    $suggestion = $_POST['suggestion'];

    $connection = new AccessDB;

    if ($connection->open_connection()) {
        // Sanitize the text
        $suggestion = htmlspecialchars($suggestion, ENT_QUOTES, 'UTF-8');
        
        session_start();
        $user = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : -1;

        try {
            // Use a parameterized query to prevent SQL injection
            $connection->execute_mod_query("INSERT INTO suggerimenti (Utente, Testo) VALUES (?, ?)", [$user, $suggestion]);

            $response= "Suggerimento inviato con successo.";
        } 
        catch (Exception $e) {
            // Log the SQL error for debugging
            error_log("SQL Error: " . $e->getMessage());

            $response = "Invio del messaggio fallito. Riprova più tardi.";
        }

        $connection->close_connection();
    } 
    else {
        $response = "Invio del messaggio fallito. Riprova più tardi.";
    }
} 
else {
    $response = "Inserire un suggerimento valido.";
}

echo ($response);
?>
