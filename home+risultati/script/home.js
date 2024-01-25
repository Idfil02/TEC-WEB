const carousels = document.querySelectorAll('.carousel-row');

function nextCarousel(carouselId) {
    const carousel = document.getElementById(carouselId);
    const currentIndex = parseInt(carousel.dataset.currentIndex) || 0;
    const newIndex = (currentIndex + 1) % (carousel.children.length - 3); // aggiustato per visualizzare 4 blocchi contemporaneamente
    updateCarousel(carousel, newIndex);
}

function prevCarousel(carouselId) {
    const carousel = document.getElementById(carouselId);
    const currentIndex = parseInt(carousel.dataset.currentIndex) || 0;
    const newIndex = (currentIndex - 1 + carousel.children.length - 3) % (carousel.children.length - 3); 
    updateCarousel(carousel, newIndex);
}

function updateCarousel(carousel, newIndex) {
    const translateValue = -newIndex * (25 + .5); // Larghezza blocco + spazio tra i blocchi
    carousel.style.transform = `translateX(${translateValue}%)`;
    carousel.dataset.currentIndex = newIndex;
}
