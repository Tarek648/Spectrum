<?php
include './config.php'; // adjust path if needed
$servicess = $conn->query("SELECT * FROM services_cards ORDER BY created_at DESC");


$res = $conn->query("SELECT * FROM services_background_image WHERE id=1");
$da = $res->fetch_assoc();



$section = $conn->query("SELECT * FROM cadd_section LIMIT 1")->fetch_assoc();

// Fetch CAD columns
$columns = $conn->query("SELECT * FROM cadd_columns WHERE cadd_section_id={$section['id']}");


$sections = $conn->query("SELECT * FROM sections");
$sectionsData = [];
while($row = $sections->fetch_assoc()) {
    $sectionsData[$row['section_id']] = $row;
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="./css/services.css">

</head>
<body>
    <?php include('header.php') ?>
<section id="first-part"> 
<div class="services-first-part" 
     style="background: url('./assets/service_page_uploads/<?php echo $da['background_image']; ?>') center center / cover no-repeat;">

    <div class="overlay"></div> 
    <div class="services-text">
      <div class="services-first-line"> 
        <div class="line"></div>
        <h1>Our services</h1>
      </div>
      <p><?php echo $da['description']; ?></p>
    </div>
  </div>
</section>

 <section id="second-part">
  <div class="second-service">
     <div class="service-text">
         <h1>Our Services</h1>
         <p>The firm's staff is specialized in the following areas & services:</p>
     </div>

     <div class="service-cards">
        <?php while($service = $servicess->fetch_assoc()): ?>
            <div class="service-card1">
                <div class="image-service-section">
                  <img src="./assets/service_page_uploads/<?php echo $service['image']; ?>" alt="<?php echo $service['title']; ?>">
                   <div class="line-image"></div>
                </div>
                
                <div class="service-card-text">
                    <h1><?php echo $service['title']; ?></h1>
                    <p><?php echo $service['short_desc']; ?></p>
                    <div class="view-more">
                       <a href="detail.php?id=<?php echo $service['detail_page_id']; ?>">view more</a>
                       <div>➔</div>
                    </div>
                </div>
            </div>
        <?php endwhile; ?>
     </div>
  </div>
</section> 

<section id="third-part">
    <div class="third-part-header">
        <h1><?= $sectionsData['third-part']['header'] ?></h1>
        <p><?= nl2br($sectionsData['third-part']['content']) ?></p>
    </div>
</section> 

<section id="fourth-part">
    <div class="fourth-container">
        <div class="cad-text-container">
            <div class="cadd-text">
                <div class="cadd-text-one">
                    <h1><?= htmlspecialchars($section['header']) ?></h1>
                    <p><?= nl2br(htmlspecialchars($section['description'])) ?></p>
                </div>

                <div class="cad-text-two">
                    <?php
                    $i = 0;
                    echo '<div class="cad-column">';
                    while($col = $columns->fetch_assoc()) {
                        echo "<h3><span class='circle'></span> ".htmlspecialchars($col['text'])."</h3>";
                        $i++;
                        if($i % 2 == 0) echo '</div><div class="cad-column">';
                    }
                    echo '</div>';
                    ?>
                </div>
            </div>
        </div>

        <div class="cadd-image">
            <img src="./assets/service_page_uploads/<?= htmlspecialchars($section['image']) ?>" alt="CADD Image">
        </div>
    </div>
</section> 

<!-- <section class="qa-section">
  <h2><?= $sectionsData['qa-section']['header'] ?></h2>
  <p><?= nl2br($sectionsData['qa-section']['content']) ?></p>
</section> -->


<script src="./js/style.js"></script>  

<?php include ('footer.php');?>

<script src="footer.js"></script>
</body>
</html>