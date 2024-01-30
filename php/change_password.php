<?php
require_once "../strumenti_condivisi/connessione.php";

session_start();

$response = array();

if (
    isset($_SESSION['user_id']) &&
    isset($_POST['old-password']) &&
    isset($_POST['new-password'])
) {
    $oldPassword = htmlspecialchars(trim($_POST['old-password']));
    $newPassword = htmlspecialchars(trim($_POST['new-password']));

    if (strlen($newPassword) < 4) {
        $response['success'] = false;
        $response['message'] = "Password invalida. Si prega di fornire password con almeno 4 caratteri.";
    } else {
        $connection = new AccessDB;

        if ($connection->open_connection()) {
            // Use prepared statement to retrieve the current hashed password
            $stmt = $connection->get_connection()->prepare("SELECT Password FROM Utenti WHERE ID = ?");
            $stmt->bind_param("i", $_SESSION['user_id']);
            
            if($stmt->execute()) {
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
                    if($stmt->execute()) {
                        $response['success'] = true;
                        $response['message'] = "Password cambiata con successo!";
                    }
                    else {
                        $response['success'] = false;
                        $response['message'] = "Si è verificato un errore nell'aggiornamento della password.";
                    }

                } else {
                    $response['success'] = false;
                    $response['message'] = "Vecchia password invalida.";
                }
            }
            else {
                $response['success'] = false;
                $response['message'] = "Si è verificato un errore nell'aggiornamento della password.";
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
