
/** PER MORE-QUIZ **/
// è uguale a quella in DB_connection ma serve script come modulo per poterla importare
let toast = document.getElementById('toast-notify');

function showToast(message, type="error") {
    var description = document.getElementById('toast-descr');
    description.textContent = message;
    toast.style.display = 'flex';
    toast.setAttribute("class", type);
    
    // Nasconde errore dopo 30sec
    setTimeout(function() {
        hideToast();
    }, 30000);
}

// Chiusura notifica errore manuale
const closeToast = document.getElementById('close-toast-button');
closeToast.addEventListener('click', hideToast);

function hideToast() {
    toast.style.display = 'none';
}





const suggestionModal = document.getElementById('suggestion-modal');
document.getElementById("more-quiz-btn").addEventListener("click", showSuggestionForm);
function showSuggestionForm() {
    if(suggestionModal.classList.contains('hidden')) {
        suggestionModal.classList.remove('hidden');
    }
    else {
        suggestionModal.classList.add('hidden');
    }
}

document.getElementById("close-suggestions").addEventListener("click", cancelSuggestion);
function cancelSuggestion() {
    document.getElementById("suggestions-form").reset();
    suggestionModal.classList.add('hidden');
}

$(document).ready(function () {
    $("#suggestions-form").submit(function (e) {
        e.preventDefault();
        sendSuggestion();
    });
});

function sendSuggestion() {
    var suggestion = $("#suggestion-text").val();

    $.ajax({
        type: "POST",
        url: "php/set_suggestion.php",
        data: { "suggestion": suggestion },
        dataType: "json",
        success: function (response) {
            if (response.success) {
                showToast(response.message, "success");
            } else {
                showToast("Errore: " + response.message);
            }
        },
        error: function () {
            showToast("Si è verificato un errore. Riprovare più tardi.");        //ajax error
        },
    });
    cancelSuggestion();
}   