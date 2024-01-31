import { AjaxRequestPost, showToast } from './DB_connection.js'

const authForm = document.querySelector(".auth-form");
authForm.addEventListener('submit', function(event) {
    event.preventDefault();
    let user = document.getElementById("username").value;
    let psw = document.getElementById("password").value;
    let email = document.getElementById("email") ? document.getElementById("email").value : "";
    let requests = "username=" + user + "&password=" + psw + "&email=" + email;
    AjaxRequestPost('user', requests, showResult);
});


function showResult(text, result) {
    if (result) {
        authForm.reset();
        sessionStorage.setItem('toastMessage', text);
        sessionStorage.setItem('toastType', 'success');
        sessionStorage.setItem("log", 1);
        window.location.href = "index.php";
    }
    else {
        showToast(text);
    }
}