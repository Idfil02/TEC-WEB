
<?php 
    require_once "strumenti_condivisi/strumenti.php";
    require_once "strumenti_condivisi/connessione.php";

    $template = file_get_contents('layout_condivisi/template_layout.html');
    $main_content = file_get_contents('layout_pagine/index.html');

    $connection = new AccessDB;

    if ($connection->open_connection()) {
        $quizzes = $connection->execute_query("SELECT ID, Nome, Categoria, Tempo, Url_Immagine FROM Quiz");  
        session_start();
        if(isset($_SESSION['user_id'])){
            $query_res_saved = $connection->execute_query("SELECT Quiz FROM Salvati WHERE Utente='" . $_SESSION['user_id'] . "'"); 
            $saved_quizzes = array_map(function($item) {
                return $item['Quiz'];
            }, $query_res_saved);
        }
        else {
            $saved_quizzes = array();
        }
        $connection->close_connection();

        if(isset($quizzes[0]) and is_array($saved_quizzes)){
            $title = "QuackWiz";         //titolo della pagina
            $pageID = "index";           //id della pagina
            $keywords = "quiz, gioco, cultura, divertimento, apprendimento";        //parole chiave per SEO
            $description = "Gioca a questi fantastici quiz online gratuiti. C'è un quiz divertente praticamente per ogni argomento!";      //breve descrizione della pagina        

            $page = buildPage($template, $main_content, $title, $pageID, $keywords, $description);

            $page = buildHome($page, $quizzes, $saved_quizzes);
        }    
        else {
            // errore 404
            $page = buildErrorPage($template, "404");
        }
    }
    else {
        // errore 500
        $page = buildErrorPage($template, "500");
    }

    echo $page;        //mostra la pagina creata




    function buildHome($html, $quizData, $savedQuizzes) {
        $quiz_box_temp = file_get_contents('layout_pagine/quiz_box.html');

        $quiz_saved = "";
        $quiz_mix = "";
        $quiz_geo = "";
        $quiz_entertainement = "";
        $quiz_history = "";

        if (sizeof($quizData) > 0) {
            foreach($quizData as $i => $quiz_i){
                // Creo box del quiz
                $quiz_i_box = str_replace('[title]', $quiz_i['Nome'], $quiz_box_temp);
                $quiz_i_box = str_replace('[ID]', $quiz_i['ID'], $quiz_i_box);
                $quiz_i_box = str_replace('[image]', $quiz_i['Url_Immagine'], $quiz_i_box);
                $quiz_i_box = str_replace('[time]', $quiz_i['Tempo']/60, $quiz_i_box);

                // Controllo categoria 
                switch ($quiz_i['Categoria']) {
                    case "Intrattenimento":
                        $quiz_entertainement .= $quiz_i_box;
                        break;
                    case "Geografia":
                        $quiz_geo .= $quiz_i_box;
                        break;
                    case "Storia":
                        $quiz_history .= $quiz_i_box;
                        break;
                    default:
                        $quiz_mix .= $quiz_i_box;
                        break;
                }

                // Controllo se quiz salvato
                if(in_array($quiz_i['ID'], $savedQuizzes)){
                    $quiz_saved .= str_replace("salva-" . $quiz_i['ID'], "salva-".$quiz_i['ID']."-saved", $quiz_i_box, );
                }
            }

            // Aggiungo quiz_row alle giuste parti della pagina html della home
            $html = str_replace('[quiz-row-saved]', $quiz_saved, $html);
            $html = str_replace('[quiz-row-random]', $quiz_mix, $html);
            $html = str_replace('[quiz-row-geografia]', $quiz_geo, $html);
            $html = str_replace('[quiz-row-intrattenimento]', $quiz_entertainement, $html);
            $html = str_replace('[quiz-row-storia]', $quiz_history, $html);

        }
        return $html;
    }
?>


