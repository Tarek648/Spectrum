<?php
include 'config.php';

$sec = $conn->query("SELECT * FROM who_we_are_section LIMIT 1")->fetch_assoc();
$imagesResult = $conn->query("SELECT * FROM who_we_are_images ORDER BY position ASC");
$images = [];
while($img = $imagesResult->fetch_assoc()) { $images[$img['position']] = "./assets/about/".$img['image_name']; }
$vision = $conn->query("SELECT * FROM vision_section LIMIT 1")->fetch_assoc();


$cards = $conn->query("SELECT * FROM our_story_cards ORDER BY id ASC");
$section = $conn->query("SELECT * FROM our_story_section LIMIT 1")->fetch_assoc();

$home = $conn->query("SELECT * FROM home_section LIMIT 1")->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="style.css"/>
<link rel="stylesheet" href="./css/about.css"/>
  <title>About Us</title>
</head>
<body>
  <header> <?php include('header.php');?></header>

<div id="home">
  <div class="hero-container">

    <div class="hero-content">
      <h1 class="hero-first reveal" id="first">
        <?= htmlspecialchars($home['first_heading'] ?? 'Engineering Innovation') ?>
        <span class="highlight-word">Spectrum</span>
      </h1>

      <div class="hero-subline reveal">
        <h1 id="special"><?= htmlspecialchars($home['special_heading'] ?? 'Delivering') ?></h1>
        <div class="subline-accent"></div>
        <h1><?= htmlspecialchars($home['last_heading'] ?? 'Excellence') ?></h1>
      </div>
    </div>

  </div>
</div>




<div class="who-we-are-section">
   <div class="who-we-are-header">
       <h4 class="highlight-letters"><?= htmlspecialchars($sec['section_title'] ?? '') ?></h4>
       <h2 class="highlight-letters"><?= htmlspecialchars($sec['section_subtitle'] ?? '') ?></h2>
   </div>
   <div class="line"></div>
   <div class="about-us">
       <div id="imagery">
           <div id="imagelef">
               <h3><?= htmlspecialchars($sec['left_text'] ?? '') ?></h3>
           </div>
           <div id="imgrig">
               <?php foreach($images as $pos => $imgPath): ?>
                   <div class="imgcntr" data-pos="<?= $pos ?>" style="background-image: url('<?= $imgPath ?>');"></div>
               <?php endforeach; ?>
           </div>
       </div>
   </div>
</div>


    
<div class="our-story-modern">

  <!-- Header -->
  <div class="our-story-modern-header">
    <span class="story-subtitle"><?= htmlspecialchars($section['section_title']) ?></span>
    <h2 class="story-title"><?= htmlspecialchars($section['section_subtitle']) ?></h2>
    <p class="story-desc"><?= htmlspecialchars($section['section_paragraph']) ?></p>
  </div>

  <!-- Timeline Wrapper -->
  <div class="story-timeline">

    <?php 
    $index = 0;
    while ($card = $cards->fetch_assoc()): 
      $isEven = $index % 2 === 0;
    ?>
    
      <div class="story-block <?= $isEven ? 'left' : 'right' ?>">

        <!-- Floating Image -->
        <div class="story-img-box">
          <img src="./assets/about/<?= htmlspecialchars($card['image_path']) ?>" 
               alt="<?= htmlspecialchars($card['title']) ?>">
        </div>

        <!-- Text Content -->
        <div class="story-text-box">
          <div class="story-line"></div>
          <span class="story-count"><?= str_pad($index + 1, 2, "0", STR_PAD_LEFT) ?></span>
          <h3><?= htmlspecialchars($card['title']) ?></h3>
          <p><?= htmlspecialchars($card['description']) ?></p>
        </div>

      </div>

    <?php 
      $index++;
    endwhile; 
    ?>
    
  </div>
</div>

<div id="vision-section">
  <div class="vision-header">
    <h1 class="vision-title">
      VIS<span>I</span>ON
    </h1>
  </div>

  <div class="vision-content">
    <div class="vision-box">
      <h4><?= htmlspecialchars($vision['heading'] ?? '') ?></h4>
      <h3><?= htmlspecialchars($vision['subheading'] ?? '') ?></h3>
    </div>
  </div>

</div>



 <?php include('footer.php');?>
    <script src="about.js"></script>
    <script src="./js/style.js"></script>
</body>
</html>