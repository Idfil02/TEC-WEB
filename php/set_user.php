<?php
require_once "../strumenti_condivisi/strumenti.php";
require_once "../strumenti_condivisi/connessione.php";

function saveID($id) {
    session_start();
    $_SESSION['user_id'] = $id;
}

$response = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Sanitizzazione dell'username e password
    $username = trim($username);
    $username = htmlspecialchars($username, ENT_QUOTES, 'UTF-8');
    $password = trim($password);
    $password = htmlspecialchars($password, ENT_QUOTES, 'UTF-8');

    if(strlen($username)<3 || strlen($username)>20){
        $response = "Username invalido. L'username deve contenere almeno 3 e al massimo 20 caratteri.";
    }
    else if (strlen($password) < 4){
        $response = "Password invalida. Si prega di fornire password con almeno 4 caratteri.";
    }
    else {
        // Connessione al database
        $dbConnection = new AccessDB();
        $dbConnected = $dbConnection->open_connection();

        if (!$dbConnected) {
            $response = "Errore di connessione al database.";
        }
        else {
            // Caso registrazione
            if (isset($_POST["email"]) and $_POST["email"]!="") {
                $email = $_POST["email"];

                if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    $response = "Email non valida";
                }
                else {
                    // Hashing della password prima di salvarla nel database
                    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

                    // Verifica se username esiste già nel database
                    $existingUser = $dbConnection->execute_query("SELECT * FROM utenti WHERE Username = ?", [$username]);

                    if (is_array($existingUser) and !empty($existingUser)) {
                        $response = "Username già in uso.";
                    }
                    else {
                        // Salva l'utente nel database
                        $query_res = $dbConnection->execute_mod_query("INSERT INTO utenti (Email, Username, password) VALUES (?, ?, ?)", [$email, $username, $hashedPassword]);
                        
                        if($query_res){
                            // Ottieni l'ID appena inserito
                            $ID = $dbConnection->get_connection()->insert_id;  // Access the insert_id property of the MySQLi connection
                            $response = "Registrazione completata con successo!";
                            saveID($ID);
                        }
                        else {
                            $response = "Si è verificato un problema con il server. Riprovare più tardi.";
                        }
                    }
                }
            } 
            // Caso login
            else {       
                // verifica delle credenziali
                $user = $dbConnection->execute_query("SELECT * FROM utenti WHERE Username = ?", [$username]);

                if (is_array($user) && !empty($user) && password_verify($password, $user[0]['Password'])) {
                    $response = "Login effettuato con successo!";
                    saveID($user[0]['ID']);
                } 
                else {
                    $response = "Username o password non valide.";
                }
            }
        }
        // Chiudi la connessione al database
        $dbConnection->close_connection();
    }
}
else {
    $response = "Operazione non riuscita. Si prega di riprovare più tardi.";
}
echo $response;

?>
