<?php
require_once "strumenti_condivisi/connessione.php";

session_start();

if (isset($_SESSION['user_id']) && isset($_POST['old-password']) && isset($_POST['new-password'])) {
    $oldPassword = $_POST['old-password'];
    $newPassword = $_POST['new-password'];

    $connection = new AccessDB;

    if ($connection->open_connection()) {
        // Use prepared statement to retrieve the current hashed password
        $stmt = $connection->get_connection()->prepare("SELECT Password FROM Utenti WHERE ID = ?");
        $stmt->bind_param("i", $_SESSION['user_id']);
        $stmt->execute();
        $result = $stmt->get_result();
        
        // Fetch the current hashed password
        $row = $result->fetch_assoc();
        $currentPasswordHash = $row['Password'];

        // Verify the old password
        if (password_verify($oldPassword, $currentPasswordHash)) {
            // Hash the new password before storing it in the database
            $newPasswordHash = password_hash($newPassword, PASSWORD_DEFAULT);

            // Use prepared statement to update the password in the database
            $stmt = $connection->get_connection()->prepare("UPDATE Utenti SET Password = ? WHERE ID = ?");
            $stmt->bind_param("si", $newPasswordHash, $_SESSION['user_id']);
            $stmt->execute();

            echo "Password changed successfully!";
        } else {
            echo "Incorrect old password.";
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

