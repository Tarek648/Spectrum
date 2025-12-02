
<?php
$result = $conn->query("SELECT * FROM footer_content WHERE id=1");
$footer = $result->fetch_assoc();

$footer_result = $conn->query("SELECT setting_key, setting_value FROM navbar");
$footer_contact = [];
if ($footer_result && $footer_result->num_rows > 0) {
    while ($row = $footer_result->fetch_assoc()) {
        $footer_contact[$row['setting_key']] = $row['setting_value'];
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/footer.css" />

  <title>Document</title>
</head>


<body>
<div class="footer-container">
    <div class="footer-container-first">
        <div class="footer-container-first-grid">
            <!-- Logo -->
            <div class="logo-image">
                <a href="./index.php">
                    <img src="./assets/home/<?= $footer['logo'] ?>" alt="Spectrum Logo">
                </a>
            </div>

            <!-- Services -->
            <div class="footer-services">
                <h4>Our Services</h4>
                <ul class="footer-services-list">
                    <li><a href="about.php"><span class="circle"></span>Architectural</a></li>
                    <li><a href="about.php"><span class="circle"></span>Mechanical Engineering</a></li>
                    <li><a href="about.php"><span class="circle"></span>Transportation Planning</a></li>
                </ul>
            </div>

            <!-- Get in touch -->
            <div class="get_in_touch">
                <h4>Contact</h4>
                <ul>
                    <li class="footer-info">
                        <a class="get_in_touch_content" href="mailto:<?= htmlspecialchars($footer_contact['email'] ?? '') ?>">
                            <i class="fa-regular fa-envelope"></i><?= htmlspecialchars($footer_contact['email'] ?? 'email') ?>
                        </a>
                    </li>
                    <li class="footer-info">
                        <a class="get_in_touch_content" href="tel:<?= htmlspecialchars($footer_contact['phone'] ?? '') ?>">
                            <i class="fa-solid fa-phone-volume"></i><?= htmlspecialchars($footer_contact['phone'] ?? 'phone') ?>
                        </a>
                    </li>
                    <li class="footer-info get_in_touch_content">
                        <i class="fa-regular fa-clock"></i><?= htmlspecialchars($footer_contact['working_hours'] ?? 'Mon-Fri') ?>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Bottom Section -->
    <div class="last-section">
        <div class="last-section-container">
            <p>©2025, Spectrum Engineering Consultant. All Rights Reserved.</p>
            <div class="last-section-right">
                <p>Privacy Policy</p>
                <p>Terms & Conditions</p>
            </div>
        </div>
    </div>
</div>

</body>

</html>





