<?php

    session_start();
    include("connection.php");
    include("functions.php");

    $user_data = check_login($con);

    echo file_get_contents("index.html");

    echo $user_data['user_name'];

?>