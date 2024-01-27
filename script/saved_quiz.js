import { showToast, AjaxRequest } from "./DB_connection.js";

let heartBtns = document.querySelectorAll('input[type="checkbox"].heart');

window.addEventListener('load', addSaved);
function addSaved() {
    // Se utente loggato
    if(checkIsLogged) {

        //Check di tutti i quiz salvati
        heartBtns.forEach(function(btn) {
            const id = btn.id.replace("salva-", "");
            AjaxRequest(id, 'user_like', function(response){
                if (response==1) {
                    btn.checked = true;
                    btn.setAttribute('aria-label', 'Non mi piace');
                }
            });
        });
    }
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
        AjaxRequest(id, 'likes', function(response){ checkLog(response, btn, 'Non mi piace'); }, '+1');
    }
    else {
        console.log("test bottone unlike");

        // Tolgo un like al numero di cuori + salvo nel db
        AjaxRequest(id, 'likes', function(response){ checkLog(response, btn, 'Mi piace'); }, '-1');
    }
}


function checkLog(response, heart, ariaLabel) {
    // Se loggato
    if(response != '-1'){
        heart.setAttribute('aria-label', ariaLabel);
    }
    // Se non loggato
    else {
        // Tolgo check
        heart.checked = false;
        heart.setAttribute('aria-label', 'Mi piace');
        showToast("Attenzione non sei loggato. È necessario essere autenticati per salvare il quiz.");
    }
}