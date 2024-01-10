<?php 
    require_once "strumenti.php";       //vedete il vostro path

    $template = file_get_contents('template_layout.html');          //vedete il vostro path
    $main_content = file_get_contents('login.html');        // modificare con il path della propria pagina in html

    $title = "QuackWiz";         //modificare con il proprio titolo della pagina
    $pageID = "Login";           //modificare con l'id della pagina (è praticamente l'id del body)
    $keywords = "login";        //modificare con delle parole chiave per SEO
    $description = "login all'account";      //modificare con una breve descrizione della pagina

    $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
    echo $page;         //mostra la pagina creata
?>