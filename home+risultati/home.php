<?php 
    require_once "./strumenti/connessione.php";

    $connection=new AccessDB;

    if($connection->open_connection()){

        $sql = "SELECT Nome, Tempo, Url_Immagine FROM Quiz ORDER BY Num_Like DESC LIMIT 5";
        $result = $conn->query($sql);

// Verifica se la query ha restituito risultati
    if ($result->num_rows > 0) {
    // Itera sui risultati della query
        while ($row = $result->fetch_assoc()) {
        // Stampa ogni nome in un proprio <p>
        echo '<p class="title">' . $row["Nome"] . '</p>';
        echo '<p id="time">' . $row["nome"] . '</p>';
        echo '<img src="' . $row["Link"] . '" alt="Immagine" class="link">';
    }
    } else {
        echo "Nessun risultato trovato";
    }


$sql = "SELECT Nome, Tempo, Url_Immagine, Tempo, Url_Immagine FROM Quiz ORDER BY Num_Giocate DESC LIMIT 5";
$result = $conn->query($sql);

// Verifica se la query ha restituito risultati
if ($result->num_rows > 0) {
    // Itera sui risultati della query
    while ($row = $result->fetch_assoc()) {
        // Stampa ogni nome in un proprio <p>
        echo '<p class="title">' . $row["Nome"] . '</p>';
        echo '<p id="time">' . $row["nome"] . '</p>';
        echo '<img src="' . $row["Link"] . '" alt="Immagine" class="link">';
    }
    } else {
        echo "Nessun risultato trovato";
    }


$sql = "SELECT Nome, Tempo, Url_Immagine FROM Quiz WHERE Categoria='Geografia' DESC LIMIT 5";
$result = $conn->query($sql);

// Verifica se la query ha restituito risultati
if ($result->num_rows > 0) {
    // Itera sui risultati della query
    while ($row = $result->fetch_assoc()) {
        // Stampa ogni nome in un proprio <p>
        echo '<p class="title">' . $row["Nome"] . '</p>';
        echo '<p id="time">' . $row["nome"] . '</p>';
        echo '<img src="' . $row["Link"] . '" alt="Immagine" class="link">';    }
    } else {
        echo "Nessun risultato trovato";
    }
}
else{
    echo $error;
}


