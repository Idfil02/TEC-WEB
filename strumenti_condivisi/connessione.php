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
/* Esecuzione di query che restituiscono valori */
public function execute_query($query_text, $params = array()) {
    try {
        $stmt = $this->connection->prepare($query_text);

        if ($stmt) {
            $stmt->execute($params);

            $result = $stmt->get_result();

            if ($result) {
                $resultsArray = array();

                while ($row = $result->fetch_array(MYSQLI_ASSOC)) {
                    array_push($resultsArray, $row);
                }

                $stmt->close();
                return $resultsArray;
            } else {
                throw new Exception("Errore nella query result: " . $this->connection->error . ".");
            }
        } else {
            throw new Exception("Errore nella preparazione della query: " . $this->connection->error . ".");
        }
    } catch (Exception $e) {
        return $e->getMessage();
    }
}


    /* Esecuzione di query che modificano db */
/* Esecuzione di query che modificano db */
public function execute_mod_query($query_text, $params = array()) {
    try {
        $stmt = $this->connection->prepare($query_text);

        if ($stmt) {
            $stmt->execute($params);

            if ($stmt->affected_rows > 0) {
                $stmt->close();
                return true; // Query avvenuta correttamente
            } else {
                throw new Exception("Errore nella query result: " . $this->connection->error . ".");
            }
        } else {
            throw new Exception("Errore nella preparazione della query: " . $this->connection->error . ".");
        }
    } catch (Exception $e) {
        return $e->getMessage();
    }
}

public function getConnection() {
    return $this->connection;
}

}

?>