<?php 
    require_once "./strumenti_condivisi/strumenti.php";

    $template = file_get_contents('layout_condivisi/template_layout.html');
    $main_content = file_get_contents('layout_pagine/pagina_quiz.html');

    $title = "quiz";         //titolo della pagina          /* serve connessione a db perchè voglio aggiungere nome quiz prima del quiz nel titolo */
    $pageID = "QuizPage";           //id della pagina
    $keywords = "quiz, gioco, cultura, divertimento, apprendimento";        //parole chiave per SEO
    $description = "? Testa la tua conoscenza divertendoti con questo quiz.";      //breve descrizione della pagina             /* serve connessione a db perchè voglio aggiungere nome quiz prima del resto*/

    $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
    echo $page;         //mostra la pagina creata
?>
