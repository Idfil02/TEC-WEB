<?php 

    require_once "strumenti_condivisi/strumenti.php"       //vedete il vostro path

 

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Riceve i dati del modulo
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Sanitizzazione dell'username (esempio: rimuovere spazi extra)
    $sanitizedUsername = trim($username);

    // Connessione al database
    try {
        $db = new PDO('mysql:host=localhost;dbname=QuackwizDB', 'username', 'password');
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
        die("Errore di connessione al database: " . $e->getMessage());
    }

    // verifica delle credenziali
    $stmt = $db->prepare("SELECT * FROM users WHERE username = ?");
    $stmt->execute([$sanitizedUsername]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user['password'])) {
    
        echo "Login riuscito!";
    } else {
    
        echo "Username o password non valide";
    }
}

    $template = file_get_contents('template_layout.html');          
    $main_content = file_get_contents('login.html');        

    $title = "Login";        
    $pageID = "Login";           
    $keywords = "login,profilo,utente,account";        
    $description = "Questa è la pagina per effettuare il login al sito";    

    $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
    echo $page;    

    
?>