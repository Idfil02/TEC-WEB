<?php
require_once "../TEC-WEB/strumenti_condivisi/connessione.php";

session_start();

$response = array();

if (
    isset($_SESSION['user_id']) &&
    isset($_POST['old-password']) &&
    isset($_POST['new-password'])
) {
    $oldPassword = htmlspecialchars(trim($_POST['old-password']), ENT_QUOTES, 'UTF-8');
    $newPassword = htmlspecialchars(trim($_POST['new-password']), ENT_QUOTES, 'UTF-8');

    // Check if the new password meets the minimum length requirement
    if (strlen($newPassword) < 6) {
        $response['success'] = false;
        $response['message'] = "La password deve essere lunga almeno 6 caratteri";
    } else {
        $connection = new AccessDB;

        if ($connection->open_connection()) {
            // Use prepared statement to retrieve the current hashed password
            $stmt = $connection->getConnection()->prepare("SELECT Password FROM Utenti WHERE ID = ?");
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
                $stmt = $connection->getConnection()->prepare("UPDATE Utenti SET Password = ? WHERE ID = ?");
                $stmt->bind_param("si", $newPasswordHash, $_SESSION['user_id']);
                $stmt->execute();

                $response['success'] = true;
                $response['message'] = "Password cambiata correttamente!";
            } else {
                $response['success'] = false;
                $response['message'] = "Password errata";
            }

            // Close the statement
            $stmt->close();
            $connection->close_connection();
        } else {
            $response['success'] = false;
            $response['message'] = "Errore di connessione al database";
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