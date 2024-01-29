<?php
require_once "strumenti_condivisi/connessione.php";

session_start();

$response = array();

if (isset($_SESSION['user_id']) && isset($_POST['new-name'])) {
    $newUsername = htmlspecialchars(trim($_POST['new-name']));

    // Validate the username
    if (empty($newUsername) || strlen($newUsername) < 3 || strlen($newUsername) > 20) {
        $response['success'] = false;
        $response['message'] = "Invalid username. Please provide a username between 3 and 20 characters.";
    } else {
        $connection = new AccessDB;

        if ($connection->open_connection()) {
            // Use prepared statement to update the username in the database
            $stmt = $connection->get_connection()->prepare("UPDATE Utenti SET Username = ? WHERE ID = ?");
            $stmt->bind_param("si", $newUsername, $_SESSION['user_id']);

            // Execute the statement
            if ($stmt->execute()) {
                $response['success'] = true;
                $response['message'] = "Username changed successfully!";
            } else {
                $response['success'] = false;
                $response['message'] = "Error updating username: " . $stmt->error;
            }

            // Close the statement
            $stmt->close();
            $connection->close_connection();
        } else {
            $response['success'] = false;
            $response['message'] = "Error connecting to the database.";
        }
    }
} else {
    $response['success'] = false;
    $response['message'] = "Invalid request.";
}

// Return the JSON response
header('Content-Type: application/json');
echo json_encode($response);
?>
