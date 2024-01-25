<?php 
    require_once "strumenti_condivisi/strumenti.php";


    // DA RIFARE COPIATA PER VEDERE SE FUNZIONA

    if(isset($_GET['search'])){
        $search_string = $_GET['search'];
    }
    
    $template = file_get_contents('layout_condivisi/template_layout.html');
    $main_content = file_get_contents('layout_pagine/pagina_di_ricerca.html');

    $title = "QuackWiz cerca: " . $search_string;         //titolo della pagina
    $pageID = "pagina-ricerca";           //id della pagina
    $keywords = "quiz, gioco, cultura, divertimento, apprendimento";        //parole chiave per SEO
    $description = "Gioca a questi fantastici quiz online gratuiti. C'è un quiz divertente praticamente per ogni argomento!";      //breve descrizione della pagina

    $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
    echo $page;         //mostra la pagina creata
?>
