<?php
require_once "strumenti_condivisi/connessione.php";

session_start();

// Validate and sanitize the new-name input
if (isset($_SESSION['user_id']) && isset($_POST['new-name'])) {
    $newUsername = $_POST['new-name'];

    // Validate the username
    if (empty($newUsername) || strlen($newUsername) < 3 || strlen($newUsername) > 20) {
        echo "Invalid username. Please provide a username between 3 and 20 characters.";
        exit();
    }

    // Sanitize the username
    $newUsername = htmlspecialchars($newUsername, ENT_QUOTES, 'UTF-8');

    $connection = new AccessDB;

    if ($connection->open_connection()) {
        // Use prepared statement to update the username in the database
        $stmt = $connection->get_connection()->prepare("UPDATE Utenti SET Username = ? WHERE ID = ?");
        $stmt->bind_param("si", $newUsername, $_SESSION['user_id']);

        // Execute the statement
        if ($stmt->execute()) {
            echo "Username changed successfully!";
        } else {
            echo "Error updating username: " . $stmt->error;
        }

        // Close the statement
        $stmt->close();
        $connection->close_connection();
    } else {
        echo "Error connecting to the database.";
    }
} else {
    echo "Invalid request.";
}
?>
