import { AjaxRequest, showToast } from './DB_connection.js'

let heartBtns = document.querySelectorAll('input[type="checkbox"].heart');
let toastMessage = sessionStorage.getItem('toastMessage');
let toastType = sessionStorage.getItem('toastType');

window.addEventListener('load', addSaved);
function addSaved() {
    // Se utente loggato
    if(checkIsLogged) {
        // Mostro preferiti
        document.getElementById("saved-quiz").classList.remove("hidden");

        //Check di tutti i quiz salvati
        heartBtns.forEach(function(btn) {
            const id = btn.id.replace("salva-", "");
            AjaxRequest(id, 'user_like', function(response){
                if (response==1) {
                    document.querySelectorAll("#salva-" + id).forEach(function (btn) {
                        btn.checked = true;
                        btn.setAttribute('aria-label', 'Non mi piace');
                    });
                }
            });
        });
    }
    if (toastMessage && toastType) {
        showToast(toastMessage, toastType);
        sessionStorage.removeItem('toastMessage');
        sessionStorage.removeItem('toastType');
    }
}

const leftArrows = document.querySelectorAll('.left-arrow');
leftArrows.forEach(function(btn) {
    btn.addEventListener('click', function() {
        prevCarousel("carousel" + btn.id.replace("prev-row-",""));
    });
});

const rightArrows = document.querySelectorAll('.right-arrow');
rightArrows.forEach(function(btn) {
    btn.addEventListener('click', function() {
        nextCarousel("carousel" + btn.id.replace("next-row-",""));
    });
});

function nextCarousel(carouselId) {
    const carousel = document.getElementById(carouselId);
    const currentIndex = parseInt(carousel.dataset.currentIndex) || 1;
    const newIndex = (currentIndex + 1) % (carousel.children.length - 3); // aggiustato per visualizzare 4 blocchi contemporaneamente
    updateCarousel(carousel, newIndex);
}

function prevCarousel(carouselId) {
    const carousel = document.getElementById(carouselId);
    const currentIndex = parseInt(carousel.dataset.currentIndex) || 1;
    const newIndex = (currentIndex - 1 + carousel.children.length - 3) % (carousel.children.length - 3); 
    updateCarousel(carousel, newIndex);
}

function updateCarousel(carousel, newIndex) {
    const translateValue = -newIndex * (25 + .7); // Larghezza blocco + spazio tra i blocchi
    carousel.style.transform = `translateX(${translateValue}%)`;
    carousel.dataset.currentIndex = newIndex;
}


heartBtns.forEach(function(btn) {
    btn.addEventListener('change', function(event) {
        (event.target.checked) ? save(true, this) : save(false, this);
    });
});


function save(save, btn) {           //se save==true salvo il quiz altrimenti lo tolgo
    let id = btn.id.replace("salva-", "");

    if (save==true){
        console.log("test bottone like");   

        // Aggiungo un like al numero di cuori + salvo nel db
        AjaxRequest(id, 'likes', function(response){ updateHearts(response, id, 'Non mi piace'); }, '+1');
    }
    else {
        console.log("test bottone unlike");

        // Tolgo un like al numero di cuori + salvo nel db
        AjaxRequest(id, 'likes', function(response){ 
            document.querySelectorAll("#salva-" + id).forEach(function (btn) {
                btn.checked = false;
            }); 
            updateHearts(response, id, 'Mi piace'); }, '-1');

    }
}



function updateHearts(response, id, ariaLabel) {
    // Se loggato
    if(response != '-1'){
        document.querySelectorAll("#salva-" + id).forEach(function (btn) {
            btn.setAttribute('aria-label', ariaLabel);
        });
    }
    // Se non loggato
    else {
        // Tolgo check
        document.querySelectorAll("#salva-" + id).forEach(function (btn) {
            btn.checked = false;
            btn.setAttribute('aria-label', 'Mi piace');
        });
        showToast("Attenzione non sei loggato. È necessario essere autenticati per salvare il quiz.");
    }
}