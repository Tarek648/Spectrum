<?php
session_start();
include('../config.php');
if (!isset($_SESSION['admin_logged_in'])) exit;

// Fetch unread contact messages
$unreadMessages = $conn->query("SELECT * FROM contact_messages WHERE is_read = 0 ORDER BY created_at DESC LIMIT 5");
$messagesCount = $unreadMessages->num_rows;

// Fetch unread job applications
$unreadApplications = $conn->query("SELECT * FROM job_applications WHERE is_read = 0 ORDER BY submission_date DESC LIMIT 5");
$applicationsCount = $unreadApplications->num_rows;

// Total unread count
$totalUnread = $messagesCount + $applicationsCount;
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary: #1e3a8a;  /* Deep Blue */
      --secondary: #2563eb; /* Bright Blue */
      --accent: #f59e0b;    /* Amber */
      --light: #f9fafb;     /* Light Gray */
      --sidebar: #1f2937;   /* Sidebar Gray */
    }

    body {
      margin: 0;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      background: var(--light);
    }

    /* Navbar */
    .navbar {
      background: var(--primary);
      color: #fff;
      padding: 12px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: fixed;
      top: 0; left: 0; right: 0;
      z-index: 1000;
    }
    .navbar .title {
      font-size: 18px;
      font-weight: bold;
      white-space: nowrap;
    }

    .navbar-left {
      display: flex;
      align-items: center;
      gap: 15px;
    }

    .hamburger {
      font-size: 20px;
      cursor: pointer;
    }

    /* Search Bar */
    .search-container {
      flex: 1;
      max-width: 400px;
      margin: 0 20px;
      position: relative;
    }
    .search-container input {
      width: 100%;
      padding: 8px 35px 8px 12px;
      border-radius: 20px;
      border: none;
      outline: none;
      font-size: 14px;
      box-sizing: border-box;
    }
    .search-container i {
      position: absolute;
      right: 12px;
      top: 50%;
      transform: translateY(-50%);
      color: #666;
      font-size: 14px;
      cursor: pointer;
    }

    /* Notification */
    .notification { position: relative; cursor: pointer; }
    .notification .badge {
      position: absolute; top: -5px; right: -10px;
      background: var(--accent); color: white; font-size: 12px;
      border-radius: 50%; padding: 2px 6px;
    }
    .dropdown {
      display: none;
      position: absolute;
      right: 0; top: 40px;
      background: white;
      border: 1px solid #ccc;
      width: 260px;
      max-height: 300px; overflow: auto;
      box-shadow: 0 2px 8px rgba(0,0,0,0.2);
      z-index: 2000;
    }
    .dropdown div {
      padding: 10px; border-bottom: 1px solid #eee; font-size: 14px;
    }
    .dropdown div:hover { background: #f5f5f5; }

    /* Sidebar */
    .sidebar {
      width: 70px;
      background: var(--sidebar);
      color: white;
      position: fixed;
      top: 50px; bottom: 0; left: 0;
      overflow: auto;
      padding-top: 10px;
      transition: width 0.3s;
    }
    .sidebar.expanded { width: 230px; }
    .sidebar a, .sidebar .menu-toggle {
      display: flex; align-items: center;
      padding: 12px 20px;
      color: white; text-decoration: none;
      font-size: 14px;
      border-bottom: 1px solid #2c3e50;
      transition: 0.3s;
      white-space: nowrap;
      overflow: hidden;
      cursor: pointer;
    }
    .sidebar a:hover, .sidebar .menu-toggle:hover { background: var(--secondary); }
    .sidebar a i, .sidebar .menu-toggle i {
      margin-right: 10px;
      width: 20px;
      text-align: center;
      font-size: 18px;
    }
    .sidebar span { opacity: 0; transition: opacity 0.2s; }
    .sidebar.expanded span { opacity: 1; }

    /* Submenu */
    .submenu {
      display: none;
      background: #374151;
    }
    .submenu a {
      padding-left: 45px;
      font-size: 13px;
      border-bottom: none;
    }
    .submenu a:hover { background: #2563eb; }

    /* Content */
    .content {
      margin-left: 70px;
      margin-top: 50px;
      padding: 20px;
      transition: margin-left 0.3s;
    }
    .content.expanded { margin-left: 230px; }
    iframe {
      width: 100%; height: 80vh; border: none;
      background: white;
      border-radius: 8px;
      box-shadow: 0 0 8px rgba(0,0,0,0.1);
    }

    .admin-notification { position: relative; cursor: pointer; }
.admin-badge {
    position: absolute;
    top: -5px;
    right: -10px;
    background: var(--accent);
    color: white;
    font-size: 12px;
    border-radius: 50%;
    padding: 2px 6px;
}
.admin-dropdown {
    display: none;
    position: absolute;
    right: 0; top: 40px;
    background: white;
    border: 1px solid #ccc;
    width: 260px;
    max-height: 300px;
    overflow-y: auto;
    box-shadow: 0 2px 8px rgba(0,0,0,0.2);
    z-index: 2000;
}
.admin-dropdown-item {
    padding: 10px;
    border-bottom: 1px solid #eee;
    font-size: 14px;
    cursor: pointer;
    color:black;
}
.admin-dropdown-item:hover { background: #f5f5f5; }


    /* Responsive */
    @media (max-width: 768px) {
      .search-container { display: none; }
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <div class="navbar">
    <div class="navbar-left">
      <i class="fa-solid fa-bars hamburger" onclick="toggleSidebar()"></i>
      <div class="title">Admin Dashboard</div>
    </div>

 <!-- Unified Notification Badge -->
<div class="admin-notification">
  <i class="fa-solid fa-bell" onclick="toggleAdminDropdown()"></i>
  <span class="admin-badge" id="adminNotificationBadge" style="<?= $totalUnread > 0 ? '' : 'display:none;' ?>">
      <?= $totalUnread ?>
  </span>

  <div class="admin-dropdown" id="adminDropdown" style="display:none;">
      <?php
      if ($messagesCount + $applicationsCount === 0) {
          echo '<div class="admin-dropdown-item">No new notifications</div>';
      } else {
          // Show contact messages first
          while ($msg = $unreadMessages->fetch_assoc()) {
              echo '<div class="admin-dropdown-item" onclick="openAdminMessage(\'contact.php?id='.$msg['id'].'\', '.$msg['id'].', \'message\')">
                  <strong>'.htmlspecialchars($msg['name']).'</strong> 
                  (<a href="mailto:'.htmlspecialchars($msg['email']).'">'.htmlspecialchars($msg['email']).'</a>) 
                  - '.htmlspecialchars($msg['subject']).'
              </div>';
          }

          // Show job applications
          while ($app = $unreadApplications->fetch_assoc()) {
              echo '<div class="admin-dropdown-item" onclick="openAdminMessage(\'admin_applicants.php?id='.$app['id'].'\', '.$app['id'].', \'application\')">
                  <strong>'.htmlspecialchars($app['first_name'].' '.$app['last_name']).'</strong> 
                  (<a href="mailto:'.htmlspecialchars($app['email']).'">'.htmlspecialchars($app['email']).'</a>) 
                  - Position: '.htmlspecialchars($app['position']).'
              </div>';
          }
      }
      ?>
  </div>
</div>


    </div>
  </div>
<!-- Sidebar -->
<div class="sidebar" id="sidebar">

    <a href="#" onclick="loadPage('update_nav.php')"><i class="fa-solid fa-circle-info sidebar-icon   "></i> <span>header</span></a>
   <a href="#" onclick="loadPage('footer.php')"><i class="fa-solid fa-square-poll-horizontal  sidebar-icon"></i> <span>footer</span></a>

    <div class="menu-toggle" onclick="toggleSubmenu('homeMenu')">
        <i class="fa-solid fa-house sidebar-icon   sidebar-icon"></i><span>Home page▾</span>
    </div>
    <div class="submenu" id="homeMenu">
        <a href="#" onclick="loadPage('slider_manage.php')">slider_manage</a>
        <a href="#" onclick="loadPage('home_page/home_page_header.php')">manage headers</a>
        <a href="#" onclick="loadPage('home_page/about_us-section.php')">about_us_section</a>
    </div>

    <div class="menu-toggle" onclick="toggleSubmenu('aboutMenu')">
        <i class="fa-solid fa-circle-info sidebar-icon <?php
session_start();
if (!isset($_SESSION['admin_logged_in'])) {
    header("Location: login.php");
    exit;
}

include('../../config.php');

$category_id = $_GET['category_id'];
$category = $conn->query("SELECT * FROM gulf_spectrum_categories WHERE id=$category_id")->fetch_assoc();

// Fetch images sorted by 'display_order' (default 0)
$images = $conn->query("SELECT * FROM gulf_spectrum_images WHERE category_id=$category_id ORDER BY display_order ASC, id DESC");

// Handle order update
if(isset($_POST['update_order'])){
    foreach($_POST['order'] as $img_id => $order){
        $stmt = $conn->prepare("UPDATE gulf_spectrum_images SET display_order=? WHERE id=?");
        $stmt->bind_param("ii", $order, $img_id);
        $stmt->execute();
    }
    header("Location: manage_images.php?category_id=$category_id");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Manage Images - <?= htmlspecialchars($category['name']) ?></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
<style>
body {
    font-family: 'Inter', sans-serif;
    background: #f4f7fb;
    margin: 0;
    padding: 30px;
    color: #333;
}
h1 {
    color: #1E3A8A;
    margin-bottom: 20px;
}
a.add-btn, a.back-btn, button.update-order {
    display: inline-block;
    background: #1E90FF;
    color: #fff;
    padding: 10px 16px;
    border-radius: 6px;
    text-decoration: none;
    font-weight: 600;
    margin-bottom: 20px;
    margin-right: 10px;
    transition: 0.3s;
    cursor: pointer;
}
a.add-btn:hover, a.back-btn:hover, button.update-order:hover {
    background: #0d6efd;
}
.table-container {
    background: #fff;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    overflow-x: auto;
}
table {
    width: 100%;
    border-collapse: collapse;
    min-width: 900px;
}
th, td {
    padding: 14px;
    text-align: left;
    border-bottom: 1px solid #eee;
    vertical-align: middle;
}
th {
    background: #1E90FF;
    color: #fff;
    text-transform: uppercase;
    font-size: 14px;
}
tr:nth-child(even) { background: #f9fcff; }
tr:hover { background: #f0f8ff; }
td.description {
    max-width: 300px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
img.preview {
    max-width: 100px;
    border-radius: 6px;
    border: 1px solid #ddd;
}
.actions a {
    margin-right: 8px;
    text-decoration: none;
    padding: 6px 10px;
    border-radius: 4px;
    font-size: 13px;
    font-weight: 600;
    display: inline-block;
    transition: 0.3s;
}
.actions a.edit { background: #1E90FF; color: #fff; }
.actions a.delete { background: #dc3545; color: #fff; }
.actions a:hover { opacity: 0.85; }
input.order-input {
    width: 60px;
    padding: 5px 8px;
    border-radius: 5px;
    border: 1px solid #ccc;
    text-align: center;
}
</style>
</head>
<body>

<h1><i class="fa fa-images"></i> Images in <?= htmlspecialchars($category['name']) ?></h1>
<a href="index.php" class="back-btn"><i class="fa fa-arrow-left"></i> Back to Categories</a>
<a href="add_image.php?category_id=<?= $category_id ?>" class="add-btn"><i class="fa fa-plus"></i> Add New Image</a>

<form method="POST">
<div class="table-container">
<table>
    <tr>
        <th>Order</th>
        <th>ID</th>
        <th>Header</th>
        <th>Description</th>
        <th>Image</th>
        <th>Actions</th>
    </tr>
    <?php while($row = $images->fetch_assoc()): ?>
    <tr>
        <td>
            <input type="number" name="order[<?= $row['id'] ?>]" value="<?= $row['display_order'] ?>" class="order-input">
        </td>
        <td><?= $row['id'] ?></td>
        <td><?= htmlspecialchars($row['header']) ?></td>
        <td class="description" title="<?= htmlspecialchars($row['description']) ?>">
            <?= htmlspecialchars($row['description']) ?>
        </td>
        <td><img src="../../assets/gulfspectrum/<?= htmlspecialchars($row['image_name']) ?>" class="preview"></td>
        <td class="actions">
            <a href="edit_image.php?id=<?= $row['id'] ?>" class="edit"><i class="fa fa-edit"></i> Edit</a>
            <a href="delete_image.php?id=<?= $row['id'] ?>" class="delete" onclick="return confirm('Delete this image?')"><i class="fa fa-trash"></i> Delete</a>
        </td>
    </tr>
    <?php endwhile; ?>
</table>
</div>
<button type="submit" name="update_order" class="update-order"><i class="fa fa-sort"></i> Update Order</button>
</form>

</body>
</html>
"></i> <span>About ▾</span>
    </div>
    <div class="submenu" id="aboutMenu">
        <a href="#" onclick="loadPage('about/intro_header.php')">Introduction Title</a>
        <a href="#" onclick="loadPage('about/who_we_are.php')">Who We Are</a>
        <a href="#" onclick="loadPage('about/cards.php')">Manage Cards</a>
        <a href="#" onclick="loadPage('about/manage_vision.php')">Our Vision section</a>
    </div>

    <a href="#" onclick="loadPage('company_structure/company_locations.php')"><i class="fa-solid fa-building sidebar-icon"></i> <span>company_structure</span></a>

    <div class="menu-toggle" onclick="toggleSubmenu('corporateMenu')">
        <i class="fa-solid fa-briefcase sidebar-icon"></i> <span>Corporate Division ▾</span>
    </div>
    <div class="submenu" id="corporateMenu">
        <a href="#" onclick="loadPage('corporate_devision/first-section.php')">First Section</a>
        <a href="#" onclick="loadPage('corporate_devision/second_section.php')">Second Section</a>
        <a href="#" onclick="loadPage('corporate_devision/third_section.php')">Third Section</a>
        <a href="#" onclick="loadPage('corporate_devision/fourth_section.php')">Fourth Section</a>
        <a href="#" onclick="loadPage('corporate_devision/fifth_section.php')">Fifth Section</a>
    </div>

    <a href="#" onclick="loadPage('devision/devision.php')"><i class="fa-solid fa-sitemap sidebar-icon"></i> <span>our devision</span></a>

    <div class="menu-toggle" onclick="toggleSubmenu('servicesMenu')">
        <i class="fa-solid fa-cogs sidebar-icon sidebar-icon"></i> <span>services▾</span>
    </div>
    <div class="submenu" id="servicesMenu"> 
        <a href="#" onclick="loadPage('servicesPage/bg_service.php')">background_section</a> 
        <a href="#" onclick="loadPage('servicesPage/services_list.php')">Add services</a>
        <a href="#" onclick="loadPage('servicesPage/admin_cadd.php')">cad capabilites</a>
        <a href="#" onclick="loadPage('servicesPage/qulaity_profesional.php')">quality assurance</a>        
    </div>

    <div class="menu-toggle" onclick="toggleSubmenu('projectMenu')">
        <i class="fa-solid fa-diagram-project sidebar-icon sidebar-icon"></i> <span>projects▾</span>
    </div>
    <div class="submenu" id="projectMenu"> 
        <a href="#" onclick="loadPage('projects/background_image.php')">first section</a> 
        <a href="#" onclick="loadPage('projects/index.php')">add projects</a> 
    </div>

    <a href="#" onclick="loadPage('contact.php')"><i class="fa-solid fa-envelope sidebar-icon  sidebar-icon"></i> <span>all messages</span></a>
    <a href="#" onclick="loadPage('locate/locate.php')"><i class="fa-solid fa-map-marker-alt  sidebar-icon"></i> <span>add your locations</span></a>
    <a href="#" onclick="loadPage('teams/index.php')"><i class="fa-solid fa-users-gear  sidebar-icon"></i> <span>teams</span></a>
  <a href="#" class="sidebar-expand-link" onclick="loadPage('admin_applicants.php')"><i class="fa-solid fa-file-lines sidebar-icon"></i> <span>Applicants / CVs</span></a>


    <div class="menu-toggle" onclick="toggleSubmenu('spectrumMenu')">
        <i class="fa-solid fa-shield-alt  sidebar-icon"></i> <span>Management_policies▾</span>
    </div>
    <div class="submenu" id="spectrumMenu"> 
        <a href="#" onclick="loadPage('gulf_spectrum/index.php')">gulf_spectrum</a> 
        <a href="#" onclick="loadPage('spectrum/index.php')">spectrum</a>     
    </div>

    <div class="menu-toggle" onclick="toggleSubmenu('newsMenu')">
        <i class="fa-solid fa-newspaper  sidebar-icon"></i> <span>news▾</span>
    </div>
    <div class="submenu" id="newsMenu"> 
        <a href="#" onclick="loadPage('news/news_intro.php')">news_intro</a> 
        <a href="#" onclick="loadPage('news/index.php')">add_news</a>     
    </div>

    <a href="logout.php"><i class="fa-solid fa-right-from-bracket sidebar-icon"></i> <span>Logout</span></a>
</div>


  <div class="content" id="content">
<?php
// Default page
$page = isset($_GET['page']) ? $_GET['page'] : 'welcome.php';

?>
<iframe id="mainFrame" src="<?= htmlspecialchars($page) ?>"></iframe>
</div>


<script>
function toggleAdminDropdown() {
    const dropdown = document.getElementById('adminDropdown');
    if(dropdown.style.display === 'block'){
        dropdown.style.display = 'none';
    } else {
        dropdown.style.display = 'block';
        updateAdminDropdown(); // refresh dropdown content
    }
}

// Unified open function
function openAdminMessage(page, id, type) {
    // Open the page in iframe
    document.getElementById('mainFrame').src = page;

    // Mark as read depending on type
    let url = type === 'message' ? 'mark_notifcation.php' : 'mark_application_read.php';

    fetch(url, {
        method: 'POST',
        headers: {'Content-Type':'application/x-www-form-urlencoded'},
        body: 'id=' + id
    }).then(() => {
        // Decrease badge count immediately
        const badge = document.getElementById('adminNotificationBadge');
        let count = parseInt(badge.textContent);
        if(!isNaN(count) && count > 0){
            count--;
            if(count === 0){
                badge.style.display = 'none';
            } else {
                badge.textContent = count;
            }
        }

        // Refresh dropdown content
        updateAdminDropdown();
    });
}


// Select all icons that should trigger expansion
const sidebarIcons = document.querySelectorAll('.sidebar-icon');

sidebarIcons.forEach(icon => {
    icon.addEventListener('click', () => {
        const sidebar = document.getElementById("sidebar");
        const content = document.getElementById("content");
        sidebar.classList.add("expanded");
        content.classList.add("expanded");
    });
});


function updateAdminDropdown() {
    fetch('get_all_unread.php') // New endpoint returning combined messages & applications
        .then(res => res.json())
        .then(data => {
            const dropdown = document.getElementById('adminDropdown');
            const badge = document.getElementById('adminNotificationBadge');

            // Total unread count
            const totalUnread = data.messages.length + data.applications.length;
            badge.textContent = totalUnread;
            badge.style.display = totalUnread > 0 ? 'inline-block' : 'none';

            dropdown.innerHTML = '';

            if(totalUnread === 0){
                dropdown.innerHTML = '<div class="admin-dropdown-item">No new notifications</div>';
            } else {
                // Messages first
                data.messages.forEach(msg => {
                    const div = document.createElement('div');
                    div.className = 'admin-dropdown-item';
                    div.innerHTML = `<strong>${msg.name}</strong> 
                        (<a href="mailto:${msg.email}">${msg.email}</a>) 
                        - ${msg.subject}`;
                    div.onclick = () => openAdminMessage('contact.php?id=' + msg.id, msg.id, 'message');
                    dropdown.appendChild(div);
                });

                // Applications
                data.applications.forEach(app => {
                    const div = document.createElement('div');
                    div.className = 'admin-dropdown-item';
                    div.innerHTML = `<strong>${app.name}</strong> 
                        (<a href="mailto:${app.email}">${app.email}</a>) 
                        - Position: ${app.position}`;
                    div.onclick = () => openAdminMessage('admin_applicants.php?id=' + app.id, app.id, 'application');
                    dropdown.appendChild(div);
                });
            }
        })
        .catch(err => console.error(err));
}

// Optionally refresh every 30 seconds
setInterval(updateAdminDropdown, 30000);


    function loadPage(page){
      document.getElementById("mainFrame").src = page;
    }

    function toggleSidebar() {
      let sidebar = document.getElementById("sidebar");
      let content = document.getElementById("content");
      sidebar.classList.toggle("expanded");
      content.classList.toggle("expanded");
    }

    function toggleSubmenu(id) {
      let submenu = document.getElementById(id);
      submenu.style.display = (submenu.style.display === "block") ? "none" : "block";
    }
</script>

</body>
</html>    