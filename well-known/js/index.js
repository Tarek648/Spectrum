document.addEventListener("DOMContentLoaded", () => {

  /* ===============================
     TOP SERVICE SLIDER
  =============================== */
  const serviceSlides = document.querySelectorAll('.swiper-slide');
  const serviceItems = document.querySelectorAll('.service-item');
  const topLabel = document.querySelector(".top-label p");
  const totalServices = serviceSlides.length;

  let serviceIndex = 0;
  let serviceAutoInterval;
  const serviceDelay = 5000;

  function updateServiceSlide(index) {
    serviceSlides.forEach((slide, i) => slide.classList.toggle("active", i === index));
    serviceItems.forEach((item, i) => item.classList.toggle("active", i === index));
    topLabel.textContent = `${index + 1}/${totalServices}`;
  }

  function startServiceAuto() {
    serviceAutoInterval = setInterval(() => {
      serviceIndex = (serviceIndex + 1) % totalServices;
      updateServiceSlide(serviceIndex);
    }, serviceDelay);
  }

  function restartServiceAuto() {
    clearInterval(serviceAutoInterval);
    startServiceAuto();
  }

  document.querySelector('.top-right-arrow .right')?.addEventListener('click', () => {
    serviceIndex = (serviceIndex + 1) % totalServices;
    updateServiceSlide(serviceIndex);
    restartServiceAuto();
  });

  document.querySelector('.top-right-arrow .left')?.addEventListener('click', () => {
    serviceIndex = (serviceIndex - 1 + totalServices) % totalServices;
    updateServiceSlide(serviceIndex);
    restartServiceAuto();
  });

  if (totalServices > 0) {
    updateServiceSlide(serviceIndex);
    startServiceAuto();
  }

  /* ===============================
     MAIN HERO CAROUSEL
  =============================== */
  const heroSlides = document.querySelectorAll(".carousel .item");
  const prevBtn = document.querySelector(".arrows .prev");
  const nextBtn = document.querySelector(".arrows .next");

  let heroIndex = 0;
  let autoSlideInterval;
  const totalSlides = heroSlides.length;
  const delay = 6000;

  function showHeroSlide(index) {
    heroSlides.forEach((slide, i) => {
      slide.classList.toggle("active", i === index);
    });
  }

  function nextHeroSlide() {
    heroIndex = (heroIndex + 1) % totalSlides;
    showHeroSlide(heroIndex);
  }

  function prevHeroSlide() {
    heroIndex = (heroIndex - 1 + totalSlides) % totalSlides;
    showHeroSlide(heroIndex);
  }

  nextBtn?.addEventListener("click", () => {
    nextHeroSlide();
    restartAutoSlide();
  });

  prevBtn?.addEventListener("click", () => {
    prevHeroSlide();
    restartAutoSlide();
  });

  function startAutoSlide() {
    autoSlideInterval = setInterval(nextHeroSlide, delay);
  }

  function restartAutoSlide() {
    clearInterval(autoSlideInterval);
    startAutoSlide();
  }

  if (totalSlides > 0) {
    showHeroSlide(heroIndex);
    startAutoSlide();
  }

  /* ===============================
     AUTO-SCROLLING STRUCTURE SLIDER (SMOOTH INFINITE LOOP)
  =============================== */
  const structureSlider = document.querySelector(".spectrum-slider-structure");

  if (structureSlider) {
    const slides = structureSlider.querySelectorAll('.company-single-slider');
    
    // Only proceed if we have slides
    if (slides.length > 0) {
      let scrollPosition = 0;
      const scrollSpeed = 0.5; // Pixels per frame (adjust for speed)
      let animationId;

      function smoothScroll() {
        scrollPosition += scrollSpeed;
        
        // Get total scrollable width
        const maxScroll = structureSlider.scrollWidth / 2;
        
        // Reset to beginning when halfway through (where duplicate starts)
        if (scrollPosition >= maxScroll) {
          scrollPosition = 0;
        }
        
        structureSlider.scrollLeft = scrollPosition;
        animationId = requestAnimationFrame(smoothScroll);
      }

      // Start the animation
      smoothScroll();

      // Pause on hover
      structureSlider.addEventListener('mouseenter', () => {
        cancelAnimationFrame(animationId);
      });

      structureSlider.addEventListener('mouseleave', () => {
        smoothScroll();
      });
    }
  }

  /* ===============================
     NEWS SLIDER (MANUAL)
  =============================== */
  const newsSlider = document.querySelector(".news-slider-structure");
  const btnLeft = document.querySelector(".news-arrow.left");
  const btnRight = document.querySelector(".news-arrow.right");

  const scrollAmount = 320;

  btnRight?.addEventListener("click", () => {
    newsSlider?.scrollBy({ left: scrollAmount, behavior: "smooth" });
  });

  btnLeft?.addEventListener("click", () => {
    newsSlider?.scrollBy({ left: -scrollAmount, behavior: "smooth" });
  });

});