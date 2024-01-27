<?php 

require_once "strumenti_condivisi/strumenti.php";       //vedete il vostro path

$template = file_get_contents('layout_condivisi/template_layout.html');          
$main_content = file_get_contents('layout_pagine/login.html');        

$title = "Accedi a QuackWiz";        
$pageID = "login";           
$keywords = "login, accedi, profilo, utente, account";        
$description = "Accedi a QuackWiz e salva i tuoi quiz preferiti per averli sempre a portata di mano.";    

$page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
echo $page;    

    
?>