<?php
include("../../config.php");
if (!isset($_SESSION['admin_logged_in'])) {
    header("Location: login.php");
    exit;
}


// Fetch current headings
$home = $conn->query("SELECT * FROM home_section LIMIT 1")->fetch_assoc();

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $first = $_POST['first_heading'];
    $special = $_POST['special_heading'];
    $last = $_POST['last_heading'];

    if ($home) {
        $stmt = $conn->prepare("UPDATE home_section SET first_heading=?, special_heading=?, last_heading=? WHERE id=?");
        $stmt->bind_param("sssi", $first, $special, $last, $home['id']);
        $stmt->execute();
    } else {
        $stmt = $conn->prepare("INSERT INTO home_section (first_heading, special_heading, last_heading) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $first, $special, $last);
        $stmt->execute();
    }

    header("Location: .php?success=1");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit firstSection</title>
<style>
    body { font-family: Arial; padding: 20px; }
    form { max-width: 700px; margin: auto; display: flex; flex-direction: column; gap: 10px; }
    input { padding: 8px; font-size: 14px; }
    button { padding: 10px; background: #007bff; color: #fff; border: none; cursor: pointer; }
    button:hover { background: #0056b3; }
</style>
</head>
<body>

<h2>Edit first Section</h2>

<?php if(isset($_GET['success'])): ?>
    <p style="color:green;">✅ Home section updated successfully!</p>
<?php endif; ?>

<form method="post">
    <label>First Heading:</label>
    <input type="text" name="first_heading" value="<?= htmlspecialchars($home['first_heading'] ?? '') ?>" required>

    <label>Special Heading:</label>
    <input type="text" name="special_heading" value="<?= htmlspecialchars($home['special_heading'] ?? '') ?>" required>

    <label>Last Heading:</label>
    <input type="text" name="last_heading" value="<?= htmlspecialchars($home['last_heading'] ?? '') ?>" required>

    <button type="submit">Save Changes</button>
</form>

</body>
</html>
