window.addEventListener('load', checkIsLogged);

function checkIsLogged() {
    fetch('get_user.php')
        .then(response => response.text())
        .then(data => {
            if (data === 'true') {
                console.log('User is logged in');
            } else {
                console.log('User is not logged in');
            }
        })
        .catch(error => console.error('Error checking login status:', error));
}