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
        $user = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : -1;

        try {
            // Use a parameterized query to prevent SQL injection
            $query = 'INSERT INTO Suggerimenti (Utente, Testo) VALUES (:user, :suggestion)';
            $params = array(':user' => $user, ':suggestion' => $suggestion);
            
            $connection->execute_mod_query($query, $params);

            $response['success'] = true;
            $response['message'] = "Suggerimento inviato con successo.";
        } catch (PDOException $e) {
            // Log the SQL error for debugging
            error_log("SQL Error: " . $e->getMessage());

            $response['success'] = false;
            $response['message'] = "Invio del messaggio fallito. Riprova più tardi.";
        }

        $connection->close_connection();
    } else {
        $response['success'] = false;
        $response['message'] = "Invio del messaggio fallito. Riprova più tardi.";
    }
} else {
    $response['success'] = false;
    $response['message'] = "Inserire un suggerimento valido.";
}

header('Content-Type: application/json');
echo json_encode($response);
?>
