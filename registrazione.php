<?php
require_once "strumenti_condivisi/strumenti.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Riceve i dati del modulo
    $email = $_POST["email"];
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Validazione dei dati (esempio: verifica se l'email è valida, ecc.)
    
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        // Email non valida
        die("Email non valida");
    }

    // Hashing della password prima di salvarla nel database
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    // Connessione al database
    try {
        $db = new PDO('mysql:host=localhost;dbname=QuackwizDB', 'username', 'password'); // da modificare locahost per il database
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        die("Errore di connessione al database: " . $e->getMessage());
    }

    // Verifica se l'email esiste già nel database
    $stmt = $db->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        // Email già registrata
        die("Questa email è già registrata");
    }

    // Salva l'utente nel database
    $stmt = $db->prepare("INSERT INTO users (email, username, password) VALUES (?, ?, ?)");
    $stmt->execute([$email, $username, $hashedPassword]);

    
    echo "Registrazione completata con successo!";
} else {

    die("Registrazione non riuscita");
}
?>
