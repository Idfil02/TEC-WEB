import { showToast } from './DB_connection.js'


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