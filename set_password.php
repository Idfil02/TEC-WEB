<?php
require_once "strumenti_condivisi/connessione.php";

session_start();

$response = array();

if (
    isset($_SESSION['user_id']) &&
    isset($_POST['old-password']) &&
    isset($_POST['new-password'])
) {
    $oldPassword = filter_var($_POST['old-password'], FILTER_SANITIZE_STRING);
    $newPassword = filter_var($_POST['new-password'], FILTER_SANITIZE_STRING);

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

            $response['success'] = true;
            $response['message'] = "Password changed successfully!";
        } else {
            $response['success'] = false;
            $response['message'] = "Incorrect old password.";
        }

        // Close the statement
        $stmt->close();
        $connection->close_connection();
    } else {
        $response['success'] = false;
        $response['message'] = "Error connecting to the database.";
    }
} else {
    $response['success'] = false;
    $response['message'] = "Invalid request.";
}

// Return the JSON response
header('Content-Type: application/json');
echo json_encode($response);
?>
