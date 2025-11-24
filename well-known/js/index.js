gsap.registerPlugin(ScrollTrigger, Draggable);

ScrollTrigger.config({
  autoRefreshEvents: "visibilitychange,DOMContentLoaded,load",
  limitCallbacks: true
});

document.addEventListener("DOMContentLoaded", () => {

  // ============================
  // SCROLL OPTIMIZATION
  // ============================
  let isScrolling = false;
  let scrollTimer;
  let ticking = false;

  window.addEventListener('scroll', () => {
    if (!ticking) {
      window.requestAnimationFrame(() => {
        if (!isScrolling) {
          isScrolling = true;
          document.body.classList.add('is-scrolling');
        }
        clearTimeout(scrollTimer);
        scrollTimer = setTimeout(() => {
          isScrolling = false;
          document.body.classList.remove('is-scrolling');
        }, 100);
        ticking = false;
      });
      ticking = true;
    }
  }, { passive: true });

  // ============================
  // HERO CAROUSEL
  // ============================
  const slides = document.querySelectorAll(".carousel .item");
  const nextBtn = document.querySelector(".carousel .next");
  const prevBtn = document.querySelector(".carousel .prev");
  let current = 0;
  let autoSlide;
  let isTransitioning = false;
  const debounceTime = 600;
  let canClick = true;

  if (slides.length) {
    function showSlide(i) {
      if (isTransitioning) return;
      isTransitioning = true;
      slides.forEach((s, idx) => {
        s.classList.remove("active", "prev");
        if (idx === i) s.classList.add("active");
        else if (idx === (i - 1 + slides.length) % slides.length) s.classList.add("prev");
      });
      setTimeout(() => { isTransitioning = false; }, 600);
    }

    function next() {
      current = (current + 1) % slides.length;
      showSlide(current);
    }

    function prev() {
      current = (current - 1 + slides.length) % slides.length;
      showSlide(current);
    }

    nextBtn?.addEventListener("click", () => {
      if (!canClick) return;
      canClick = false;
      next();
      clearInterval(autoSlide);
      autoSlide = setInterval(next, 7000);
      setTimeout(() => { canClick = true; }, debounceTime);
    });

    prevBtn?.addEventListener("click", () => {
      if (!canClick) return;
      canClick = false;
      prev();
      clearInterval(autoSlide);
      autoSlide = setInterval(next, 7000);
      setTimeout(() => { canClick = true; }, debounceTime);
    });

    showSlide(current);
    autoSlide = setInterval(next, 7000);
  }

  // ============================
  // SERVICES SLIDER
  // ============================
  const wrapper = document.querySelector(".swiper-wrapper");
  const items = document.querySelectorAll(".service-item");
  const label = document.querySelector(".top-label p");

  if (wrapper && items.length) {
    let index = 0;
    let timer;
    let isSliding = false;

    function update(idx) {
      if (isSliding) return;
      isSliding = true;
      idx = (idx + items.length) % items.length;
      wrapper.style.transform = `translateX(-${idx * 100}%)`;
      items.forEach((el, i) => el.classList.toggle("active", i === idx));
      if (label) label.textContent = `${idx + 1}/${items.length}`;
      setTimeout(() => { isSliding = false; }, 500);
    }

    document.querySelector(".fa-arrow-right")?.addEventListener("click", () => {
      index++;
      update(index);
      clearInterval(timer);
      timer = setInterval(() => { index++; update(index); }, 4000);
    });

    document.querySelector(".fa-arrow-left")?.addEventListener("click", () => {
      index--;
      update(index);
      clearInterval(timer);
      timer = setInterval(() => { index++; update(index); }, 4000);
    });

    update(index);
    timer = setInterval(() => { index++; update(index); }, 4000);
  }

  // ============================
  // INTERSECTION OBSERVER
  // ============================
  const scrollElements = document.querySelectorAll(
    '.who-left-one, .who-left-two, .right-section-text, .right-points-grid, ' +
    '.right-cards-container, .project-section .text h1, .project-cards .cardOne'
  );

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        requestAnimationFrame(() => {
          entry.target.classList.add('fade-in-visible');
        });
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1, rootMargin: '50px' });

  scrollElements.forEach(el => {
    if (el) {
      el.classList.add('fade-in-element');
      observer.observe(el);
    }
  });

  // ============================
  // NEWS SLIDER
  // ============================
  const newsSliderWrapper = document.querySelector(".news-slider-wrapper");
  const newsSlides = gsap.utils.toArray(".gray");
  const newsSliderContainer = document.querySelector(".news-slider-container");
  const newsBulletsContainer = document.querySelector(".slider-bullets");

  if (newsSliderWrapper && newsSlides.length > 0 && newsSliderContainer) {
    let currentSlideIndex = 0;
    let autoSlideInterval;
    const newsBullets = [];

    function createBullets() {
      newsBulletsContainer.innerHTML = '';
      newsSlides.forEach((_, idx) => {
        const bullet = document.createElement("span");
        if (idx === 0) bullet.classList.add("active");
        bullet.addEventListener("click", () => goToSlide(idx));
        newsBulletsContainer.appendChild(bullet);
        newsBullets.push(bullet);
      });
    }

    function updateBullets() {
      newsBullets.forEach((b, i) => b.classList.toggle('active', i === currentSlideIndex));
    }

    function getSlideWidth() {
      if (newsSlides.length > 1) {
        return newsSlides[1].offsetLeft - newsSlides[0].offsetLeft;
      } else {
        return newsSlides[0].offsetWidth;
      }
    }

    function goToSlide(index) {
      currentSlideIndex = index;
      const singleSlideWidth = getSlideWidth();
      gsap.to(newsSliderWrapper, {
        x: -singleSlideWidth * currentSlideIndex,
        duration: 0.8,
        ease: "power2.inOut"
      });
      updateBullets();
    }

    function moveToNextSlide() {
      currentSlideIndex = (currentSlideIndex + 1) % newsSlides.length;
      goToSlide(currentSlideIndex);
    }

    function startAutoSlide() {
      clearInterval(autoSlideInterval);
      autoSlideInterval = setInterval(moveToNextSlide, 4000);
    }

    createBullets();
    goToSlide(currentSlideIndex);
    startAutoSlide();

    let draggableInstance;
    function initDraggable() {
      const containerWidth = newsSliderContainer.offsetWidth;
      const wrapperWidth = newsSliderWrapper.scrollWidth;
      const singleSlideWidth = getSlideWidth();

      if (draggableInstance) draggableInstance[0].kill();

      draggableInstance = Draggable.create(newsSliderWrapper, {
        type: "x",
        inertia: true,
        edgeResistance: 0.9,
        bounds: { minX: containerWidth - wrapperWidth, maxX: 0 },
        snap: endValue => Math.round(endValue / singleSlideWidth) * singleSlideWidth,
        onDragStart() { clearInterval(autoSlideInterval); },
        onDragEnd() {
          currentSlideIndex = Math.round(-this.x / singleSlideWidth);
          if (currentSlideIndex < 0) currentSlideIndex = 0;
          if (currentSlideIndex >= newsSlides.length) currentSlideIndex = newsSlides.length - 1;
          updateBullets();
          startAutoSlide();
        }
      });
    }

    initDraggable();
    window.addEventListener('resize', () => {
      goToSlide(currentSlideIndex);
      initDraggable();
    });
  }

  // ============================
  // CRITICAL CSS INJECTION
  // ============================
  const style = document.createElement('style');
  style.textContent = `
    .is-scrolling * { transition: none !important; animation-play-state: paused !important; }
    .fade-in-element { opacity: 0; transform: translateY(30px); }
    .fade-in-visible { opacity: 1; transform: translateY(0); transition: opacity 0.5s ease, transform 0.5s ease; }
    .carousel .item, .carousel-bg-image, .swiper-wrapper, .spectrum-track, .news-slider-wrapper { transform: translateZ(0); backface-visibility: hidden; will-change: transform; }
    .carousel .item { transition: opacity 0.5s ease, transform 0.8s ease !important; }
    .swiper-wrapper, .news-slider-wrapper { transition: transform 0.4s ease-in-out !important; }
    img { content-visibility: auto; transform: translateZ(0); }
    .is-scrolling .carousel .item, .is-scrolling .swiper-wrapper, .is-scrolling .news-slider-wrapper, .is-scrolling .spectrum-track { transition: none !important; animation-play-state: paused !important; }
    .carousel, .services-container, .who-we-are-section, .project-section { contain: layout style paint; }
  `;
  document.head.appendChild(style);

});
