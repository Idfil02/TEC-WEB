<?php

/***** Costruzione della pagina a partire dal template_layout *****/

function buildPage(String $page, String $content, String $title, String $id, String $keywords, String $description) {

    /* Header condiviso per tutte le pagine */
    $header = file_get_contents('layout_condivisi/header.html');
    $page  = str_replace('[header]',$header,$page);
    
    /* Specificità di ogni pagina */
    $page = str_replace('[title]',$title,$page);
    $page = str_replace('[keywords]',$keywords,$page);
    $page = str_replace('[description]',$description,$page);
    $page = str_replace('[pageID]',$id,$page);
    $page = str_replace('[content]',$content,$page);

    /* Footer condiviso per tutte le pagine */
    $footer = file_get_contents('layout_condivisi/footer.html');
    $page = str_replace('[footer]',$footer,$page);

    return $page;
}

function buildErrorPage($page, $error) {
    $main_content = file_get_contents('layout_pagine/' . $error . '.html');
    $title = 'ERRORE ' . $error;
    $id = 'page'.$error;
    switch ($error) {
        case '404':
            $keywords = 'Errore 404, 404, Errore, Pagina non trovata, Pagina inesistente';
            $description = 'La pagina specificata non è stata trovata oppure non è disponibile.';
            break;
        case '500':
            $keywords = 'Errore 505, 500, Errore, Errore nel server';
            $description = 'Si è verificato un errore nel server.';
            break;
        default:
            $keywords = 'Errore';
            $description = 'Si è verificato un errore.';
    }
    $page = buildPage($page, $main_content, $title, $id, $keywords, $description);
    return $page;
}

?>