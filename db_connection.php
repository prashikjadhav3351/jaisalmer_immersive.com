<?php
// Database connection details
$host = 'localhost';       // Host name
$dbname = 'u996075974_ticket_system'; // Database name
$username = 'u996075974_neural';        // Database username
$password = 'Neural@123';            // Database password

try {
    // Create a new PDO instance and set the connection charset to UTF8
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);

    // Set error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Uncomment below line if you want to verify connection
    // echo "Connected to the $dbname database successfully!";
} catch (PDOException $e) {
    // Catch and display any connection errors
    echo "Connection failed: " . $e->getMessage();
}
?>
