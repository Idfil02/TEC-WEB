<?php 
    require_once "strumenti_condivisi/strumenti.php";
    require_once "strumenti_condivisi/connessione.php";
    
    $template = file_get_contents('layout_condivisi/template_layout.html');
    $main_content = file_get_contents('layout_pagine/pagina_di_ricerca.html');

    $search = $_GET['search'];
    $connection = new AccessDB;

    if ($connection->open_connection()) {

        $searchResults = $connection->execute_query("SELECT * FROM quiz WHERE Nome LIKE '%$search%' OR Descrizione LIKE '%$search%' OR Categoria LIKE '%$search%'");  
        $connection->close_connection();

        if(!is_string($searchResults)){
            $title = "QuackWiz cerca: " . $search;         //titolo della pagina
            $pageID = "pagina_di_ricerca";           //id della pagina
            $keywords = "quiz, gioco, cerca";        //parole chiave per SEO
            $description = "Trova il quiz che cerchi oppure consigliacene uno da inserire tra il nostro catalogo.";      //breve descrizione della pagina
    
            $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
            $page = buildSearch($page, $searchResults);
        }
        else {
            $page = buildErrorPage($template, "500");
        }   
    }
    else {
        $page = buildErrorPage($template, "500");
    }

    echo $page;         //mostra la pagina creata



    function buildSearch($html, $quizData) {
        $quiz_results = "";
        $quiz_container = file_get_contents('layout_pagine/quiz_header.html');

        if (sizeof($quizData) > 0) {
            foreach($quizData as $i => $quiz_i){
                // Creo box del quiz
                $quiz_i_box = str_replace('[quizID]', $quiz_i['ID'], $quiz_container);  
                $quiz_i_box = str_replace('[quiz-title]', "<a href='pagina_quiz.php?quizID=" . $quiz_i['ID'] . "'>" . $quiz_i['Nome'] . "</a>", $quiz_i_box); 
                $quiz_i_box = str_replace('[quiz-description]', $quiz_i['Descrizione'], $quiz_i_box);
                $quiz_i_box = str_replace('[quiz-time]', $quiz_i['Tempo']/60, $quiz_i_box);
                $quiz_i_box = str_replace('[quiz-category]', $quiz_i['Categoria'], $quiz_i_box); 
                $quiz_i_box = str_replace('[quiz-tot-played]', $quiz_i['Num_Giocate'], $quiz_i_box); 
                $quiz_i_box = str_replace('[quiz-tot-saved]', $quiz_i['Num_Like'], $quiz_i_box); 
                $quiz_i_box = str_replace('[quiz-img]', $quiz_i['Url_Immagine'], $quiz_i_box); 
                $quiz_results .= $quiz_i_box;
            }
        }
        else {
            $quiz_results = "<p> Nessun risultato per questa ricerca. Prova a cercare qualcosa di diverso </p>";
        }


        // Aggiungo le parti alla pagina di ricerca
        $html = str_replace('[tag-ricerca]', $_GET['search'], $html);
        $html = str_replace('[risultati-ricerca]', $quiz_results, $html);
        return $html;
    }
?>
