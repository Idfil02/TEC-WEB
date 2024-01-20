/***********************************************/
/*********** CONNESSIONE DB CON AJAX ***********/
/***********************************************/
function getXMLHttp() {
    var xmlHttp;
    try {
        xmlHttp = new XMLHttpRequest();
    }
    catch(e) {      //internet explorer
        try {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch(e) {
            try{
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch(e){
                alert("Browser troppo vecchio");
                return false;
            }
        }
    }
    return xmlHttp;
}


// Ritorna array con tutte le info per il quiz passato come parametro (request per sapere tipo di info e action per eventuale modifica all'info)
export function AjaxRequest(quizID, request, callback, action="") {  
    var xmlHttp = getXMLHttp();
    xmlHttp.onreadystatechange = function() {
        // quando l'operazione è completata
        if (this.readyState == 4 && this.status == 200) {
            if(this.responseText.includes('errore')){
                showErrorToast(this.responseText);
                if(request='questions')
                    document.getElementById('play-button').disabled = true;
            }
            else
                callback(this.responseText);
        }
    };
    if(action=="")
        xmlHttp.open("GET","php/get_" + request + ".php?quizID=" + quizID, true);
    else 
        xmlHttp.open("GET","php/get_" + request + ".php?quizID=" + quizID + "&action=" + action, true);
    xmlHttp.send();
}



/***********************************************/
/********** GESTIONE MESSAGGIO ERRORE **********/
/***********************************************/
let errorToast = document.getElementById('error-notify');

function showErrorToast(errorMessage) {
    var errorDescription = document.getElementById('error-descr');
    errorDescription.textContent = errorMessage;
    errorToast.style.display = 'flex';
    
    // Nasconde errore dopo 30sec
    setTimeout(function() {
        hideErrorToast();
    }, 30000);
}

// Chiusura notifica errore manuale
const closeError = document.getElementById('close-error-button');
closeError.addEventListener('click', hideErrorToast);

function hideErrorToast() {
    errorToast.style.display = 'none';
}