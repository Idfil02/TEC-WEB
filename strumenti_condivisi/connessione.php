<?php

class AccessDB {
    /***********************************************/
    /*********** PARAMETRI DI CONNESSIONE **********/
    /***********************************************/
    private const host = "127.0.0.1";
    private const db_name = "QuackWiz_db";
    private const user = "jessica";
    private const psw = "jessica";
    private $connection;


    /***********************************************/
    /******************* FUNZIONI ******************/
    /***********************************************/
    public function open_connection() {      
        try {
            $this->connection = new mysqli(AccessDB::host, AccessDB::user, AccessDB::psw, AccessDB::db_name);
        
            // Verifica di eventuali errori di connessione
            if ($this->connection->connect_error) {
                throw new Exception("Errore di connessione: " . $this->connection->connect_error);
            }
            else {    
                return true;    // se apertura avvenuta correttamente
            }
        }
        catch (Exception $e) {
            return false;
        }
    }
     
    public function close_connection() {
        $this->connection->close();
    }

    /* Esecuzione di query che restituiscono valori */
    public function execute_query($query_text) {
        try {
            $result = $this->connection->query($query_text);
            // Errori nella query
            if (!$result) {
                throw new Exception("Errore nella query: " . $this->connection->error . ".");
            }
            // Ciclo dei record da restituire
            else {
                // Se la query produce dei risultati
                if($result->num_rows > 0) {
                    $resultsArray = array();        //array dove immagazzinare risultati query
                    while($row = $result->fetch_array(MYSQLI_ASSOC)){       //un risultato/elem. dell'array (row) contiene coppie nome_campo : valore campo
                        array_push($resultsArray, $row);
                    }
                    $result->free();
                    return $resultsArray;
                }
                // Se la query non produce risultati
                else {
                    return Array();         //restituisco array vuoto
                }
            }
        }
        catch (Exception $e) {
            return $e->getMessage();
        }
    }

    /* Esecuzione di query che modificano db */
    public function execute_mod_query($query_text) {
        try {
            $result = $this->connection->query($query_text);
            // Errori nella query
            if (!$result) {
                throw new Exception("Errore nella query: " . $this->connection->error . ".");
            }
            // Ciclo dei record da restituire
            else {
                return $result;     // ritorna true (query avvenuta correttamente)
            }
        }
        catch (Exception $e) {
            return $e->getMessage();
        }
    }
}

?>