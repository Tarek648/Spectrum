<?php
include './config.php';

$slides = [];
$res = $conn->query("SELECT * FROM slider_items WHERE is_active = 1 ORDER BY sort_order ASC, id ASC");
if ($res)
  $slides = $res->fetch_all(MYSQLI_ASSOC);

$setting = $conn->query("SELECT show_side_slides FROM slider_settings WHERE id = 1")->fetch_assoc();
$showSideSlides = $setting ? (int) $setting['show_side_slides'] : 1;

$sql = "SELECT sc.id, sc.title, sc.short_desc, sc.image
        FROM services_cards sc
        WHERE sc.show_on_homepage = 1
        ORDER BY sc.id ASC";
$result = $conn->query($sql);
$services = [];
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $services[] = $row;
  }
}

$s = "SELECT * FROM projects WHERE show_on_home = 1 LIMIT 6";
$r = $conn->query($s);

$left_cards = [];
$result = $conn->query("SELECT * FROM left_cards ORDER BY id ASC");
while ($row = $result->fetch_assoc()) {
  $left_cards[] = $row;
}

$about_section = [];
$result = $conn->query("SELECT * FROM about_section LIMIT 1");
if ($row = $result->fetch_assoc()) {
  $about_section = $row;
}

$right_points = [];
$result = $conn->query("SELECT * FROM right_points ORDER BY id ASC");
while ($row = $result->fetch_assoc()) {
  $right_points[] = $row;
}

$right_cards = [];
$result = $conn->query("SELECT * FROM right_cards ORDER BY id ASC");
while ($row = $result->fetch_assoc()) {
  $right_cards[] = $row;
}

$query = "SELECT * FROM locations WHERE show_on_home = 1 ORDER BY id DESC";
$company = mysqli_query($conn, $query);

