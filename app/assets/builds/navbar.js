document.addEventListener('DOMContentLoaded', function() {
  // Find the hamburger button and the dropdown menu
  const hamburgerButton = document.querySelector('.navbar-toggler');
  const menuDropdown = document.getElementById('menuDropdown');

  // Add a click event to the hamburger button
  hamburgerButton.addEventListener('click', function() {
    // Check if the dropdown menu is visible
    const isVisible = menuDropdown.style.display === 'block';

    // Toggle the visibility of the dropdown menu based on its current state
    if (isVisible) {
      overlay.style.display = 'none';
      menuDropdown.style.display = 'none';
    } else {
      overlay.style.display = 'block';
      menuDropdown.style.display = 'block';
    }
  });

 // add clic to overlay to hide menu
 overlay.addEventListener('click', function() {
    menuDropdown.style.display = 'none';
    overlay.style.display = 'none';
  });

// hides menu when window is resized
  window.addEventListener('resize', function() {
    if (window.innerWidth >= 768) { // Cambia 768 al ancho de pantalla deseado
      menuDropdown.style.display = 'none';
      overlay.style.display = 'none';
    }
  });  
});
