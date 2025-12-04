<?php
include './config.php';


$sql = "
  SELECT 
    l.id, l.city, l.country, l.image_path,
    COUNT(d.id) AS departments_count,
    COALESCE(SUM(d.people_count), 0) AS staff_count
  FROM locations l
  LEFT JOIN departments d ON d.location_id = l.id
  GROUP BY l.id
  ORDER BY l.city ASC
";

$result = mysqli_query($conn, $sql);

$locations = [];
while ($row = mysqli_fetch_assoc($result)) {
  $locations[] = $row;
}

$totalStaff = 0;
$officeCount = count($locations);
$countries = [];

foreach ($locations as $loc) {
    $totalStaff += $loc['staff_count'];
    $countries[] = $loc['country'];
}
$uniqueCountries = count(array_unique($countries));

$result = $conn->query("SELECT * FROM company_structure WHERE id = 1");
$company = $result->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>company structure </title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100..900&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="./css/structure.css" />


</head>
<body>
   <?php include('header.php') ;?>

<div class="company-structure-bg" style="
    background-image: url('./assets/structure/<?= $company['background_image'] ?>');
">
    <div class="overlay"></div>

    <div class="company-structure-glass">

        <h1><?= $company['heading'] ?></h1>
        <p><?= $company['description'] ?></p>

        <div class="structure-stats">

            <!-- Staff -->
            <div class="stat-item">
                <h3>Total Staff</h3>

                <div class="stat-line">
                    <strong id="staffCount" data-target="<?= $totalStaff ?>">0</strong>
                </div>

                <div class="stat-bar blue">
                    <div class="bar-fill"></div>
                </div>
            </div>

            <div class="stat-item">
                <h3>Office Locations</h3>

                <div class="stat-line">
                    <strong id="officeCount" data-target="<?= $officeCount ?>">0</strong>
                </div>

                <div class="stat-bar gold">
                    <div class="bar-fill"></div>
                </div>
            </div>

            <div class="stat-item">
                <h3>Countries</h3>

                <div class="stat-line">
                    <strong id="countryCount" data-target="<?= $uniqueCountries ?>">0</strong>
                </div>

                <div class="stat-bar green">
                    <div class="bar-fill"></div>
                </div>
            </div>

        </div>
    </div>
</div>


<section id="locations">
  <div class="locations-container">

    <div class="locations-head">
      <h1>Office Locations</h1>
      <p>Strategic locations across Middle East, Central Asia, and North America</p>
    </div>

    <div class="location-cards">
      <?php foreach ($locations as $loc): ?>
      <div class="location-card" data-location-id="<?= $loc['id'] ?>">
        <div class="card-bg" style="background-image: url('./assets/structure/<?= htmlspecialchars($loc['image_path']) ?>');"></div>
        <div class="card-glass">
          <div class="location-header">
            <i class="ri-map-pin-line"></i>
            <h2><?= htmlspecialchars($loc['city']) ?></h2>
          </div>
          <p class="country"><?= htmlspecialchars($loc['country']) ?></p>
          <div class="stats">
            <div class="stat-item">
              <h3>Staff</h3>
              <strong data-target="<?= $loc['staff_count'] ?>">0</strong>
            </div>
            <div class="stat-item">
              <h3>Departments</h3>
              <strong data-target="<?= $loc['departments_count'] ?>">0</strong>
            </div>
          </div>
          <p class="detail-link" data-location-id="<?= $loc['id'] ?>">View Details</p>
        </div>
      </div>
      <?php endforeach; ?>
    </div>
  </div>

  <!-- Popup -->
  <div class="popup" id="locationPopup">
    <div class="popup-overlay"></div>
    <div class="popup-content">
      <span class="close-btn" id="popupClose">&times;</span>
      <div class="popup-image" id="popupImage"></div>
      <div class="popup-details" id="popupDetails"></div>
    </div>
  </div>
</section>

   <?php include('footer.php');?>
   <script src="./js/style.js"></script> 
   <script src="./js/structure.js"></script> 
   <script src="footer.js"></script>
   

   
</body>
</html>