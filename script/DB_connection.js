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


// Ritorna array con tutte le info per il quiz passato come parametro (uso request per sapere quale info voglio e action se devo cambiare qualcosa)
export function AjaxRequest(quizID, request, callback, action="") {  
    var xmlHttp = getXMLHttp();
    xmlHttp.onreadystatechange = function() {
        // quando l'operazione è completata
        if (this.readyState == 4 && this.status == 200) {
            callback(this.responseText);      /* responseText è l'echo del .php aperto con XMLHttp */
        }
    };
    if(action=="")
        xmlHttp.open("GET","php/get_" + request + ".php?quizID=" + quizID, true);          /* praticamente prende l'echo del php e lo memorizza in responseText*/
    else 
        xmlHttp.open("GET","php/get_" + request + ".php?quizID=" + quizID + "&action=" + action, true);
    xmlHttp.send();
}