import { AjaxRequest, showToast } from './DB_connection.js'

/***********************************************/
/*************** VARIABILI UTILI  **************/
/***********************************************/
const onPlayActions = document.querySelectorAll('.on-play');
const endLayout = document.querySelectorAll('.after-play');
const counterAnswers = document.getElementById('n-questions-given');
const questionsNav = document.getElementById('questions-nav');
const timerContainer = document.getElementById('time-value')
const answerBtns = document.querySelectorAll('#answers-box .text-button');
const wrongAnswerContainer = document.getElementById('wrong-answers-box');
const likesCounter = document.querySelector('.quiz-likes'); 

let numQuestions = document.getElementById('tot-questions').textContent.replace("/", "").trim();
let lastQuestionBtn = null;     //ultimo bottone di questions-nav premuto
let wrongAnswers = []      //array with values {index : 123, (wrong)answer : xyz} che contiene le risposte sbagliate (comprese le nulle)
let quizData = [];
let quizID;


/***********************************************/
/******* ASSOCIAZIONE BOTTONI - FUNZIONI *******/
/***********************************************/
const heartBtn = document.querySelector('input[type="checkbox"].heart');
heartBtn.addEventListener('change', function(event) {
    heartBtn.setAttribute('aria-pressed', heartBtn.checked);
    (event.target.checked) ? saveQuiz(true) : saveQuiz(false);
});

const startBtn = document.getElementById('play-button');
startBtn.addEventListener('click', startQuiz);

const stopBtn = document.getElementById('stop-button');
stopBtn.addEventListener('click', stopQuiz);

const giveupBtn = document.getElementById('giveup-button');
giveupBtn.addEventListener('click', giveUp);

const prevBtn = document.getElementById('prev-question-button');
prevBtn.addEventListener('click', prevQuestion);

const nextBtn = document.getElementById('next-question-button');
nextBtn.addEventListener('click', nextQuestion);

const retryBtn = document.getElementById('retry-button');
retryBtn.addEventListener('click', retryQuiz);

const checkWrongBtn = document.getElementById('check-wrong-button');
checkWrongBtn.addEventListener('click', showWrongAnswers);

const answer1 = document.getElementById('answer1');
answer1.addEventListener('click', function(){checkAnswer(answer1);});

const answer2 = document.getElementById('answer2');
answer2.addEventListener('click', function(){checkAnswer(answer2);});

const answer3 = document.getElementById('answer3');
answer3.addEventListener('click', function(){checkAnswer(answer3);});

const answer4 = document.getElementById('answer4');
answer4.addEventListener('click', function(){checkAnswer(answer4);});


/***********************************************/
/************ FUNZIONI PER BOTTONI *************/
/***********************************************/
function saveQuiz(save, quiz = quizID) {           //se save==true salvo il quiz altrimenti lo tolgo
    if (save==true){
        console.log("test bottone like");   

        // Aggiungo un like al numero di cuori + salvo nel db
        AjaxRequest(quiz, 'likes', function(response){ updateHearts(response) }, '+1');
    }
    else {
        console.log("test bottone unlike");

        // Tolgo un like al numero di cuori + salvo nel db
        AjaxRequest(quiz, 'likes', function(response){ updateHearts(response) }, '-1');
    }
}


function updateHearts(response) {
    // Se loggato
    if(response != '-1'){
        likesCounter.innerHTML = response + " cuori";
    }
    // Se non loggato
    else {
        // Tolgo check
        heartBtn.checked = false;
        showToast("Attenzione non sei loggato. È necessario essere autenticati per salvare il quiz.");
    }
}


function startQuiz(){
    console.log("test bottone play");

    // Mostra bottoni di pausa/resa + domande/risposte + barra navigazione tra domande
    onPlayActions.forEach(action => {
        action.classList.remove('hidden');
    });

    // Nascondo bottone di inizio test
    startBtn.classList.add('hidden');

    // Carico barra di navigazione tra domande
    questionsNavBuilder(numQuestions); 

    // Attivo il timer
    startTimer(totalTime);
    
    // Carico la prima domanda
    questionLoader(0);
}


