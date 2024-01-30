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
            const id = btn.id.match(/^salva-(\d+)/)[1];
            AjaxRequest(id, 'user_like', function(response){
                if (response==1) {
                    document.querySelectorAll('[id^="salva-'+id+'"]').forEach(function (btn) {
                        btn.checked = true;
                        btn.setAttribute('aria-pressed', true);
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
        console.log(btn.checked);
        btn.setAttribute('aria-pressed', btn.checked);
        (event.target.checked) ? save(true, this) : save(false, this);
    });
});


function save(save, btn) {           //se save==true salvo il quiz altrimenti lo tolgo
    let id = btn.id.match(/^salva-(\d+)/)[1];

    if (save==true){
        console.log("test bottone like");   

        // Aggiungo un like al numero di cuori + salvo nel db
        AjaxRequest(id, 'likes', function(response){ updateHearts(response, id); }, '+1');
    }
    else {
        console.log("test bottone unlike");

        AjaxRequest(id, 'likes', function(response){ 
            document.querySelectorAll('[id^="salva-'+id+'"]').forEach(function (btn) {
                btn.checked = false;
            }); 
            updateHearts(response, id); }, '-1');

    }
}



function updateHearts(response, id) {
    // Se non loggato
    if(response == '-1'){
        // Tolgo check
        document.querySelectorAll('[id^="salva-'+id+'"]').forEach(function (btn) {
            btn.checked = false;
        });
        showToast("Attenzione non sei loggato. È necessario essere autenticati per salvare il quiz.");
    }
}
