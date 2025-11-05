<?php
session_start();
if (!isset($_SESSION['admin_logged_in'])) {
    header("Location: login.php");
    exit;
}

include '../../config.php';

if (!isset($_GET['id'])) {
  die("Location ID is required.");
}

$location_id = intval($_GET['id']);

// Fetch location details
$loc = mysqli_fetch_assoc(mysqli_query($conn, "SELECT city FROM locations WHERE id = $location_id"));

// Handle Add Department
if (isset($_POST['add'])) {
  $name = mysqli_real_escape_string($conn, $_POST['name']);
  $count = intval($_POST['people_count']);
  $category = mysqli_real_escape_string($conn, $_POST['category']);

  $sql = "INSERT INTO departments (location_id, name, people_count, category)
          VALUES ($location_id, '$name', $count, '$category')";
  mysqli_query($conn, $sql);
  header("Location: manage_departments.php?id=$location_id");
  exit();
}

// Handle Update Department
if (isset($_POST['update'])) {
  $id = intval($_POST['edit_id']);
  $name = mysqli_real_escape_string($conn, $_POST['edit_name']);
  $count = intval($_POST['edit_count']);
  $category = mysqli_real_escape_string($conn, $_POST['edit_category']);

  $sql = "UPDATE departments SET name='$name', people_count=$count, category='$category' WHERE id=$id";
  mysqli_query($conn, $sql);
  header("Location: manage_departments.php?id=$location_id");
  exit();
}

// Handle Delete Department
if (isset($_POST['delete'])) {
  $id = intval($_POST['delete_id']);

  $sql = "DELETE FROM departments WHERE id=$id";
  mysqli_query($conn, $sql);
  header("Location: manage_departments.php?id=$location_id");
  exit();
}

// Function to pluralize category label
function pluralizeCategory($category, $count) {
  if ($count > 1) {
    if ($category === 'engineer') return 'Engineers';
    if ($category === 'person') return 'Persons';
  }
  if ($category === 'engineer') return 'Engineer';
  if ($category === 'person') return 'Person';
  return ucfirst($category);
}
?>

<!DOCTYPE html>
<html>
<head>
  <title>Manage Departments</title>
  <style>
    table {
      border-collapse: collapse;
      margin-top: 20px;
    }
    th, td {
      padding: 10px;
      border: 1px solid #888;
      vertical-align: middle;
    }
    form {
      display: inline;
      margin: 0;
    }
    input[type="text"], input[type="number"], select {
      width: 120px;
      margin-right: 5px;
    }
    h2 {
      margin-bottom: 0;
    }
    button {
      cursor: pointer;
      padding: 5px 10px;
    }
  </style>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
  <title>Manage Departments</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f6f8;
      margin: 0;
      padding: 0;
    }
    .container {
      max-width: 1000px;
      margin: 30px auto;
      padding: 20px;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }
    h2, h3 {
      color: #333;
    }
    a {
      color: #007bff;
      text-decoration: none;
    }
    a:hover { text-decoration: underline; }
    form {
      margin: 0;
    }
    .form-inline input, .form-inline select {
      padding: 8px;
      margin-right: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    button {
      padding: 7px 12px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: 0.3s;
    }
    button.update { background: #28a745; color: #fff; }
    button.update:hover { background: #218838; }
    button.delete { background: #dc3545; color: #fff; }
    button.delete:hover { background: #c82333; }
    button.add { background: #007bff; color: #fff; }
    button.add:hover { background: #0069d9; }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    th, td {
      padding: 12px;
      border-bottom: 1px solid #ddd;
      text-align: center;
    }
    th {
      background: #007bff;
      color: #fff;
      font-weight: normal;
    }
    tr:hover {
      background: #f1f1f1;
    }
    .actions {
      display: flex;
      justify-content: center;
      gap: 5px;
    }
    @media (max-width: 768px) {
      .form-inline input, .form-inline select {
        width: 100%;
        margin-bottom: 5px;
      }
      .actions {
        flex-direction: column;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Manage Departments for <?= htmlspecialchars($loc['city']) ?></h2>
  <a href="com.php">← Back to Locations</a>

  <h3>Add New Department</h3>
  <form method="POST" class="form-inline">
    <input type="text" name="name" placeholder="Department Name" required>
    <input type="number" name="people_count" placeholder="People Count" required min="0">
    <select name="category" required>
      <option value="engineer">Engineer</option>
      <option value="person">Person</option>
    </select>
    <button type="submit" name="add" class="add">Add</button>
  </form>

  <h3>Existing Departments</h3>
  <table>
    <tr>
      <th>Name</th>
      <th>People</th>
      <th>Category</th>
      <th>Label</th>
      <th>Actions</th>
    </tr>
    <?php
    $result = mysqli_query($conn, "SELECT * FROM departments WHERE location_id = $location_id ORDER BY id ASC");
    while ($row = mysqli_fetch_assoc($result)) {
        $categoryLabel = pluralizeCategory($row['category'], $row['people_count']);
    ?>
    <tr>
      <td>
        <form method="POST" class="form-inline">
          <input type="hidden" name="edit_id" value="<?= $row['id'] ?>">
          <input type="text" name="edit_name" value="<?= htmlspecialchars($row['name']) ?>" required>
      </td>
      <td>
          <input type="number" name="edit_count" value="<?= $row['people_count'] ?>" required min="0">
      </td>
      <td>
          <select name="edit_category" required>
            <option value="engineer" <?= $row['category'] == 'engineer' ? 'selected' : '' ?>>Engineer</option>
            <option value="person" <?= $row['category'] == 'person' ? 'selected' : '' ?>>Person</option>
          </select>
      </td>
      <td><?= $categoryLabel ?></td>
      <td class="actions">
          <button type="submit" name="update" class="update">Update</button>
        </form>

        <form method="POST" onsubmit="return confirm('Are you sure?');">
          <input type="hidden" name="delete_id" value="<?= $row['id'] ?>">
          <button type="submit" name="delete" class="delete">Delete</button>
        </form>
      </td>
    </tr>
    <?php } ?>
  </table>
</div>
</body>
</html>
