<?php
session_start();
if (!isset($_SESSION['booking']) || empty($_SESSION['booking'])) {
    header("Location: book_ticket.php");
    exit;
}

// Database connection (adjust these values according to your setup)
$servername = "localhost";
$username = "u996075974_neural";
$password = "Neural@123";  // Your database password
$dbname = "u996075974_ticket_system";  // Your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}



// Prepare user data
$name = $_SESSION['booking']['name'];
$email = $_SESSION['booking']['email'];
$contact = $_SESSION['booking']['contact'];
$nationality = $_SESSION['booking']['nationality'];
$show_number = $_SESSION['booking']['show_number'];
$show_time = $_SESSION['booking']['show_time'];
$tickets = $_SESSION['booking']['tickets'];
$show_date = $_SESSION['booking']['show_date'];
$total_price = $_SESSION['booking']['total_price'];

// Insert the data into the database
// $stmt = $conn->prepare("INSERT INTO bookings (name, email, contact, nationality, show_number, show_time, show_date, tickets, total_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
// $stmt->bind_param("ssssssidi", $name, $email, $contact, $nationality, $show_number, $show_time, $show_date, $tickets, $total_price);

// if ($stmt->execute()) {
//     $last_id = $stmt->insert_id;
// } else {
//     echo "Error: " . $stmt->error;
//     exit;
// }


// Razorpay API integration
$apiKey = 'rzp_test_gmzI44Co3mtoau'; // Your Razorpay API key
$apiSecret = 'rK5xmNxIWsEBhop3EYKpDx3h'; // Your Razorpay API secret
$amount = $total_price * 100; // Amount in paisa (1 INR = 100 paisa)

// Initialize Razorpay API using cURL
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://api.razorpay.com/v1/orders");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_USERPWD, $apiKey . ":" . $apiSecret);

$data = array(
    'amount' => $amount, // Amount in paisa
    'currency' => 'INR',
    'payment_capture' => 1, // Auto-capture payment
);

curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
$response = curl_exec($ch);

if (curl_errno($ch)) {
    echo 'cURL Error: ' . curl_error($ch);
    exit;
}

curl_close($ch);

$response = json_decode($response, true);

if (isset($response['id'])) {
    $razorpayOrderId = $response['id'];

    // Update the booking record with the Razorpay order ID
    $updateSql = "UPDATE bookings SET order_id = ? WHERE id = ?";
    $updateStmt = $conn->prepare($updateSql);
    $updateStmt->bind_param("si", $razorpayOrderId, $last_id);
    
    if ($updateStmt->execute() === FALSE) {
        echo "Error updating record: " . $conn->error;
        exit;
    }
} else {
    echo "Error: Razorpay order creation failed.";
    exit;
}

// Close the database connection
$conn->close();
?>





