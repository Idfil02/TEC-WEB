<?php 
    require_once "./strumenti_condivisi/strumenti.php";

    $template = file_get_contents('layout_condivisi/template_layout.html');
    $main_content = file_get_contents('layout_pagine/index.html');

    $title = "QuackWiz";         //titolo della pagina
    $pageID = "Home";           //id della pagina
    $keywords = "xd";        //parole chiave per SEO
    $description = "lmao";      //breve descrizione della pagina

    $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
    echo $page;         //mostra la pagina creata
?>
