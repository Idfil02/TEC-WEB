<?php
require_once "../TEC-WEB/strumenti_condivisi/connessione.php";

session_start();

$response = array();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (
        isset($_POST['username']) &&
        isset($_POST['password'])
    ) {
        $username = htmlspecialchars(trim($_POST['username']), ENT_QUOTES, 'UTF-8');
        $password = htmlspecialchars(trim($_POST['password']), ENT_QUOTES, 'UTF-8');

        $connection = new AccessDB;

        if ($connection->open_connection()) {
            try {
                // Use prepared statement to retrieve the user ID and hashed password
                $stmt = $connection->getConnection()->prepare("SELECT ID, Password FROM Utenti WHERE Username = ?");
                $stmt->bind_param("s", $username);
                $stmt->execute();
                $result = $stmt->get_result();

                // Fetch the user ID and hashed password
                $row = $result->fetch_assoc();
                $userID = $row['ID'];
                $hashedPassword = $row['Password'];

                // Verify the password
                if (password_verify($password, $hashedPassword)) {
                    // Use prepared statement to delete the user from the database
                    $stmt = $connection->getConnection()->prepare("DELETE FROM Utenti WHERE ID = ?");
                    $stmt->bind_param("i", $userID);
                    $stmt->execute();

                    // Perform additional cleanup tasks if needed

                    $response['success'] = true;
                    $response['message'] = "Account eliminato correttamente!";

                    // Redirect the user to index.php
                    header("Location: index.php");
                    exit();
                } else {
                    $response['success'] = false;
                    $response['message'] = "Credenziali errate. Account non eliminato.";
                }
            } catch (Exception $e) {
                $response['success'] = false;
                $response['message'] = "Errore nell'esecuzione della query: " . $e->getMessage();
            } finally {
                // Close the statement
                $stmt->close();
                $connection->close_connection();
            }
        } else {
            $response['success'] = false;
            $response['message'] = "Errore di connessione al database";
        }
    } else {
        $response['success'] = false;
        $response['message'] = "Dati mancanti. Account non eliminato.";
    }
} else {
    $response['success'] = false;
    $response['message'] = "Richiesta non valida";
}

// Return the JSON response
header('Content-Type: application/json');
echo json_encode($response);
?>
