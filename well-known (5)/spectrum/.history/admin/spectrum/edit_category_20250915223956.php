<?php
session_start();
if (!isset($_SESSION['admin_logged_in'])) {
    header("Location: login.php");
    exit;
}

include('../../config.php');

if(!isset($_GET['id'])) { header("Location: index.php"); exit; }
$id = $_GET['id'];

// Fetch category
$cat = $conn->query("SELECT * FROM spectrum_categories WHERE id=$id")->fetch_assoc();

if(isset($_POST['submit'])){
    $name = $_POST['name'];
    $stmt = $conn->prepare("UPDATE spectrum_categories SET name=? WHERE id=?");
    $stmt->bind_param("si", $name, $id);
    $stmt->execute();
    header("Location: index.php");
}
?>

<h1>Edit Category</h1>
<form method="POST">
    <label>Category Name:</label>
    <input type="text" name="name" value="<?= htmlspecialchars($cat['name']) ?>" required>
    <button type="submit" name="submit">Update Category</button>
</form>
