<?php 

require_once "strumenti_condivisi/strumenti.php";       //vedete il vostro path

$template = file_get_contents('layout_condivisi/template_layout.html');          
$main_content = file_get_contents('layout_pagine/login.html');        

$title = "Login";        
$pageID = "Login";           
$keywords = "login,profilo,utente,account";        
$description = "Questa è la pagina per effettuare il login al sito QuackWiz";    

$page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
echo $page;    

    
?>