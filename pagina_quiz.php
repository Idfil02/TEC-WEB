<?php 
    /********************************************/  
    /*************** FILE ESTERNI ***************/
    /********************************************/
    require_once "strumenti_condivisi/strumenti.php";
    require_once "strumenti_condivisi/connessione.php";


    /********************************************/
    /************** FUNZIONI UTILI **************/
    /********************************************/
    function buildQuiz($html, $info) {
        $html = str_replace('[quizID]', $info['ID'], $html);  
        $html = str_replace('[quiz-title]', $info['Nome'], $html); 
        $html = str_replace('[quiz-description]', $info['Descrizione'], $html);
        $html = str_replace('[quiz-time]', $info['Tempo']/60, $html);
        $html = str_replace('[quiz-category]', $info['Categoria'], $html); 
        $html = str_replace('[quiz-tot-played]', $info['Num_Giocate'], $html); 
        $html = str_replace('[quiz-tot-saved]', $info['Num_Like'], $html); 
        $html = str_replace('[quiz-tot-questions]', $info['Num_Domande'], $html); 
        $html = str_replace('[quiz-img]', $info['Url_Immagine'], $html); 
        return $html;
    }

    /*********************************************/
    /***** CREAZIONE PAGINA PHP/HTML DEL QUIZ ****/
    /*********************************************/
    $template = file_get_contents('layout_condivisi/template_layout.html');
    $main_content = file_get_contents('layout_pagine/pagina_quiz.html');

    $connection = new AccessDB;
   
    if(isset($_GET['quizID'])){
        if ($connection->open_connection()) {
            $quizInfo = $connection->execute_query("SELECT * FROM Quiz WHERE ID='". $_GET['quizID'] ."'");  
            $connection->close_connection();
    
            // Quiz selezionato esiste
            if(isset($quizInfo[0])){
                $quizInfo = $quizInfo[0];
                $title = $quizInfo['Nome'] . " quiz";         //titolo della pagina      
                $pageID = "QuizPage";           //id della pagina
                $keywords = "quiz, gioco, cultura, divertimento, apprendimento";        //parole chiave per SEO
                $description = $quizInfo['Nome'] . "Testa la tua conoscenza divertendoti con questo quiz.";      //breve descrizione della pagina          
    
                $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);
    
                $page = buildQuiz($page, $quizInfo); 
            }
            // Se quiz selezionato non esiste
            else {
                // errore 404 (da implementare)
                $page = buildErrorPage($template, "404");
            }
        }
        else {
            // errore 500 (da implementare)
            $page = buildErrorPage($template, "500");
        }
    }
    else {
        // errore 404 (da implementare)
        $page = buildErrorPage($template, "404");
    }

    echo $page;        //mostra la pagina creata
?>