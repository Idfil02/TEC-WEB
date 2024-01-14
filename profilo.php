<?php 
    require_once "strumenti_condivisi/strumenti.php";

    /* test da implementare con login */
    session_start();
    $_SESSION['user_id'] = 0;

    /*quando logout faccio session_destroy() oppure unset($_SESSION['user_id'])*/
    
    $template = file_get_contents('layout_condivisi/template_layout.html');
    $main_content = file_get_contents('profilo.html');

    $title = "Profilo";         //titolo della pagina
    $pageID = "Profilo";           //id della pagina
    $keywords = "profilo,utente,impostazioni,modifica";        //parole chiave per SEO
    $description = "Questa è la pagina del tuo profilo da cui puoi controllare i tuoi quiz preferiti o cambiare le impostazionu come il nome e la password";      //breve descrizione della pagina

    $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
    echo $page;         //mostra la pagina creata
?>