<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing Details</title>
    <!-- Google Fonts for Better Typography -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #333; /* Darker background for the page */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            box-sizing: border-box;
        }

        /* Container */
        .container {
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 15px 30px rgba(0, 0, 0, 0.15); /* Slightly stronger shadow */
            max-width: 750px;
            width: 90%;
            margin: 20px;
            box-sizing: border-box;
            border: 2px solid #007bff; /* Border color to make the container stand out */
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background: linear-gradient(135deg, #ffffff, #e8eaf6); /* Subtle gradient */
        }

        .container:hover {
            transform: scale(1.02);
            box-shadow: 0px 20px 40px rgba(0, 0, 0, 0.2);
        }

        /* Header */
        .user-details h2 {
            text-align: center;
            color: #444;
            font-size: 30px; /* Increased font size for better readability */
            margin-bottom: 20px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Details Grid */
        .details-grid {
            display: grid;
            grid-template-columns: 1fr 2fr;
            row-gap: 15px;
            column-gap: 30px;
            margin-bottom: 30px;
        }

        /* Styling for each box inside the details grid */
        .details-grid p {
            margin: 0;
            line-height: 1.6;
            color: #444; /* Darker text for contrast */
            font-size: 16px; /* Increased font size for better readability */
            transition: color 0.3s ease;
            padding: 12px;
            border-radius: 8px;
            background-color: #f4f6f9; /* Soft light gray background */
            border: 2px solid #73B0F1FF; /* Adding border to each detail box */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow for the boxes */
            transition: all 0.3s ease-in-out;
        }

        .details-grid p:hover {
            background-color: #d0d9e2; /* Hover background with subtle darker shade */
            color: #333;
            transform: translateY(-5px);
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .details-grid strong {
            font-weight: bold;
            color: #333;
        }

        /* Payment Section */
        .payment-section {
            text-align: center;
            margin-top: 30px;
        }

        /* Pay Now Button */
        .pay-now-btn {
            background: linear-gradient(135deg, #007bff, #0056b3); /* Blue gradient for button */
            color: #fff;
            border: none;
            padding: 14px 25px; /* Slightly increased padding */
            font-size: 20px; /* Increased font size */
            font-weight: 600;
            border-radius: 30px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .pay-now-btn:hover {
            background: linear-gradient(135deg, #0056b3, #007bff); /* Darker blue on hover */
            transform: scale(1.05);
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.15);
        }

        .pay-now-btn:focus {
            outline: none;
        }

        /* Blowing Animation for Pay Now Button */
        .pay-now-btn:hover {
            animation: blowEffect 1.5s ease-out infinite;
        }

        @keyframes blowEffect {
            0% {
                transform: scale(1.05);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1.05);
            }
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                padding: 25px;
            }

            .details-grid {
                grid-template-columns: 1fr;
                text-align: left;
            }

            .details-grid p {
                font-size: 14px;
            }

            .pay-now-btn {
                width: 100%;
                padding: 14px 0;
            }
        }
    </style>
</head>
<body>

  <div class="container">
    <!-- User Details Section -->
    <div class="user-details">
        <h2>Billing Details</h2>
        <div class="details-grid">
            <p><strong>Name:</strong> <?= htmlspecialchars($_SESSION['booking']['name'] ?? 'Not provided') ?></p>
            <p><strong>Email:</strong> <?= htmlspecialchars($_SESSION['booking']['email'] ?? 'Not provided') ?></p>
            <p><strong>Contact:</strong> <?= htmlspecialchars($_SESSION['booking']['contact'] ?? 'Not provided') ?></p>
            <p><strong>Nationality:</strong> <?= htmlspecialchars($_SESSION['booking']['nationality'] ?? 'Not provided') ?></p>
            <p><strong>Show Number:</strong> <?= htmlspecialchars($_SESSION['booking']['show_number'] ?? 'Not provided') ?></p>
            <p><strong>Show Timing:</strong> <?= htmlspecialchars($_SESSION['booking']['show_time'] ?? 'Not provided') ?></p>
            <p><strong>Show Date:</strong> <?= htmlspecialchars($_SESSION['booking']['show_date'] ?? 'Not provided') ?></p>
            <p><strong>Tickets:</strong> <?= htmlspecialchars($_SESSION['booking']['tickets'] ?? 'Not provided') ?></p>
            <p><strong>Total Price:</strong> ₹<?= htmlspecialchars($_SESSION['booking']['total_price'] ?? '0') ?></p>
        </div>
    </div>


        <!-- Payment Section -->
        <div class="payment-section">
            <button class="pay-now-btn" id="payNow">Pay Now</button>
        </div>
    </div>

    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>



     document.getElementById('payNow').addEventListener('click', function () {
            var options = {
                "key": "rzp_test_gmzI44Co3mtoau", // Your Razorpay API key
                "amount": "<?php echo $amount; ?>", // Amount in paisa
                "currency": "INR",
                "order_id": "<?php echo $razorpayOrderId; ?>", // Razorpay Order ID
                "handler": function (response) {
                    // Check if the payment is successful before redirecting
                    if (response.razorpay_payment_id) {
                        // Assuming payment is successful, redirect to the success page
                        window.location.href = "verify_payment.php?payment_id=" + response.razorpay_payment_id + "&order_id=" + response.razorpay_order_id;
                    } else {
                        alert("Payment failed. Please try again.");
                    }
                },
                "prefill": {
                    "name": "<?php echo htmlspecialchars($_SESSION['booking']['name']); ?>",
                    "email": "<?php echo htmlspecialchars($_SESSION['booking']['email']); ?>",
                    "contact": "<?php echo htmlspecialchars($_SESSION['booking']['contact']); ?>"
                },
                "theme": {
                    "color": "#007bff" /* Blue */
                }
            };

            var rzp1 = new Razorpay(options);
            rzp1.open();
        });

  </script>
</body>
</html>