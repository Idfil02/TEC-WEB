<?php
require_once "../TEC-WEB/strumenti_condivisi/connessione.php";

session_start();

$response = array();

if (isset($_SESSION['user_id']) && isset($_POST['new-name'])) {
    $newUsername = htmlspecialchars(trim($_POST['new-name']), ENT_QUOTES, 'UTF-8');

    // Validate the username
    if (empty($newUsername) || strlen($newUsername) < 3 || strlen($newUsername) > 20) {
        $response['success'] = false;
        $response['message'] = "Username non valido. L'username deve contenere tra i 3 e i 20 caratteri";
    } else {
        $connection = new AccessDB;

        if ($connection->open_connection()) {
            // Use prepared statement to update the username in the database
            $stmt = $connection->getConnection()->prepare("UPDATE Utenti SET Username = ? WHERE ID = ?");
            $stmt->bind_param("si", $newUsername, $_SESSION['user_id']);

            // Execute the statement
            if ($stmt->execute()) {
                $response['success'] = true;
                $response['message'] = "Username cambiato correttamente";
            } else {
                $response['success'] = false;
                $response['message'] = "Errore nel cambiamento dell'username: " . $stmt->error;
            }

            // Close the statement
            $stmt->close();
            $connection->close_connection();
        } else {
            $response['success'] = false;
            $response['message'] = "Errore di connesione al database.";
        }
    }
} else {
    $response['success'] = false;
    $response['message'] = "Richiesta non valida";
}

// Return the JSON response
header('Content-Type: application/json');
echo json_encode($response);
?>
