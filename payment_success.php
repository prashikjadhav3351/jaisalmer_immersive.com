<?php
session_start();
require 'vendor/autoload.php'; // Make sure you have the necessary libraries (e.g., Endroid QrCode)
require 'db_connection.php';  // Ensure you have a valid database connection

use Endroid\QrCode\QrCode;
use Endroid\QrCode\Writer\PngWriter;

if ($_SERVER['REQUEST_METHOD'] === 'POST' || isset($_GET['payment_id']) && isset($_GET['order_id'])) {
    $paymentId = $_GET['payment_id'] ?? $_POST['razorpay_payment_id'];
    $orderId = $_GET['order_id'] ?? $_POST['razorpay_order_id'];



ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

    $apiSecret = 'sPeIN5SKTdf9dp8rAsdn7qWd'; // Your Razorpay API secret
    if (isset($_POST['razorpay_signature'])) {
        $signature = $_POST['razorpay_signature'];
        $generatedSignature = hash_hmac('sha256', $orderId . "|" . $paymentId, $apiSecret);

        if ($generatedSignature !== $signature) {
            echo "<h3>Payment Verification Failed</h3>";
            exit;
        }
    }

    // Get booking details from the 'bookings' table based on the order ID
    try {
        $stmt = $pdo->prepare("SELECT * FROM bookings WHERE order_id = :order_id");
        $stmt->execute([':order_id' => $orderId]);
        $booking = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($booking && isset($booking['tickets'])) {
            $numberOfTickets = (int) $booking['tickets'];
            $directory = 'qr_codes';  // Directory to store QR code images

            if (!is_dir($directory)) {
                mkdir($directory, 0777, true);  // Create the directory if it doesn't exist
            }

            echo "<div class='success-container'>";
            echo "<h2 class='success-message'>Your Payment is Successful!</h2>";
            echo "<p><strong>Order ID:</strong> $orderId</p>";
            echo "<p><strong>Payment ID:</strong> $paymentId</p>";
                    

            // Get email from the booking table
            $name = $booking['name']; // Name from 'bookings' table
            $email = $booking['email']; // Email from 'bookings' table
            $contact = $booking['contact']; // Contact from 'bookings' table
            $nationality = $booking['nationality']; // nationality from 'bookings' table
            $show_number = $booking['show_number']; // Show Number from 'bookings' table
            $show_time = $booking['show_time']; // Show time from 'bookings' table
            $show_date = $booking['show_date']; // Show time from 'bookings' table
            

var_dump($_SESSION['booking']['show_date']); // Check if show_date exists in the session


            $tickets = $booking['tickets']; // no of tickets from 'bookings' table
            $total_price  = $booking['total_price']; // total price from 'bookings' table

            echo "<div class='booking-info-container'>";
            echo "<div class='booking-detail'><span class='label'><strong>Name:</strong></span><span class='value'>$name</span></div>";
            echo "<div class='booking-detail'><span class='label'><strong>Contact:</strong></span><span class='value'>$contact</span></div>";
            echo "<div class='booking-detail'><span class='label'><strong>Email:</strong></span><span class='value'>$email</span></div>";
            echo "<div class='booking-detail'><span class='label'><strong>Nationality:</strong></span><span class='value'>$nationality</span></div>";
            echo "<div class='booking-detail'><span class='label'><strong>Show Number:</strong></span><span class='value'>$show_number</span></div>";
            echo "<div class='booking-detail'><span class='label'><strong>Show Time:</strong></span><span class='value'>$show_time</span></div>";
            echo "<div class='booking-detail'><span class='label'><strong>Show Date:</strong></span><span class='value'>$show_date</span></div>";
            echo "<div class='booking-detail'><span class='label'><strong>Tickets:</strong></span><span class='value'>$tickets</span></div>";
            echo "<div class='booking-detail'><span class='label'><strong>Total:</strong></span><span class='value'>$total_price</span></div>";
            echo "</div>";

            // Get the last group ID to generate new tickets
            $stmt = $pdo->query("SELECT MAX(group_id) AS last_group_id FROM tickets");
            $lastGroupId = $stmt->fetchColumn() ?? 0;
            $currentGroupId = $lastGroupId + 1;

            // Get existing tickets for this order (if any)
            $stmt = $pdo->prepare("SELECT * FROM tickets WHERE order_id = :order_id");
            $stmt->execute([':order_id' => $orderId]);
            $existingTickets = $stmt->fetchAll(PDO::FETCH_ASSOC);

            echo "<div class='ticket-container'>";
            $qrCodes = [];  // Array to hold QR codes for download links
            $ticketUrls = [];  // Array to hold ticket URLs for email

            // If tickets already exist, display them
            if ($existingTickets) {
                $firstTicket = true;  // To mark the first ticket
                foreach ($existingTickets as $index => $ticket) {
                    $ticketCode = $ticket['ticket_code'];
                    $fileName = $directory . '/' . $ticketCode . '.png';

                    // Generate QR code if it doesn't exist
                    if (!file_exists($fileName)) {
                        $qrCode = new QrCode($ticketCode);
                        $writer = new PngWriter();
                        $result = $writer->write($qrCode);

                        // Add ticket label text to the image
                        $image = imagecreatefromstring($result->getString());
                        $text = "Ticket " . ($index + 1) . ": " . $ticketCode;

                        // Set font size and color for the text
                        $fontSize = 5; // Font size (adjust as needed)
                        $textColor = imagecolorallocate($image, 0, 0, 0); // Black color for text
                        $bgColor = imagecolorallocate($image, 255, 255, 255); // White color for background

                        // Get image width and height
                        $imageWidth = imagesx($image);
                        $imageHeight = imagesy($image);

                        // Calculate text position
                        $textWidth = imagefontwidth($fontSize) * strlen($text);
                        $textX = ($imageWidth - $textWidth) / 2;
                        $textY = $imageHeight + 10;

                        // Create a larger canvas for QR code and text
                        $newImage = imagecreatetruecolor($imageWidth, $imageHeight + 40);  // Increased height
                        $whiteBackground = imagecolorallocate($newImage, 255, 255, 255);  // Set white background
                        imagefill($newImage, 0, 0, $whiteBackground);

                        // Copy original image onto the new image
                        imagecopy($newImage, $image, 0, 0, 0, 0, $imageWidth, $imageHeight);

                        // Add a background rectangle for the text
                        imagefilledrectangle($newImage, $textX - 5, $textY - 5, $textX + $textWidth + 5, $textY + imagefontheight($fontSize) + 5, $bgColor);

                        // Add text to the image
                        imagestring($newImage, $fontSize, $textX, $textY, $text, $textColor);

                        // Save the new image with text
                        imagepng($newImage, $fileName);
                        imagedestroy($image);
                        imagedestroy($newImage);
                    }

                    // Display ticket with QR code and ticket code
                    echo "<div class='ticket'>";
                    echo "<img src='$fileName' alt='QR Code for $ticketCode'>";
                    echo "<p><strong>Ticket Code:</strong> $ticketCode</p>";
                    echo "<p><a href='$fileName' download='$ticketCode.png'>Download QR Code</a></p>";
                    echo "</div>";

                    $qrCodes[] = $fileName;  // Add QR code to array for reference
                    $ticketUrls[] = "https://www.jaisalmerimmersive.com/$fileName"; // Add URL to the list

                    // Mark the first ticket and break out of the loop if necessary
                    if ($firstTicket) {
                        $firstTicket = false;
                    }
                }
            } else {
                // If no tickets exist, create new tickets
                for ($i = 1; $i <= $numberOfTickets; $i++) {
                    $ticketCode = "TICKET-" . strtoupper(uniqid()) . "-$i";

                    // Insert ticket into the database
                    $ticketStmt = $pdo->prepare("INSERT INTO tickets (group_id, order_id, payment_id, ticket_code, generated_at) 
                                                VALUES (:group_id, :order_id, :payment_id, :ticket_code, NOW())");
                    $ticketStmt->execute([ 
                        ':group_id' => $currentGroupId, 
                        ':order_id' => $orderId,
                        ':payment_id' => $paymentId, 
                        ':ticket_code' => $ticketCode 
                    ]);

                    // Generate QR code for the ticket
                    $qrCode = new QrCode($ticketCode);
                    $writer = new PngWriter();
                    $result = $writer->write($qrCode);

                    // Add ticket label text to the image
                    $image = imagecreatefromstring($result->getString());
                    $text = "Ticket $i: $ticketCode";

                    // Set font size and color (black) and background (white)
                    $fontSize = 5;
                    $textColor = imagecolorallocate($image, 0, 0, 0);  // Black for text
                    $bgColor = imagecolorallocate($image, 255, 255, 255); // White for background

                    // Get image width and height
                    $imageWidth = imagesx($image);
                    $imageHeight = imagesy($image);

                    // Calculate text position
                    $textWidth = imagefontwidth($fontSize) * strlen($text);
                    $textX = ($imageWidth - $textWidth) / 2;
                    $textY = $imageHeight + 10;

                    // Create a new image with more space for text
                    $newImage = imagecreatetruecolor($imageWidth, $imageHeight + 40);
                    $whiteBackground = imagecolorallocate($newImage, 255, 255, 255);
                    imagefill($newImage, 0, 0, $whiteBackground);

                    // Copy original image onto the new image
                    imagecopy($newImage, $image, 0, 0, 0, 0, $imageWidth, $imageHeight);

                    // Add a rectangle background for the text
                    imagefilledrectangle($newImage, $textX - 5, $textY - 5, $textX + $textWidth + 5, $textY + imagefontheight($fontSize) + 5, $bgColor);

                    // Add text to the image
                    imagestring($newImage, $fontSize, $textX, $textY, $text, $textColor);

                    // Save the image
                    $fileName = $directory . '/' . $ticketCode . '.png';
                    imagepng($newImage, $fileName);
                    imagedestroy($image);
                    imagedestroy($newImage);

                    // Display ticket QR code
                    echo "<div class='ticket'>";
                    echo "<img src='$fileName' alt='QR Code for $ticketCode'>";
                    echo "<p><strong>Ticket Code:</strong> $ticketCode</p>";
                    echo "<p><a href='$fileName' download='$ticketCode.png'>Download QR Ticket</a></p>";
                    echo "</div>";
                    $qrCodes[] = $fileName;
                    $ticketUrls[] = "https://www.jaisalmerimmersive.com//$fileName"; // Add URL to the list
                }
            }
            
            

            // Send email with ticket details and download links
            $to = $email;
            $subject = "Your Event Tickets";
            $headers = "MIME-Version: 1.0\r\n";
            $headers .= "Content-Type: text/html; charset=UTF-8\r\n";
            $headers .= "From: test@jaisalmerimmersive.com\r\n";

            $message = "<h1>Your Event Tickets</h1>";
            $message .= "<h5>Name: $name</h5>";
            $message .= "<h5>Email: $email</h5>";
            $message .= "<h5>Contact: $contact</h5>";
            $message .= "<h5>Nationality: $nationality</h5>";
            $message .= "<h5>Show Number: $show_number</h5>"; 
            $message .= "<h5>Show Time: $show_time</h5>";
            $message .= "<h5>Show Time: $show_date</h5>";
            $message .= "<h5>No Of Tickets: $tickets</h5>";
            $message .= "<h5>Total Amount: $total_price</h5>";
            
            $message .="<h5>Thank you for booking your tickets with us! Here are your ticket details:</h5>";
            $message .= "<ul>";
            foreach ($ticketUrls as $url)  $count = 1; // Initialize counter to number the tickets
    foreach ($ticketUrls as $url) {
        
        $message .= "<li><a href='$url'>View Ticket $count</a></li>"; // Dynamically number each ticket
        $count++; // Increment the ticket number
    }
            $message .= "</ul>";
            $message .= "<h5>If you have any questions, feel free to contact us.</h5>";

            // Send the email
            if (mail($to, $subject, $message, $headers)) {
                // echo "<p>Email sent successfully to $email with your ticket details.</p>";
            } else {
                echo "<p>There was an error sending the email. Please try again later.</p>";
            }

        } else {
            echo "<h3>No booking found for the provided Order ID.</h3>";
        }

    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>   

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f1f1f1;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        padding: 30px;
        margin-top: 50px;
    }

    .success-container {
        text-align: center;
        background: linear-gradient(145deg, #ffffff, #f2f2f2);
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.1);
        margin-bottom: 30px;
        width: 100%;
        max-width: 800px;
        transform: translateY(10px);
        animation: fadeIn 0.8s ease-out;
    }

    .success-message {
        color: #4CAF50;
        font-size: 32px;
        font-weight: 700;
        margin-bottom: 20px;
        text-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        animation: fadeInUp 1s ease-out;
    }

    .ticket-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 25px;
        margin-top: 30px;
    }

    .ticket {
        text-align: center;
        background: #ffffff;
        padding: 25px;
        border: 1px solid #ddd;
        border-radius: 12px;
        width: 250px;
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease-in-out;
        opacity: 0;
        animation: fadeInUp 0.8s ease-out forwards;
    }

    .ticket:hover {
        transform: translateY(-12px);
        box-shadow: 0px 16px 32px rgba(0, 0, 0, 0.15);
    }

    .ticket img {
        max-width: 100%;
        height: auto;
        margin-bottom: 20px;
        border-radius: 10px;
        transition: transform 0.3s ease;
    }

    .ticket img:hover {
        transform: scale(1.05); /* Slight zoom effect on hover */
    }

    .ticket p {
        font-size: 16px;
        margin: 0;
        color: #666;
    }

    .ticket a {
        color: #4CAF50;
        text-decoration: none;
        font-weight: 700;
        margin-top: 15px;
        display: inline-block;
        padding: 10px 20px;
        background-color: #f4f4f4;
        border-radius: 6px;
        transition: background-color 0.3s;
    }

    .ticket a:hover {
        background-color: #e4e4e4;
        text-decoration: underline;
    }

    /* Mobile-first responsiveness */
    @media (max-width: 768px) {
        body {
            padding: 15px;
        }

        .success-container {
            padding: 25px;
            margin-top: 20px;
        }

        .success-message {
            font-size: 28px;
        }

        .ticket-container {
            gap: 20px;
            justify-content: space-evenly; /* Even distribution */
        }

        .ticket {
            width: 100%;
            max-width: 380px; /* Increased width for mobile */
            margin-bottom: 30px;
        }

        .ticket img {
            max-width: 90%;
            margin-bottom: 15px;
        }

        .ticket a {
            padding: 12px 25px;
            font-size: 16px;
        }
    }

    /* Additional responsiveness for very small screens */
    @media (max-width: 480px) {
        .ticket-container {
            flex-direction: column;
            align-items: center;
        }

        .ticket {
            width: 90%;
            margin: 15px 0;
        }

        .ticket a {
            padding: 8px 18px;
            font-size: 14px;
        }
    }

    /* Animations */
    @keyframes fadeIn {
        0% {
            opacity: 0;
            transform: translateY(-20px);
        }
        100% {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @keyframes fadeInUp {
        0% {
            opacity: 0;
            transform: translateY(20px);
        }
        100% {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>

<!--// ticket info css-->


<style>  

.booking-info-container {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: flex-start;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    border-color:green 3px solid;
    max-width: 500px; /* Optional: limits the width of the container */
    margin: 0 auto;
    gap: 8px; /* Reduced gap to bring the rows closer */
    margin-left: 220px; /* Slightly move everything to the right */
}

.booking-detail {
    display: flex;
    justify-content: space-between;
    width: 100%;
    padding: 5px 0;
}

.label {
    font-size: 16px;
    color: #333;
    font-weight: bold;
    width: 35%; /* Slightly smaller width to reduce spacing */
    text-align: left;
}

.value {
    font-size: 16px;
    color: #555;
    width: 60%; /* Slightly larger width for values */
    text-align: left;
}

/* Optional: Adding hover effect for better UI */
.booking-detail:hover {
    background-color: #f1f1f1;
    border-radius: 5px;
    padding: 5px;
}

/* Mobile responsiveness */
@media (max-width: 768px) {
    .booking-info-container {
        padding: 20px; /* Adjust padding for smaller screens */
        margin-left: 0; /* Remove left margin to fit content */
        max-width: 90%; /* Adjust width to be more responsive */
    }

    .label, .value {
        font-size: 18px; /* Increase font size for better readability on mobile */
        line-height: 1.5; /* Ensure there's enough spacing between lines */
    }

    .booking-detail {
        flex-direction: column; /* Stack the label and value vertically */
        gap: 16px; /* Increase gap for better spacing */
    }

    .label {
        width: 100%; /* Full width for label on mobile */
        text-align: left; /* Align text to the left */
    }

    .value {
        width: 100%; /* Full width for value on mobile */
        text-align: left; /* Align text to the left */
    }

    /* Optional: Force text not to scale on mobile */
    body {
        touch-action: manipulation; /* Disable zoom and touch actions */
        overflow-x: hidden;
    }
}


 </style>



