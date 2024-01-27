<?php
require_once "../strumenti_condivisi/strumenti.php";
require_once "../strumenti_condivisi/connessione.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Sanitizzazione dell'username e password
    $username = trim($username);
    $username = htmlspecialchars($username, ENT_QUOTES, 'UTF-8');
    $password = trim($password);
    $password = htmlspecialchars($password, ENT_QUOTES, 'UTF-8');

    // Connessione al database
    $dbConnection = new AccessDB();
    $dbConnected = $dbConnection->open_connection();

    if (!$dbConnected) {
        echo "<script>showToast('Errore di connessione al database', 'error');</script>";
        die("Errore di connessione al database");
    }

    // Caso registrazione
    if (isset($_POST["email"])) {
        $email = $_POST["email"];

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            echo "<script>showToast('Email non valida', 'error');</script>";
            die("Email non valida");
        }

        // Hashing della password prima di salvarla nel database
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Verifica se username esiste già nel database
        $existingUser = $dbConnection->execute_query("SELECT * FROM Utenti WHERE Username = ?", [$username]);

        if ($existingUser) {
            echo "<script>showToast('Username già in uso.', 'error');</script>";
            die("Username già in uso.");
        }

        // Salva l'utente nel database
        $dbConnection->execute_mod_query("INSERT INTO Utenti (Email, Username, password) VALUES (?, ?, ?)", [$email, $username, $hashedPassword]);

        // Ottieni l'ID appena inserito
        $ID = $dbConnection->getConnection()->insert_id;  // Access the insert_id property of the MySQLi connection

        echo "<script>showToast('Registrazione completata con successo!', 'success');</script>";

        // Memorizzo ID
        saveID($ID);

        // Torno alla home
        echo "<script>window.location.href='../index.php';</script>";
        exit();
    } 
    // Caso login
    else {       
        // verifica delle credenziali
        $user = $dbConnection->execute_query("SELECT * FROM Utenti WHERE Username = ?", [$username]);

        if ($user && password_verify($password, $user[0]['Password'])) {
            echo "<script>showToast('Login riuscito!', 'success');</script>";
            // Memorizzo ID
            saveID($user[0]['ID']);

            // Torno alla home
            echo "<script>window.location.href='../index.php';</script>";
            exit();
        } 
        else {
            echo "<script>showToast('Username o password non valide', 'error');</script>";
            echo "Username o password non valide";
        }
    }

    // Chiudi la connessione al database
    $dbConnection->close_connection();
}

function saveID($id) {
    session_start();
    $_SESSION['user_id'] = $id;
}
?>
