<?php
session_start();

if (isset($_SESSION['user_id'])) {
    echo 'true';        // utente loggato
} 
else {
    echo 'false';       // utente non loggato
}
?>
