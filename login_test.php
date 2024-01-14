<?php
session_start();

// Simulate a successful login by setting a test user ID in the session
$_SESSION['user_id'] = 0; // Assuming user ID 1 exists in your database

echo "Successfully logged in!";
?>
