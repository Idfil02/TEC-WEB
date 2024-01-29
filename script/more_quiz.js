import { AjaxRequestPost, showToast } from './DB_connection.js'

window.addEventListener('load', showSuggestionBox);

function showSuggestionBox() {
    document.getElementById('more-quiz').classList.remove('hidden');
}

const suggestionModal = document.getElementById('suggestion-modal');
const moreQuizBtn = document.getElementById('more-quiz-btn');
moreQuizBtn.addEventListener("click", showSuggestionForm);

const focusableElStr = '#suggestion-modal textarea:not([disabled]), #suggestion-modal button:not([disabled]), #suggestion-modal input:not([disabled]), #suggestion-modal [tabindex="-1"]';
const focusableEl = Array.prototype.slice.call(suggestionModal.querySelectorAll(focusableElStr));     // array con elementi della modale che possono essere focussati
const firstTabStop = focusableEl[0];
const lastTabStop = focusableEl[focusableEl.length-1];

function showSuggestionForm() {
    if(suggestionModal.classList.contains('hidden')) {
        suggestionModal.classList.remove('hidden');
        suggestionModal.setAttribute('aria-modal', 'true');

        firstTabStop.focus();
        suggestionModal.addEventListener('keydown', function(e) {
            if (e.key === 'Tab') {
                if (e.shiftKey) {
                    if (document.activeElement === firstTabStop) {
                        e.preventDefault();
                        lastTabStop.focus();
                    }
                } 
                else {
                    if (document.activeElement === lastTabStop) {
                        e.preventDefault();
                        firstTabStop.focus();
                    }
                }
            }
            
            if(e.key === 'Escape') {
                cancelSuggestion();
            }
        });
    }
}

const suggestionForm = document.getElementById("suggestions-form");
suggestionForm.addEventListener('submit', function(event) {
    event.preventDefault();
    AjaxRequestPost('suggestion', 'suggestion=' + document.getElementById("suggestion-text").value, showResult);
});

document.getElementById("close-suggestions").addEventListener("click", cancelSuggestion);
function cancelSuggestion() {
    suggestionForm.reset();
    suggestionModal.classList.add('hidden');
    suggestionModal.setAttribute('aria-modal', 'false');
    moreQuizBtn.focus();
}


function showResult(text, result) {
    result ? showToast(text, 'success') : showResult(text);
    cancelSuggestion();
}