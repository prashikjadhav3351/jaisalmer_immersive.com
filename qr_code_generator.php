<?php
// qr_code_generator.php

// Ensure that you have installed the 'endroid/qr-code' library via Composer
// You can install it by running: composer require endroid/qr-code

require 'vendor/autoload.php'; // Include the Composer autoloader

use Endroid\QrCode\QrCode;
use Endroid\QrCode\Writer\PngWriter;

// Example: Replace this with dynamically generated ticket codes
// Here, you can fetch ticket codes from your database or any other source
$ticket_codes = ['TICKET-1', 'TICKET-2', 'TICKET-3'];  // Replace with your dynamic ticket codes

// Create directory to store QR codes if it doesn't exist
$directory = 'qr_codes';
if (!is_dir($directory)) {
    mkdir($directory, 0777, true);
}

// Loop through each ticket code to generate a QR code
foreach ($ticket_codes as $ticket_code) {
    // Create a QR code instance with the ticket code
    $qrCode = new QrCode($ticket_code);

    // Create a writer instance to write the QR code to a PNG image
    $writer = new PngWriter();
    
    // Write the QR code to a file and get the binary result
    $result = $writer->write($qrCode);

    // Define the file path where the QR code will be saved
    $fileName = $directory . '/' . $ticket_code . '.png';

    // Save the QR code image to the file system
    file_put_contents($fileName, $result->getString());

    // Display the generated QR code on the webpage
    echo "<h3>QR Code for Ticket: $ticket_code</h3>";
    echo "<img src='$fileName' alt='QR Code for $ticket_code' style='max-width: 200px; margin: 10px;'/><br>";
}
?>
