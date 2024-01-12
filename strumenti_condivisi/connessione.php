<?php

class AccessDB {
    /***********************************************/
    /*********** PARAMETRI DI CONNESSIONE **********/
    /***********************************************/
    private const host = "127.0.0.1";
    private const db_name = "QuackWiz_db";
    private const user = "root";
    private const psw = "root";
    private $connection;


    /***********************************************/
    /******************* FUNZIONI ******************/
    /***********************************************/
    public function open_connection() {
        // Apro la connessione
        $this->connection = new mysqli(AccessDB::host, AccessDB::user, AccessDB::psw, AccessDB::db_name);
    
        // Verifica di eventuali errori di connessione
        if ($this->connection->connect_errno) {
            echo "Connessione fallita (". $this->connection->connect_errno ."):". $this->connection->connect_error;
            return false;
        }
        return true;           /*ritorno vero se la connessione al db è stata aperta correttamente*/
    }
     
    public function close_connection() {
        $this->connection->close();
    }
       
    public function execute_query($query_text) {
        // Errori nella query
        if(!$result = $this->connection->query($query_text)) {
            echo "Errore della query: " . $this->connection->error . ".";
            exit();
        }
        // Ciclo sui record da restituire
        else {
            // Se la query produce dei risultati
            if($result->num_rows > 0) {
                $resultsArray = array();        /*array dove immagazzinare risultati query*/
                while($row = $result->fetch_array(MYSQLI_ASSOC)){       /*un risultato/elem. dell'array (row) contiene coppie nome_campo : valore campo*/
                    array_push($resultsArray, $row);
                }
                $result->free();
                return $resultsArray;
            }
            // Se la query non produce risultati
            else {
                return Array();         /*restituisco array vuoto*/
            }
        }
    }


    // Modifica di un valore specificato del db
    public function execute_mod_DB($table, $condition, $field, $newvalue) {
        if(!$result = $this->connection->query("UPDATE " . $table . " SET ". $field ."=" . $newvalue . " WHERE " . $condition)) {
            echo "Errore della query di modifica: " . $this->connection->error . ".";
            exit();
        }
    }

    
    // Elimina un valore specificato del db
    public function delete_elem_db($table, $condition) {
        if(!$result = $this->connection->query("DELETE FROM " . $table . " WHERE ". $condition)) {
            echo "Errore della query di eliminazione: " . $this->connection->error . ".";
            exit();
        }
    }

    public function insert_elem_db($table_and_attr, $newValues) {
        if(!$result = $this->connection->query("INSERT INTO " . $table_and_attr . " VALUES ". $newValues)) {
            echo "Errore della query di insert: " . $this->connection->error . ".";
            exit();
        }
    }
}

?>