<?php
// Database connection
$servername = "localhost";
$username = "u996075974_neural";
$password = "Neural@123";
$dbname = "u996075974_ticket_system";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    echo json_encode(["status" => "error", "message" => "Connection failed: " . $conn->connect_error]);
    exit();
}

// Enable error logging
ini_set('log_errors', 1);

// Get the ticket code from POST data
$ticketCode = isset($_POST['ticketCode']) ? trim($_POST['ticketCode']) : '';

if (empty($ticketCode)) {
    echo json_encode(["status" => "error", "message" => "Ticket code is missing."]);
    exit();
}

// Sanitize the ticket code
$ticketCode = filter_var($ticketCode, FILTER_SANITIZE_STRING);

// Debug: Log the received ticket code
error_log("Received Ticket Code: " . $ticketCode);

// Validate the ticket in the database
$sql = "SELECT * FROM tickets WHERE ticket_code = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $ticketCode);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    error_log("Ticket Details: " . json_encode($row)); // Debug: Log ticket details

    if ($row['scanned'] == 1) {
        // Ticket already scanned
        echo json_encode([
            "status" => "already_scanned",
            "message" => "This ticket has already been scanned."
        ]);
    } else {
        // Update the scanned status
        $updateSql = "UPDATE tickets SET scanned = 1 WHERE ticket_code = ?";
        $updateStmt = $conn->prepare($updateSql);
        $updateStmt->bind_param("s", $ticketCode);

        if ($updateStmt->execute()) {
            echo json_encode([
                "status" => "success",
                "message" => "Ticket scanned successfully."
            ]);
        } else {
            echo json_encode([
                "status" => "error",
                "message" => "Failed to update ticket status. Please try again."
            ]);
        }
    }
} else {
    // Ticket not found
    echo json_encode([
        "status" => "not_found",
        "message" => "Ticket code not found in the system."
    ]);
}

$conn->close();
?>
