window.addEventListener('load', checkIsLogged);

function checkIsLogged() {
    let logIcon = document.getElementById("account-logger");
    
    fetch('php/get_user.php')
        .then(response => response.text())
        .then(data => {
            if (data === 'true') {
                console.log("user è loggato");
                document.getElementById("settings").classList.remove("hidden");

                logIcon.innerHTML = logIcon.innerHTML.replace("Accedi", "Esci");
                logIcon.setAttribute("href", "php/logout.php");
            } 
            else {
                console.log('user non è loggato');
                logIcon.setAttribute("href", "login.php");
            }
        })
        .catch(error => console.error('Errore nel check stato log:', error));
}