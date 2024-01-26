<?php 
    require_once "strumenti_condivisi/strumenti.php";      

    $template = file_get_contents('layout_condivisi/template_layout.html');         
    $main_content = file_get_contents('layout_pagine/signup.html');        

    $title = "Registrati su QuackWiz";        
    $pageID = "Signup";           
    $keywords = "signup,account,profilo,utente";        
    $description = "Crea un nuovo account su QuackWiz con la tua mail. Potrai salvare tutti i tuoi quiz preferiti.";      

    $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
    echo $page;         //mostra la pagina creata

?>