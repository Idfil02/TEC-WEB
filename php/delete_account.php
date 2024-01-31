<?php
require_once "../strumenti_condivisi/connessione.php";

session_start();

$response = array();

if (
    isset($_POST['username']) &&
    isset($_POST['password'])
) {
    $username = htmlspecialchars(trim($_POST['username']), ENT_QUOTES, 'UTF-8');
    $password = htmlspecialchars(trim($_POST['password']), ENT_QUOTES, 'UTF-8');

    $connection = new AccessDB;

    if ($connection->open_connection()) {
        // Use prepared statement to retrieve the user ID and hashed password
        $stmt = $connection->get_connection()->prepare("SELECT ID, Password FROM utenti WHERE Username = ?");
        $stmt->bind_param("s", $username);
        
        if($stmt->execute()) {
            $result = $stmt->get_result();

            // Fetch the user ID and hashed password
            $row = $result->fetch_assoc();
            $userID = $row['ID'];
            $hashedPassword = $row['Password'];

            // Verify the password
            if (password_verify($password, $hashedPassword)) {
                // Use prepared statement to delete the user from the database
                $stmt = $connection->get_connection()->prepare("DELETE FROM utenti WHERE ID = ?");
                $stmt->bind_param("i", $userID);
                
                if($stmt->execute()) {
                    $response['success'] = true;
                    $response['message'] = "Account eliminato correttamente!";
                    unset($_SESSION['user_id']);
                }
                else {
                    $response['success'] = false;
                    $response['message'] = "Si è verificato un errore nell'eliminazione dell'account.";
                }
            } else {
                $response['success'] = false;
                $response['message'] = "Credenziali errate. Account non eliminato.";
            }
        }
        else {
            $response['success'] = false;
            $response['message'] = "Si è verificato un errore nell'eliminazione dell'account.";
        }
        // Close the statement
        $stmt->close();
        $connection->close_connection();
    } else {
        $response['success'] = false;
        $response['message'] = "Errore di connessione al database";
    }
} else {
    $response['success'] = false;
    $response['message'] = "Richiesta invalida. Controllare di aver inserito tutti i dati. Account non eliminato.";
}

// Return the JSON response
header('Content-Type: application/json');
echo json_encode($response);
?>
