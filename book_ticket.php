<?php
session_start(); // Start the session at the beginning of the file

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Collect form data
    $name = $_POST['name'];
    $email = $_POST['email'];
    $contact = $_POST['contact'];
    $nationality = $_POST['nationality'];
    $show_number = $_POST['show_number'];
    $show_time = $_POST['show_time'];
    $show_date = $_POST['show_date'];
 
    $tickets = $_POST['tickets'];  // Get the ticket value

   // Determine ticket price
    $ticket_price = ($nationality == 'Indian') ? 200 : 600;
    $total_price = $ticket_price * $tickets;

    // Server-side validation for tickets
    if ($tickets > 20) {
        echo "<script>alert('You can book only up to 20 tickets.');</script>";
        exit;
    }

    // Store booking details temporarily in session
    $_SESSION['booking'] = [
        'name' => $name,
        'email' => $email,
        'contact' => $contact,
        'nationality' => $nationality,
        'show_number' => $show_number,
        'show_time' => $show_time,
        'show_date' => $show_date,
        'tickets' => $tickets,  // Ensure this is being set
        'ticket_price' => $ticket_price,
        'total_price' => $total_price
    ];

    // Debugging: Check session data
    echo "<pre>";
    print_r($_SESSION['booking']);  // Display session data for debugging
    echo "</pre>";

    // Redirect to the billing details page
    header("Location: billing_details.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Booking System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f3f4f6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

            .container {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 800px;
            padding: 25px;
            border: 1px solid black; /* Set border transparent */
        
        
        }


        h2 {
            text-align: center;
            color: #000000FF;
            font-size: 2rem;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        /* Desktop Layout: Two columns */
        @media (min-width: 768px) {
            form {
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            .form-group {
                width: 48%;
            }

            .form-group input,
            .form-group select {
                width: 100%;
            }
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-size: 1rem;
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"],
        input[type="time"]
       ,
        select,
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid #ddd;
            font-size: 1rem;
            margin-top: 5px;
        }

        input[type="submit"] {
            background: #4CAF50;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #45a049;
        }

        select, input[type="number"] {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }

        .error-message {
            color: red;
            font-size: 0.9rem;
            margin-top: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="number"]
        {
            background: #fafafa;
        }

        .form-group select {
            background: #f9f9f9;
        }

        /* Focus styles */
        input:focus, select:focus {
            border-color: #4CAF50;
            outline: none;
        }

        /* Responsive design */
        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 1.6rem;
            }
        }

    </style>
    <script>
        function validateTickets(event) {
            const ticketsInput = document.querySelector('input[name="tickets"]');
            const errorMessage = document.querySelector('.error-message');

            if (ticketsInput.value > 20) {
                errorMessage.textContent = "You can book only up to 20 tickets.";
                event.preventDefault();
            } else {
                errorMessage.textContent = "";
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Ticket Booking</h2>
    <form method="POST" onsubmit="validateTickets(event)">
        <div class="form-group">
            <label for="name">Full Name:</label>
            <input type="text" name="name" placeholder="Enter your full name" required>
        </div>

        <div class="form-group">
            <label for="email">Email Address:</label>
            <input type="email" name="email" placeholder="Enter your email address" required>
        </div>

        <div class="form-group">
            <label for="contact">Phone Number:</label>
            <input type="text" name="contact" placeholder="Enter your phone number" required>
        </div>

        <div class="form-group">
            <label for="nationality">Nationality:</label>
            <select name="nationality" required>
                <option value="" disabled selected>Select your nationality</option>
                <option value="Indian">Indian</option>
                <option value="American">American</option>
                <option value="British">British</option>
                <option value="Canadian">Canadian</option>
                <option value="Australian">Australian</option>
                <option value="German">German</option>
                <option value="French">French</option>
                <option value="Spanish">Spanish</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="form-group">
            <label for="show_number">Select Show Number:</label>
            <select name="show_number" required>
                <option value="" disabled selected>Select a show number</option>
                <option value="1">Show 1</option>
                <option value="2">Show 2</option>
                <option value="3">Show 3</option>
            </select>
        </div>

        <div class="form-group">
            <label for="show_time">Select Show Time:</label>
            <select name="show_time" required>
                <option value="" disabled selected>Select a time slot</option>
                <?php
                    $start_time = strtotime("08:00 AM");
                    $end_time = strtotime("08:00 PM");

                    while ($start_time < $end_time) {
                        $next_time = strtotime("+30 minutes", $start_time);
                        $time_slot = date("h:i A", $start_time) . " to " . date("h:i A", $next_time);
                        echo "<option value=\"$time_slot\">$time_slot</option>";
                        $start_time = $next_time;
                    }
                ?>
            </select>
        </div>

       <div class="form-group">
            <label for="date">Select Date:</label>
            <input type="date" name="show_date" class="date-input" required>
        </div>
        <style> .date-input {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    background-color: #fefefe;
    margin-top:10px;
}

.date-input:focus {
    border-color: #28a745;
    outline: none;
    box-shadow: 0 0 5px rgba(40, 167, 69, 0.5);
}
</style>
        


        <div class="form-group">
            <label for="tickets">Number of Tickets:</label>
            <input type="number" name="tickets" min="1" max="20" placeholder="Enter number of tickets" required>
            <p class="error-message"></p>
        </div>

        <input type="submit" value="Proceed to Billing">
    </form>
</div>

</body>
</html>