function stopQuiz() {
    console.log("test bottone pausa");

    const resumePath = document.querySelector('.resume');
    const pausePaths = document.querySelectorAll('.pause');
    const btnText = document.getElementById('stop-button-text');
    const onPlayQuiz = document.querySelectorAll('#quiz-content-box .on-play');
    const onplayNav = document.getElementById('questions-nav-bar');

    /* Metto in pausa */
    if (resumePath.classList.contains('hidden')) {
        // Cambio icona bottone
        resumePath.classList.remove('hidden');
        pausePaths.forEach(path => {
            path.classList.add('hidden');
        });
        btnText.textContent = "Riprendi";
        stopBtn.classList.add('bigger');

        // Nascondo quiz content box        
        onPlayQuiz.forEach(action => {
            action.classList.add('hidden');
        });
        // Nascondo nav tra domande
        onplayNav.classList.add('hidden');

        // Mostro img gioco in pausa
        document.getElementById('pause-quiz-container').classList.remove('hidden');

        // Pauso il timer
        pauseTimer();
    } 
    /* Riprendo il gioco */
    else {
        // Cambio icona bottone 
        resumePath.classList.add('hidden');
        pausePaths.forEach(path => {
            path.classList.remove('hidden');
        });
        btnText.textContent = "Pausa";
        stopBtn.classList.remove('bigger');

        // Mostro quiz content box da
        onPlayQuiz.forEach(action => {
            action.classList.remove('hidden');
        });
        // Mostro nav tra domande
        onplayNav.classList.remove('hidden');

        // Nascondo img gioco in pausa
        document.getElementById('pause-quiz-container').classList.add('hidden');

        // Riattivo il timer
        startTimer(remainingTime);
    }
}


function giveUp() {
    // Controllo se era in pausa il gioco
    const pauseContainer = document.getElementById('pause-quiz-container');
    if(!pauseContainer.classList.contains('hidden'))
        stopQuiz();

    // Termino il gioco
    endQuiz();

    // Salvo le domande senza risposta
    const questionsNavBtns = document.querySelectorAll('.question-nav-btn');
    questionsNavBtns.forEach(btn => {
        if(!btn.classList.contains('wrong') && !btn.classList.contains('correct')) {
            wrongAnswers.push({index : parseInt(btn.textContent)-1, answer : ""});
        }
    });
}


function endQuiz() {
    console.log("test bottone fine");

    // Fermo il timer
    pauseTimer();

    // Nascondo tutte le parti da visualizzare in gioco
    onPlayActions.forEach(action => {
        action.classList.add('hidden');
    });

    // Visualizzo l'end-container e i bottoni di rigioca/rivedi risposte sbagliate
    endLayout.forEach(layout => {
        layout.classList.remove('hidden');
    });

    // Modifica score con risposte esatte
    const score = document.getElementById('score');
    const questionGiven = counterAnswers.textContent;
    score.innerHTML = "<strong>" + (questionGiven - wrongAnswers.length) + "</strong>";

    // Aumentare counter giocate 
    AjaxRequest(quizID, 'players', function(response){ 
        document.querySelector('.quiz-players').innerHTML = response + " giocate";
    });
}


function prevQuestion() {
    console.log("test bottone prev");

    // Rimuovo stato active dal bottone di navigazione corrente
    const currQuestionNav = document.querySelector('.question-nav-btn.active');
    currQuestionNav.classList.remove('active');

    const currQuestion = parseInt(currQuestionNav.textContent);

    // Cerco bottone precedente 
    for (let id = currQuestion-1; id >= 0; id--) {
        // Se è la prima domanda riguardo dalla fine
        if(id < 1)
            id = numQuestions;

        const btn = document.getElementById(`to-question${id}`);            
        if (!btn.classList.contains('wrong') && !btn.classList.contains('correct')) {
            btn.click();
            break;
        }
    }
}


function nextQuestion() {
    console.log("test bottone next");

    // Rimuovo stato active dal bottone di navigazione corrente
    const currQuestionNav = document.querySelector('.question-nav-btn.active');
    currQuestionNav.classList.remove('active');

    const currQuestion = parseInt(currQuestionNav.textContent);

    // Cerco bottone successivo
    for (let id = currQuestion+1; id >= 1; id++) {
        // Se è la prima domanda riguardo dalla fine
        if(id > numQuestions) 
            id = 1; 

        console.log(id);
        const btn = document.getElementById(`to-question${id}`);            
        if (!btn.classList.contains('wrong') && !btn.classList.contains('correct')) {
            btn.click();
            break;
        }
    }
}


