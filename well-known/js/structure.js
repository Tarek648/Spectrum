document.addEventListener("DOMContentLoaded", () => {
  // Animate numbers in cards
  const counters = document.querySelectorAll('.stat-item strong');
  counters.forEach(counter => {
    const target = +counter.getAttribute('data-target');
    let count = 0;
    const step = Math.ceil(target / 100);
    const interval = setInterval(() => {
      count += step;
      if(count >= target) {
        count = target;
        clearInterval(interval);
      }
      counter.textContent = count;
    }, 20);
  });

  // Popup logic
  const popup = document.getElementById('locationPopup');
  const popupOverlay = popup.querySelector('.popup-overlay');
  const popupImage = document.getElementById('popupImage');
  const popupDetails = document.getElementById('popupDetails');
  const closeBtn = document.getElementById('popupClose');

  document.querySelectorAll('.detail-link').forEach(link => {
    link.addEventListener('click', () => {
      const card = link.closest('.location-card');
      const bg = card.querySelector('.card-bg').style.backgroundImage;
      const city = card.querySelector('.location-header h2').textContent;
      const country = card.querySelector('.country').textContent;
      const staff = card.querySelector('.stats .stat-item strong').textContent;
      const departments = card.querySelectorAll('.stats .stat-item strong')[1].textContent;

      popupImage.style.backgroundImage = bg;
      popupDetails.innerHTML = `
        <h2>${city}, ${country}</h2>
        <p>Staff: ${staff}</p>
        <p>Departments: ${departments}</p>
      `;
      popup.style.display = 'block';
    });
  });

  closeBtn.addEventListener('click', () => {
    popup.style.display = 'none';
  });
  popupOverlay.addEventListener('click', () => {
    popup.style.display = 'none';
  });
});
