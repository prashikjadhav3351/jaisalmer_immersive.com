<?php
// Display all PHP errors for debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();

// Fetch Razorpay payment ID and order ID from URL parameters
$payment_id = $_GET['payment_id'] ?? null;
$order_id = $_GET['order_id'] ?? null;

// Check if both order_id and payment_id are present
if (empty($payment_id) || empty($order_id)) {
    echo "Error: Payment ID or Order ID is missing.";
    exit;
}

// Fetch booking details from session
if (isset($_SESSION['booking'])) {
    $bookingData = $_SESSION['booking'];

    // Extract details from session data
    $name = $bookingData['name'] ?? null;
    $email = $bookingData['email'] ?? null;
    $contact = $bookingData['contact'] ?? null;
    $nationality = $bookingData['nationality'] ?? null;
    $show_number = $bookingData['show_number'] ?? null;
    $show_time = $bookingData['show_time'] ?? null;
    $show_date = $bookingData['show_date'] ?? null;
    $tickets = $bookingData['tickets'] ?? null;
    $total_price = $bookingData['total_price'] ?? null;

    // Check if any required session fields are missing
    if (!$name || !$email || !$contact || !$nationality || !$show_number || !$show_time || !$show_date || !$tickets || !$total_price) {
        echo "Error: Missing required fields in session.";
        exit;
    }
} else {
    echo "Error: Booking data is missing from session.";
    exit;
}

// Razorpay API credentials
$apiKey = 'rzp_test_gmzI44Co3mtoau';
$apiSecret = 'rK5xmNxIWsEBhop3EYKpDx3h';

// Initialize cURL to verify the payment with Razorpay API
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://api.razorpay.com/v1/payments/$payment_id");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_USERPWD, $apiKey . ":" . $apiSecret);
$response = curl_exec($ch);

// Check if the cURL request was successful
if (curl_errno($ch)) {
    echo "cURL Error: " . curl_error($ch);
    exit;
}

curl_close($ch);

// Decode the response
$response = json_decode($response, true);

// Debug: Display Razorpay API response
if (!$response) {
    echo "Error: Unable to parse Razorpay API response.";
    var_dump($response);
    exit;
}

// Check if payment was successfully captured
if (isset($response['status']) && $response['status'] == 'captured') {
    // Database connection
    $servername = "localhost";
    $username = "u996075974_neural";
    $password = "Neural@123";
    $dbname = "u996075974_ticket_system";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        echo "Database connection failed: " . $conn->connect_error;
        exit;
    }

    // Prepare SQL statement to insert payment data
    $stmt = $conn->prepare("INSERT INTO bookings (name, email, contact, nationality, show_number, show_time, show_date, tickets, total_price, payment_id, order_id) 
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    if (!$stmt) {
        echo "Error preparing statement: " . $conn->error;
        $conn->close();
        exit;
    }

    $stmt->bind_param("sssssssssss", $name, $email, $contact, $nationality, $show_number, $show_time, $show_date, $tickets, $total_price, $payment_id, $order_id);

    // Execute the query and check for success
    if ($stmt->execute()) {
        $stmt->close();
        $conn->close();
        header("Location: payment_success.php?payment_id=$payment_id&order_id=$order_id");
        exit;
    } else {
        echo "Error storing payment details: " . $stmt->error;
        $stmt->close();
        $conn->close();
        exit;
    }
} else {
    echo "Payment failed or not captured. Debug Response: ";
    var_dump($response);
    exit;
}
?>
