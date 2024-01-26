<?php
require_once "../strumenti_condivisi/strumenti.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Sanitizzazione dell'username e password
    $username = trim($username);
    $username = htmlspecialchars($username, ENT_QUOTES, 'UTF-8');
    $password = trim($password);
    $password = htmlspecialchars($password, ENT_QUOTES, 'UTF-8');

    // Caso registrazione
    if(isset($_POST["email"])){
        // Controllo mail
        $email = $_POST["email"];
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            die("Email non valida");
        }

        // Hashing della password prima di salvarla nel database
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Connessione al database
        try {
            $db = new PDO('mysql:host=127.0.0.1;dbname=QuackWiz_db', 'jessica', 'jessica'); // da modificare locahost per il database
            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Errore di connessione al database: " . $e->getMessage());
        }

        // Verifica se username esiste già nel database
        $stmt = $db->prepare("SELECT * FROM Utenti WHERE Username = ?");
        $stmt->execute([$username]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($user) {
            die("Username già in uso.");
        }

        // Salva l'utente nel database
        $stmt_n_id = $db->prepare("SELECT COUNT(*) FROM Utenti");
        $stmt_n_id->execute();
        $ID = $stmt_n_id->fetch()[0];
        $stmt = $db->prepare("INSERT INTO Utenti (ID, Email, Username, password) VALUES (?, ?, ?, ?)");
        $stmt->execute([$ID, $email, $username, $hashedPassword]);
        
        echo "Registrazione completata con successo!";

        // Memorizzo ID
        saveID($ID);
        setcookie('user_id', $ID, 0, "/");
    } 

    // Caso login
    else {       
        // Connessione al database
        try {
            $db = new PDO('mysql:host=127.0.0.1;dbname=QuackWiz_db', 'jessica', 'jessica');
            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            die("Errore di connessione al database: " . $e->getMessage());
        }
        
        // verifica delle credenziali
        $stmt = $db->prepare("SELECT * FROM Utenti WHERE Username = ?");
        $stmt->execute([$username]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($user && password_verify($password, $user['Password'])) {
            echo "Login riuscito!";
            // Memorizzo ID
            saveID($user['ID']);

            //Torno alla home
            header('location: ../index.php'); 
            exit();
        } 
        else {
            echo "Username o password non valide";
        }
    }
}

function saveID($id) {
    session_start();
    $_SESSION['user_id'] = $id;
}

?>