function retryQuiz() {
    // Riporto scrollbar sopra altrimenti con hidden non funziona
    wrongAnswerContainer.scrollTop = 0;

    // Nascondo tutto ciò che è mostrato alla fine
    endLayout.forEach(layout => {
        layout.classList.add('hidden');
    });
    
    // Reset di domande risposte e timer
    counterAnswers.textContent = '0';
    resetTimer();

    // Reset barra navigazione domande 
    questionsNav.innerHTML = "";

    // Reset degli errori
    wrongAnswerContainer.innerHTML = "<strong>DOMANDE SBAGLIATE</strong>";
    wrongAnswerContainer.classList.add('hidden');
    checkWrongBtn.innerText = "Riguarda errori";

    // Reset variabili utili al quiz
    lastQuestionBtn = null;
    wrongAnswers.length = 0;

    // Mostro layout iniziale
    startBtn.classList.remove('hidden');
}


function showWrongAnswers() {
    // Riordino risposte sbagliate
    wrongAnswers.sort((a,b) => a['index'] - b['index']);  

    if(checkWrongBtn.innerText=="Riguarda errori") {
        if(wrongAnswerContainer.innerHTML == "<strong>DOMANDE SBAGLIATE</strong>") { 
            // Creo elementi con risposte sbagliate-giuste
            wrongAnswers.forEach(ans => {
                const questionIndex = ans['index'];

                let wrongEntry = document.createElement("div");
                wrongEntry.setAttribute('id', 'wrong-single-entry');
                wrongAnswerContainer.append(wrongEntry);
            
                let wrongQuestion = document.createElement("div");
                wrongQuestion.setAttribute('id', 'wrong-question-text');
                wrongQuestion.innerHTML = "<strong>" + getQuizData(questionIndex, 'Domanda') + "</strong>";
                wrongEntry.append(wrongQuestion);
            
                let wrongAnswer = document.createElement("div");
                wrongAnswer.setAttribute('id', 'wrong-answer-text');
                wrongAnswer.innerHTML = "La tua risposta: <em>" + ans['answer'] + "</em>";
                wrongEntry.append(wrongAnswer);
            
                let correctAnswer = document.createElement("div");
                correctAnswer.setAttribute('id', 'correct-answer-text');
                correctAnswer.innerHTML = "La risposta corretta: <em>" + getQuizData(questionIndex, 'Risp_corretta') + "</em>";
                wrongEntry.append(correctAnswer);
            });
        }
        // Mostro le risposte giuste-sbagliate
        wrongAnswerContainer.classList.remove('hidden');
        checkWrongBtn.innerText = "Nascondi errori";
    }
    else {
        // Nascondo le risposte giuste-sbagliate
        wrongAnswerContainer.scrollTop = 0;
        wrongAnswerContainer.classList.add('hidden');
        checkWrongBtn.innerText = "Riguarda errori";
    }
}


/***********************************************/
/******* GESTIONE DINAMICA DOMANDE QUIZ ********/
/***********************************************/
function questionLoader(questionIndex) {
    // Carico domanda
    const questionContainer = document.getElementById("question-box");
    questionContainer.innerHTML = "<strong>" + getQuizData(questionIndex, 'Domanda') + "</strong>";

    // Carico risposte
    answerBtns.forEach(function(button, index) {
        button.disabled = false;        // riattivo i bottoni (disattivati quando data risposta precedente)
        button.textContent = getQuizData(questionIndex, 'Risposta'+(index+1));
        button.classList.remove('correct');
        button.classList.remove('wrong');
    });
}


function questionsNavBuilder(totQuestions) {
    console.log("test navBarBuilder");

    for (let i = 0; i < totQuestions; i++) {
        // Creo bottone per navigare alla domanda i+1
        const iQuestionBtn = document.createElement('button');
        iQuestionBtn.setAttribute('id', `to-question${i+1}`);
        iQuestionBtn.setAttribute('aria-label', `Domanda ${i+1}`);
        iQuestionBtn.classList.add('text-button');
        iQuestionBtn.classList.add('question-nav-btn');
        iQuestionBtn.setAttribute('type', 'button');
        iQuestionBtn.textContent = `${i + 1}`;

        // Aggiungo ascoltatore per quel bottone che carica la domanda
        iQuestionBtn.addEventListener('click', () => {
            // Carico domanda corrispondente al bottone
            questionLoader(i);

            // Cambio stato in attivo per diversa formattazione del bottone cliccato
            if(lastQuestionBtn !== null)
                lastQuestionBtn.classList.remove('active'); 
            iQuestionBtn.classList.add('active');
            lastQuestionBtn = iQuestionBtn;

            // Per scroll della scrollbar
            iQuestionBtn.scrollIntoView({ behavior: "smooth", inline: "center" });
        });

        // Aggiungo il bottone alla barra di navigazione
        questionsNav.appendChild(iQuestionBtn);

        // Dò stato attivo al primo bottone all'inizio del quiz
        if (i === 0) {
            iQuestionBtn.classList.add('active');
            lastQuestionBtn = iQuestionBtn;
        }
    }
}


