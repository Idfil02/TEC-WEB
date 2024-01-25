<?php 
    require_once "strumenti_condivisi/strumenti.php";      

    $template = file_get_contents('template_layout.html')         
    $main_content = file_get_contents('signup.html');        

    $title = "Signup";        
    $pageID = "Signup";           
    $keywords = "signup,account,profilo,utente";        
    $description = "Questa è la pagina per registarsi al sito";      

    
$form = '
<form action="registrazione.php" method="post">
    <label for="email">Email</label>
    <input type="email" id="email" name="email" placeholder="email" required>

    <label for="username">Username</label>
    <input type="text" id="username" name="username" placeholder="username" required>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" placeholder="password" required>

    <button type="submit">Signup</button>
</form>
';

    $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
    echo $page;         //mostra la pagina creata

?>