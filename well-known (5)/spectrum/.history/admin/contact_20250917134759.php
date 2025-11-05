<?php
session_start();

include('../config.php');

// Only logged-in admins can access
if (!isset($_SESSION['admin_logged_in'])) {
    header("Location: login.php");
    exit;
}


// Fetch all messages
$sql = "SELECT * FROM contact_messages ORDER BY created_at DESC";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin - Contact Messages</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
body { font-family: Arial, sans-serif; padding: 20px; background: #f7f7f7; }
h1 { text-align: center; margin-bottom: 30px; }
table { width: 100%; border-collapse: collapse; background: #fff; }
table th, table td { padding: 12px; border: 1px solid #ddd; text-align: left; }
table th { background: #f44336; color: #fff; }
tr:nth-child(even) { background: #f2f2f2; }
.new-message { font-weight: bold; background-color: #ffe5e5; } /* highlight new messages */
</style>
</head>
<body>
<h1>Contact Messages</h1>

<table>
    <thead>
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Email</th>
            <th>Subject</th>
            <th>Message</th>
            <th>Time</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
    <?php if($result->num_rows > 0): ?>
        <?php while($row = $result->fetch_assoc()): ?>
        <tr class="<?= $row['is_read'] == 0 ? 'new-message' : '' ?>">
            <td><?= $row['id'] ?></td>
            <td><?= htmlspecialchars($row['name']) ?></td>
            <td><?= htmlspecialchars($row['email']) ?></td>
            <td><?= htmlspecialchars($row['subject']) ?></td>
            <td><?= nl2br(htmlspecialchars($row['message'])) ?></td>
            <td><?= $row['created_at'] ?></td>
            <td><?= $row['is_read'] == 0 ? 'New' : 'Read' ?></td>
        </tr>
        <?php endwhile; ?>
    <?php else: ?>
        <tr><td colspan="7" style="text-align:center;">No messages found</td></tr>
    <?php endif; ?>
    </tbody>
</table>

</body>
</html>
<?php $conn->close(); ?>