$sliderNews = $conn->query("
    SELECT n.id, n.title, n.image, n.date_day, n.date_month, n.date_year,
           s.content AS description
    FROM news_cards n
    LEFT JOIN news_sections s 
        ON n.id = s.news_id AND s.section_order = 1
    WHERE n.show_on_home = 1
    ORDER BY n.date_year DESC, n.date_month DESC, n.date_day DESC
    LIMIT 5
");

$headers = [];
$res = $conn->query("SELECT section, header, description FROM homepage_content");
while ($row = $res->fetch_assoc()) {
  $headers[$row['section']] = $row;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- CRITICAL: Preconnect to image domains -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="dns-prefetch" href="https://cdnjs.cloudflare.com">

  <!-- CRITICAL: Preload hero image only -->
  <?php if (!empty($slides[0]['image_path'])): ?>
    <link rel="preload" as="image" href="./assets/home/<?= htmlspecialchars($slides[0]['image_path']) ?>">
  <?php endif; ?>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="./css/index.css" />

  <title>Spectrum</title>
</head>

<body>

  <div id="preloader">
    <div class="split top"></div>
    <div class="split bottom"></div>
    <div class="preloader-content">
      <h1>SPECTRUM</h1>
      <p>Lebanon</p>
    </div>
  </div>

  <?php include('header.php'); ?>

  <!-- HERO CAROUSEL -->
  <div class="carousel <?php if ($showSideSlides)
    echo 'with-sides'; ?>" style="z-index: 888;">
    <div class="list">

      <?php if (!$slides): ?>
        <div class="item" style="background-color:#ccc;">
          <div class="content">No slides yet.</div>
        </div>

      <?php else: ?>
        <?php foreach ($slides as $index => $s): ?>
          <div class="item <?= $index === 0 ? 'active' : '' ?>">

            <img class="carousel-bg-image" src="./assets/home/<?= htmlspecialchars($s['image_path']) ?>"
              alt="<?= htmlspecialchars($s['title']) ?>" <?= $index === 0 ? '' : 'loading="lazy"' ?> decoding="async">

            <div class="content">
              <p><?= str_pad($index + 1, 2, '0', STR_PAD_LEFT) ?>/<?= count($slides) ?></p>
              <div class="title"><?= htmlspecialchars($s['title']) ?></div>
              <div class="des"><?= htmlspecialchars($s['description']) ?></div>
              <div class="btn">
                <a id="btn1" href="about.php">about us</a>
              </div>
            </div>

          </div>
        <?php endforeach; ?>
      <?php endif; ?>

    </div>

    <div class="arrows">
      <button class="prev">&laquo;</button>
      <button class="next">&raquo;</button>
    </div>
  </div>




  <!-- WHO WE ARE SECTION (OPTIMIZED) -->
<div class="who-we-are-section">
  <div class="who-we-section">

    <!-- LEFT IMAGES -->
    <div class="who-left">
      <div class="image-stack">
        <div class="img-card img-1">
          <img src="./assets/home/<?= $left_cards[0]['image1'] ?>" alt="">
        </div>
        <div class="img-card img-2">
          <img src="./assets/home/<?= $left_cards[0]['image2'] ?? 'fallback-bottom.jpg' ?>" alt="">
        </div>
      </div>
      <div class="overlay-card">
        <h2><?= $left_cards[0]['title'] ?? '20+' ?></h2>
        <p>Years Experience</p>
      </div>
    </div>

    <!-- RIGHT TEXT -->

      <div class="right-section">
        <div class="right-section-container">

          <div class="right-section-text">
            <p><?= $about_section['subheading'] ?? 'about us' ?></p>
            <h1><?= $about_section['heading'] ?? 'Reliable and excellence company' ?></h1>
            <p><?= $about_section['description'] ?? 'Your company description goes here.' ?></p>
          </div>

          <div class="right-points">
            <p><?= $about_section['intro_text'] ?? '' ?></p>

            <div class="right-points-grid">
              <?php foreach ($right_points as $point): ?>
                <div class="right-point">
                  <img loading="lazy" decoding="async" class="check-mark" src="./images/checked (2).png" alt="">
                  <p><?= $point['text'] ?></p>
                </div>
              <?php endforeach; ?>
            </div>

          </div>

          <div class="right-cards">
            <div class="right-cards-container">
              <?php foreach ($right_cards as $card): ?>
                <div class="who-cards">
                  <h2><?= $card['title'] ?></h2>
                  <p><?= $card['description'] ?></p>
                </div>
              <?php endforeach; ?>
            </div>
          </div>

          <a href="./about.php" id="btn">know more</a>

        </div>
      </div>

  </div>
</div>


  <!-- SERVICES -->
  <div class="services-container">
    <div class="service-image-sliderOne">
      <div class="swiper-wrapper">
        <?php foreach ($services as $index => $service): ?>
          <div class="swiper-slide <?= $index === 0 ? 'active' : '' ?>" data-index="<?= $index ?>">
            <div class="img-cover">
              <img loading="lazy" src="./assets/service_page_uploads/<?= $service['image'] ?>"
                alt="<?= $service['title'] ?>">
            </div>
          </div>
        <?php endforeach; ?>
      </div>
    </div>
    <div class="services-content">
      <div class="services-content-wrap">
        <div class="services-Left">
          <p>our services</p>
          <h1 class="highlight-letters"><?= htmlspecialchars($headers['services']['header']) ?></h1>
        </div>
        <div class="services-right">
          <div class="services-list-container">
            <div class="services-list-wrapper">
              <?php foreach ($services as $index => $service): ?>
                <div class="service-item <?= $index === 0 ? 'active' : '' ?>">
                  <div class="slider-item" data-index="<?= $index ?>">
                    <h4><?= $service['title'] ?></h4>
                    <p><?= $service['short_desc'] ?></p>
                  </div>
                </div>
              <?php endforeach; ?>
            </div>
          </div>
          <div class="top-right">
            <div class="top-label">
              <p>1/<?= count($services) ?></p>
            </div>
            <div class="top-right-arrow">
              <i class="fa-solid fa-arrow-left left"></i>
              <i class="fa-solid fa-arrow-right right"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- COMPANY SPECTRUM -->
<div class="company-spectrum-locations">
  <div class="company-spectrum-header">
    <div class="company-header-container">
      <div class="company-left">
        <h6>company structure</h6>
        <h3 class="highlight-letters red">
          <?= htmlspecialchars($headers['structure']['header']) ?>
        </h3>
      </div>
      <p class="right-spectrum">
        <?= htmlspecialchars($headers['structure']['description']) ?>
      </p>
    </div>
  </div>

  <div class="structure-timeline">
    <?php 
      $index = 0;
      mysqli_data_seek($company, 0);
      while ($loc = mysqli_fetch_assoc($company)) { 
        $isEven = $index % 2 === 0;
    ?>
      <div class="structure-block <?= $isEven ? 'left-block' : 'right-block' ?>">
        <div class="structure-image">
          <img loading="lazy" src="./assets/structure/<?= htmlspecialchars($loc['image_path']) ?>" alt="<?= htmlspecialchars($loc['country']) ?>">
        </div>
        <div class="structure-info">
          <h4><?= htmlspecialchars($loc['country']) ?></h4>
        </div>
      </div>
    <?php 
      $index++;
      } 
    ?>
  </div>

  <a href="./structure.php" id="btn" class="spectrum-btn">discover all</a>
</div>




  <!-- PROJECTS -->
  <div class="project-section">
    <div class="project-section-wrapper">
      <div class="text">
        <p class="title">our projects</p>
        <h1 class="header"><?= htmlspecialchars($headers['projects']['header']) ?></h1>
      </div>
      <div class="project-card-container">
        <div class="project-cards">
          <?php while ($row = $r->fetch_assoc()): ?>
            <div class="cardOne">
              <div class="project-image">
                <img loading="lazy" src="./assets/projects_uploads/<?= htmlspecialchars($row['image_path']); ?>"
                  alt="<?= htmlspecialchars($row['name']); ?>">
              </div>
              <h4><?= htmlspecialchars($row['name']); ?></h4>
              <p>
                <?php if (!empty($row['location_url'])): ?>
                  <a href="<?= htmlspecialchars($row['location_url']) ?>" target="_blank" style="text-decoration:none">
                    <i class="fas fa-map-marker-alt" style="color: #e74c3c;"></i>
                  </a>
                <?php else: ?>
                  <i class="fas fa-map-marker-alt" style="display: none"></i>
                <?php endif; ?>
                <?= htmlspecialchars($row['location']) ?>
              </p>
            </div>
          <?php endwhile; ?>
        </div>
        <a href="./projects.php" id="btn" class="center">discover more</a>
      </div>
    </div>
  </div>

  <!-- NEWS -->
<div class="company-news">
  <div class="company-news-header">
    <h6>latest news</h6>
    <h3 class="highlight-letters"><?= htmlspecialchars($headers['news']['header']) ?></h3>
  </div>

  <div class="news-slider-wrapper-container">
    <button class="news-arrow left">&lt;</button>
    <div class="news-slider-structure">
      <div class="news-slider-container">
        <div class="news-slider-wrapper">
          <?php if ($sliderNews->num_rows == 0) {
            echo "<p style='color:red;'>NO NEWS FOUND</p>";
          } ?>

          <?php while ($news = $sliderNews->fetch_assoc()):
            $monthName = date('M', mktime(0, 0, 0, $news['date_month'], 10));
            ?>
            <div class="gray">
              <div class="news-single-container">
                <h2><?= htmlspecialchars($news['title']) ?></h2>
                <p><?= $news['date_day'] . ' ' . $monthName . ' ' . $news['date_year'] ?></p>
                <p><?= htmlspecialchars(substr($news['description'], 0, 200)) ?>...</p>
                <a href="news_details.php?id=<?= $news['id'] ?>">Read More</a>
              </div>
            </div>
          <?php endwhile; ?>
        </div>
      </div>
    </div>
    <button class="news-arrow right">&gt;</button>
  </div>
</div>


  <div class="final-spectrum-page">
    <div class="final-section">
      <div class="final-spectrum-left">
        <div class="final-flex-spectrum">
          <div class="spectrum-icon">
            <svg width="129" height="134" viewBox="0 0 129 134" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path
                d="M11.3998 25.4L18.5998 33.5L17.5998 35.1L9.6998 32.8L15.1998 38.9L14.1998 40.5L3.7998 37.5L4.7998 36L13.1998 38.6L7.1998 32.1L8.1998 30.5L16.4998 33.1L10.4998 26.8L11.3998 25.4Z"
                fill="black"></path>
              <path
                d="M17.7996 20.9L19.8996 23.1L22.4996 20.6L23.4996 21.6L20.8996 24.1L23.0996 26.4L25.9996 23.6L26.9996 24.6L22.8996 28.6L15.5996 21.2L19.6996 17.2L20.6996 18.2L17.7996 20.9Z"
                fill="black"></path>
              <path
                d="M40.0997 10.9C40.6997 11.2 41.0997 11.6 41.3997 12.1C41.5997 12.6 41.6997 13.1 41.6997 13.6C41.5997 14.1 41.3997 14.6 41.0997 15C40.6997 15.5 40.2997 15.8 39.5997 16.1L35.8997 18L31.1997 8.69999L34.7997 6.89999C35.3997 6.59999 35.9997 6.39999 36.5997 6.39999C37.1997 6.39999 37.6997 6.49999 38.0997 6.69999C38.4997 6.89999 38.7997 7.29999 39.0997 7.69999C39.3997 8.19999 39.4997 8.79999 39.2997 9.29999C39.1997 9.79999 38.8997 10.3 38.4997 10.7C38.9997 10.6 39.5997 10.6 40.0997 10.9ZM34.6997 11.8L36.5997 10.8C37.0997 10.5 37.3997 10.2 37.5997 9.89999C37.7997 9.49999 37.6997 9.09999 37.4997 8.69999C37.2997 8.29999 36.9997 8.09999 36.5997 7.99999C36.1997 7.89999 35.6997 7.99999 35.1997 8.19999L33.2997 9.19999L34.6997 11.8ZM39.8997 14C40.0997 13.6 39.9997 13.2 39.7997 12.7C39.5997 12.2 39.1997 12 38.7997 11.9C38.3997 11.8 37.8997 11.9 37.3997 12.1L35.3997 13.1L36.8997 16L38.9997 15C39.3997 14.7 39.6997 14.4 39.8997 14Z"
                fill="black"></path>
              <path
                d="M45.7998 4.00001L46.5998 7.00001L50.0998 6.00001L50.4998 7.30001L46.9998 8.30001L47.8998 11.4L51.7998 10.3L52.1998 11.6L46.6998 13.1L43.7998 3.20001L49.2998 1.70001L49.6998 3.00001L45.7998 4.00001Z"
                fill="black"></path>
              <path d="M58.1 9.39999L61.6 8.99999L61.7 10.4L56.5 10.9L55.5 0.499988L57.2 0.299988L58.1 9.39999Z"
                fill="black"></path>
              <path d="M67.8998 0.1L67.4998 10.5L65.7998 10.4L66.1998 0L67.8998 0.1Z" fill="black"></path>
              <path
                d="M75.5997 2.30001L74.9997 5.30001L78.5997 6.00001L78.2997 7.40001L74.7997 6.70001L74.1997 9.80001L78.1997 10.6L77.8997 12L72.1997 10.9L74.1997 0.600006L79.8997 1.70001L79.5997 3.10001L75.5997 2.30001Z"
                fill="black"></path>
              <path d="M94.4 6.90001L86.8 15L85 14.3L85.3 3.20001L87 3.80001L86.6 13L92.8 6.20001L94.4 6.90001Z"
                fill="black"></path>
              <path
                d="M100 11.9L98.3 14.4L101.3 16.4L100.5 17.6L97.5 15.6L95.7 18.2L99.1 20.5L98.3 21.7L93.5 18.5L99.3 9.79999L104.1 13L103.3 14.2L100 11.9Z"
                fill="black"></path>
              <path d="M115.5 23.8L107.6 30.6L106.5 29.3L114.4 22.5L115.5 23.8Z" fill="black"></path>
              <path
                d="M115 41.6L114.1 40.1L118.1 31.7L111.4 35.7L110.5 34.2L119.5 28.8L120.4 30.3L116.4 38.7L123.1 34.7L124 36.2L115 41.6Z"
                fill="black"></path>
              <path
                d="M1.89984 95.3L2.99984 92.9C2.69984 92.5 2.49984 92.1 2.29984 91.6C1.89984 90.7 1.79984 89.8 1.89984 88.9C1.99984 88 2.39984 87.1 2.89984 86.4C3.49984 85.7 4.19984 85.1 5.19984 84.7C6.09984 84.3 7.09984 84.2 7.99984 84.3C8.89984 84.4 9.79984 84.8 10.4998 85.4C11.1998 86 11.7998 86.7 12.0998 87.6C12.4998 88.5 12.5998 89.4 12.4998 90.4C12.3998 91.3 11.9998 92.2 11.4998 92.9C10.8998 93.6 10.1998 94.2 9.19984 94.6C8.29984 95 7.39984 95.1 6.59984 95C5.69984 94.9 4.89984 94.6 4.19984 94.1L2.69984 97.4L1.89984 95.3ZM4.19984 87.5C3.79984 88 3.49984 88.6 3.39984 89.2C3.29984 89.8 3.39984 90.4 3.59984 91.1C3.89984 91.7 4.19984 92.3 4.69984 92.6C5.19984 93 5.79984 93.2 6.39984 93.3C7.09984 93.4 7.69984 93.3 8.49984 93C9.19984 92.7 9.79984 92.3 10.1998 91.8C10.5998 91.3 10.8998 90.7 10.9998 90.1C11.0998 89.5 10.9998 88.9 10.6998 88.2C10.3998 87.6 10.0998 87 9.59984 86.7C9.19984 86.2 8.59984 86 7.99984 86C7.29984 85.9 6.69984 86 5.99984 86.3C5.19984 86.6 4.59984 87 4.19984 87.5Z"
                fill="black"></path>
              <path
                d="M16.9997 97.3L11.5997 101.1C10.9997 101.6 10.5997 102.1 10.4997 102.6C10.3997 103.2 10.5997 103.8 10.9997 104.4C11.3997 105 11.8997 105.4 12.4997 105.5C13.0997 105.6 13.6997 105.4 14.2997 105L19.6997 101.2L20.6997 102.6L15.2997 106.4C14.5997 106.9 13.8997 107.2 13.1997 107.2C12.4997 107.2 11.8997 107.1 11.2997 106.7C10.6997 106.4 10.1997 105.9 9.79968 105.3C9.39968 104.7 9.09968 104 8.99968 103.4C8.89968 102.7 8.99968 102.1 9.19968 101.4C9.49968 100.8 9.99968 100.2 10.6997 99.7L16.0997 95.9L16.9997 97.3Z"
                fill="black"></path>
              <path
                d="M22.6997 116.2L19.4997 113.3L17.4997 114.4L16.1997 113.2L25.9997 107.9L27.4997 109.2L23.2997 119.5L21.9997 118.3L22.6997 116.2ZM23.2997 114.9L25.2997 110.2L20.7997 112.7L23.2997 114.9Z"
                fill="black"></path>
              <path
                d="M30.2996 122.5L33.2996 124.3L32.5996 125.5L28.0996 122.8L33.4996 113.9L34.9996 114.8L30.2996 122.5Z"
                fill="black"></path>
              <path d="M43.2 119L39.1 128.6L37.5 127.9L41.6 118.3L43.2 119Z" fill="black"></path>
              <path
                d="M54.0997 122.3L53.7997 123.7L51.0997 123L48.8997 131.8L47.1997 131.4L49.3997 122.6L46.6997 121.9L46.9997 120.5L54.0997 122.3Z"
                fill="black"></path>
              <path
                d="M65.7997 123.2L61.9997 129.7L61.7997 133.5L60.0997 133.4L60.2997 129.6L57.1997 122.8L59.0997 122.9L61.2997 128.1L63.9997 123.1L65.7997 123.2Z"
                fill="black"></path>
              <path
                d="M88.9998 118L89.2998 128.9L87.4998 129.5L82.8998 122.7L83.1998 130.9L81.3998 131.5L75.2998 122.5L76.9998 121.9L81.6998 129.3L81.2998 120.5L83.0998 119.9L87.7998 127.2L87.1998 118.5L88.9998 118Z"
                fill="black"></path>
              <path
                d="M98.9999 123.2C98.0999 123.3 97.1999 123.1 96.2999 122.7C95.4999 122.3 94.6999 121.7 94.1999 120.8C93.6999 119.9 93.2999 119.1 93.2999 118.1C93.1999 117.2 93.3999 116.3 93.7999 115.4C94.1999 114.5 94.7999 113.9 95.5999 113.3C96.3999 112.8 97.2999 112.4 98.1999 112.4C99.0999 112.3 99.9999 112.5 100.9 112.9C101.7 113.3 102.4 113.9 103 114.8C103.6 115.7 103.9 116.5 103.9 117.5C104 118.4 103.8 119.3 103.4 120.2C103 121 102.4 121.7 101.5 122.3C100.8 122.8 99.9999 123.1 98.9999 123.2ZM102.1 119.6C102.4 119 102.5 118.4 102.4 117.8C102.3 117.1 102.1 116.5 101.6 115.9C101.2 115.3 100.7 114.8 100.1 114.5C99.4999 114.2 98.8999 114.1 98.2999 114.1C97.6999 114.1 97.0999 114.4 96.4999 114.7C95.8999 115 95.4999 115.6 95.1999 116.1C94.8999 116.7 94.7999 117.3 94.8999 117.9C94.9999 118.6 95.1999 119.2 95.5999 119.8C95.9999 120.4 96.4999 120.9 97.0999 121.2C97.6999 121.5 98.2999 121.7 98.8999 121.6C99.4999 121.6 100.1 121.3 100.7 121C101.3 120.7 101.8 120.2 102.1 119.6Z"
                fill="black"></path>
              <path
                d="M114.3 111.1L109.6 110L108.7 111L111.7 113.9L110.5 115.1L102.9 108L105.4 105.4C105.9 104.8 106.5 104.4 107.1 104.2C107.7 104 108.2 103.9 108.8 104.1C109.3 104.2 109.8 104.5 110.2 104.9C110.7 105.4 111 105.9 111.1 106.6C111.2 107.3 111.1 108 110.7 108.7L115.6 109.8L114.3 111.1ZM107.7 110L109 108.6C109.4 108.1 109.7 107.7 109.6 107.2C109.6 106.7 109.4 106.3 109 106C108.6 105.6 108.2 105.5 107.7 105.5C107.2 105.5 106.8 105.8 106.4 106.2L105.1 107.6L107.7 110Z"
                fill="black"></path>
              <path
                d="M122.6 99.6L116.5 100.6L120.5 103L119.6 104.5L110.7 99.1L111.6 97.6L115.7 100.1L113.7 94.2L114.8 92.4L116.9 99L123.7 97.8L122.6 99.6Z"
                fill="black"></path>
              <path
                d="M126.4 90.8C126 91.2 125.5 91.5 125 91.7C124.5 91.9 123.9 91.8 123.4 91.6L124 89.9C124.4 90 124.8 90 125.2 89.8C125.6 89.6 125.9 89.2 126.1 88.7C126.3 88.1 126.3 87.7 126.2 87.3C126 86.9 125.8 86.6 125.3 86.5C125 86.4 124.7 86.4 124.4 86.5C124.1 86.6 123.9 86.8 123.7 87C123.5 87.2 123.2 87.6 122.9 88.1C122.5 88.7 122.1 89.1 121.8 89.5C121.5 89.9 121.1 90.1 120.6 90.2C120.1 90.4 119.6 90.3 119 90.1C118.4 89.9 118 89.6 117.7 89.1C117.4 88.6 117.2 88.2 117.1 87.6C117.1 87 117.2 86.4 117.4 85.7C117.7 84.7 118.3 84.1 118.9 83.6C119.6 83.2 120.4 83.1 121.2 83.3L120.6 85.1C120.2 85 119.9 85.1 119.5 85.3C119.1 85.5 118.9 85.9 118.7 86.4C118.5 86.9 118.5 87.3 118.7 87.7C118.8 88.1 119.1 88.3 119.6 88.5C119.9 88.6 120.2 88.6 120.4 88.5C120.7 88.4 120.9 88.2 121.1 88C121.3 87.8 121.6 87.4 121.9 87C122.3 86.4 122.7 85.9 123 85.6C123.3 85.3 123.7 85 124.2 84.8C124.7 84.6 125.2 84.7 125.8 84.9C126.3 85.1 126.7 85.4 127.1 85.8C127.4 86.2 127.7 86.7 127.7 87.4C127.8 88 127.7 88.7 127.5 89.4C127.2 89.8 126.9 90.3 126.4 90.8Z"
                fill="black"></path>
              <path
                d="M2.8 65.9C4.3464 65.9 5.6 64.6464 5.6 63.1C5.6 61.5536 4.3464 60.3 2.8 60.3C1.2536 60.3 0 61.5536 0 63.1C0 64.6464 1.2536 65.9 2.8 65.9Z"
                fill="black"></path>
              <path
                d="M125.9 65.9C127.446 65.9 128.7 64.6464 128.7 63.1C128.7 61.5536 127.446 60.3 125.9 60.3C124.354 60.3 123.1 61.5536 123.1 63.1C123.1 64.6464 124.354 65.9 125.9 65.9Z"
                fill="black"></path>
              <path fill-rule="evenodd" clip-rule="evenodd"
                d="M40 67C55.2548 67 64 58.2548 64 43C64 58.2548 72.7452 67 88 67C72.7452 67 64 75.7452 64 91C64 75.7452 55.2548 67 40 67Z"
                fill="black"></path>
            </svg>
          </div>

          <h2><?= htmlspecialchars($headers['final-left']['header']) ?></h2>
          <a href="careers.php"><i class="fa-solid fa-arrow-up"></i></a>
        </div>
      </div>
      <div class="final-spectrum-right">
        <div class="final-spectrum-right-container">
          <h2 class="highlight-letters"><?= htmlspecialchars($headers['final-right']['header']) ?></h2>
          <a href="contact.php"><i class="fa-solid fa-arrow-up"></i></a>
        </div>
      </div>
    </div>
  </div>

  <?php include('footer.php'); ?>

  <script src="./js/index.js"></script>
<script src="./js/style.js"></script>  
</body>

</html>