function checkAnswer(answerBtn) {
    // Disabilito bottoni così non posso cliccare delle altre risposte
    answerBtns.forEach(function(button) {
        button.disabled = true;
    });

    // Risposta data
    let answer = answerBtn.textContent;

    let navQuestionBtn = document.querySelector('.question-nav-btn.active');      //per sapere indice della domanda
    let questionIndex = parseInt(navQuestionBtn.textContent)-1;
    
    // Risposta esatta
    if(answer === getQuizData(questionIndex, 'Risp_corretta')) {
        answerBtn.classList.add('correct');
        navQuestionBtn.classList.add('correct');
    }
    // Risposta sbagliata
    else {
        answerBtn.classList.add('wrong');
        navQuestionBtn.classList.add('wrong');
        wrongAnswers.push({index : questionIndex, answer : answer});        //memorizzo risposte sbagliate
    }

    // Disattivo il bottone, la domanda non potrà più essere raggiunta
    navQuestionBtn.disabled = true;

    // Aggiorno il contatore delle risposte date
    counterAnswers.textContent = parseInt(counterAnswers.textContent) + 1;
    if(counterAnswers.textContent == numQuestions) 
        endQuiz();
    else 
        nextQuestion();
}


/***********************************************/
/*************** ALTRE FUNZIONI ****************/
/***********************************************/
// Per input da tastiera
document.addEventListener('keydown', function(event) {
    if (event.key === 'ArrowLeft') {
        prevBtn.click();
    } 
    else if (event.key === 'ArrowRight') {
        nextBtn.click();
    }
});


window.addEventListener("load", pageInit);
function pageInit() {
    // Carico dati domande dal db
    quizID = heartBtn.id.replace("salva-", "");
    AjaxRequest(quizID, 'questions', function(response) {
        quizData = JSON.parse(response);
    });

    // Formatto tempo del timer
    totalTime = timerContainer.textContent*60;
    displayTime(totalTime);

    // Modifico stato bottone like (già colorato se ho il like dell'utente)
    AjaxRequest(quizID, 'user_like', function(response){
        if (response==1) {
            heartBtn.checked = true;
            heartBtn.setAttribute('aria-pressed', true);
        }
    });

    // Visualizzo bottone inizio e nascondo js-error
    startBtn.classList.remove("hidden");
    document.getElementById("quiz-info").classList.remove("hidden");
    document.getElementById("error-no-js").classList.add("hidden");
}


// Ricavo valore relativo alla key passata per la domanda passata anch'essa come parametro
function getQuizData(questionIndex, key){
    let elem = quizData.find(item => item['ID'] === questionIndex); 
    return elem[key];
}


/***********************************************/
/**************** GESTIONE TIMER ***************/
/***********************************************/
let timer;
let totalTime;      // tempo totale iniziale in sec.
let remainingTime;      //tempo rimanente in sec.
let isTimerRunning = false;

function startTimer(seconds) {
    if (!isTimerRunning) {
        isTimerRunning = true;
        remainingTime = seconds; 
        timer = setInterval(updateTimer, 1000);
    }
}


function updateTimer() {
    if (remainingTime > 0) {
        remainingTime--;
        displayTime(remainingTime);
    } 
    else {      //se il timer finisce
        clearInterval(timer);
        isTimerRunning = false;
        endQuiz();
    }
}  


function displayTime(time) {
    const minutes = Math.floor(time / 60);
    const seconds = time % 60;
    const formattedMinutes = formatTime(minutes);
    const formattedSeconds = formatTime(seconds);
    timerContainer.innerText = `${formattedMinutes}:${formattedSeconds}`;

    timerContainer.setAttribute('aria-label', `${formattedMinutes} minuti e ${formattedSeconds} secondi rimanenti`);
}


function formatTime(time) {
    return time < 10 ? `0${time}` : time;
}


function pauseTimer() {
    clearInterval(timer);
    isTimerRunning = false;
}


function resetTimer() {
    clearInterval(timer);
    isTimerRunning = false;
    displayTime(totalTime);
    remainingTime = 0;
}