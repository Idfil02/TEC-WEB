<?php
require_once "../strumenti_condivisi/connessione.php";

session_start();

$response = array();

if (isset($_SESSION['user_id']) && isset($_POST['new-name'])) {
    $newUsername = htmlspecialchars(trim($_POST['new-name']));

    // Validate the username
    if (empty($newUsername) || strlen($newUsername) < 3 || strlen($newUsername) > 20) {
        $response['success'] = false;
        $response['message'] = "Username invalido. Si prega di fornire un username tra 3 e 20 caratteri.";
    } else {
        $connection = new AccessDB;

        if ($connection->open_connection()) {
            // Use prepared statement to update the username in the database
            $stmt = $connection->get_connection()->prepare("UPDATE Utenti SET Username = ? WHERE ID = ?");
            $stmt->bind_param("si", $newUsername, $_SESSION['user_id']);

            // Execute the statement
            if ($stmt->execute()) {
                $response['success'] = true;
                $response['message'] = "Username cambiato correttamente!";
            } else {
                $response['success'] = false;
                $response['message'] = "Si è verificato un errore nell'aggiornamento dell'username.";
            }

            // Close the statement
            $stmt->close();
            $connection->close_connection();
        } else {
            $response['success'] = false;
            $response['message'] = "Errore di connessione al database.";
        }
    }
} else {
    $response['success'] = false;
    $response['message'] = "Richiesta invalida.";
}

// Return the JSON response
header('Content-Type: application/json');
echo json_encode($response);
?>
