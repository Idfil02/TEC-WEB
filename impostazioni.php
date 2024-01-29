<?php 
    require_once "strumenti_condivisi/strumenti.php";

    $template = file_get_contents('layout_condivisi/template_layout.html');
    $main_content = file_get_contents('layout_pagine/impostazioni.html');

    $title = "Impostazioni profilo QuackWiz";         //titolo della pagina
    $pageID = "impostazioni";           //id della pagina
    $keywords = "impostazioni,modfica,profilo,utente";        //parole chiave per SEO
    $description = "Questa è la pagina delle impostazioni di QuackWiz qui puoi cambiare username e password. Puoi anche decidere di uscire dal profilo o cancellarlo permanentemente.";      //breve descrizione della pagina

    $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
    echo $page;         //mostra la pagina creata
?>