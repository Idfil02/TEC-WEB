<?php 
    require_once "strumenti_condivisi/strumenti.php";      

    $template = file_get_contents('layout_condivisi/template_layout.html');         
    $main_content = file_get_contents('layout_pagine/signup.html');        

    $title = "Signup";        
    $pageID = "Signup";           
    $keywords = "signup,account,profilo,utente";        
    $description = "Questa è la pagina per registarsi al sito";      

    $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
    echo $page;         //mostra la pagina creata

?>