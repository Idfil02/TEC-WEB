<?php 
    require_once "strumenti_condivisi/strumenti.php";       //vedete il vostro path

 /* test da implementare con login */
    session_start();
    $_SESSION['user_id'] = 0;

    $template = file_get_contents('layout_condivisi/template_layout.html');
    $main_content = file_get_contents('impostazioni.html');

    $title = "Impostazioni";         //titolo della pagina
    $pageID = "Impostazioni";           //id della pagina
    $keywords = "impostazioni,modfica,profilo,utente";        //parole chiave per SEO
    $description = "Questa è la pagina delle impostazioni qui puoi cambiare username e password";      //breve descrizione della pagina

    $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
    echo $page;         //mostra la pagina creata
?>