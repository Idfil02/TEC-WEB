/***********************************************/
/************** TEST QUIZ DOMANDE *************/
/***********************************************/
/* da cancellare quando ho connessione a db - da implementare */
const quizData = [
    {
      question: "What is the capital of France?",
      options: ["Paris", "London", "Berlin", "Madrid"],
      answer: "Paris",
    },
    {
      question: "What is the largest planet in our solar system?",
      options: ["Mars", "Saturn", "Jupiter", "Neptune"],
      answer: "Jupiter",
    },
    {
      question: "Which country won the FIFA World Cup in 2018?",
      options: ["Brazil", "Germany", "France", "Argentina"],
      answer: "France",
    },
    {
      question: "What is the tallest mountain in the world?",
      options: ["Mount Everest", "K2", "Kangchenjunga", "Makalu"],
      answer: "Mount Everest",
    },
    {
      question: "Which is the largest ocean on Earth?",
      options: [
        "Pacific Ocean",
        "Indian Ocean",
        "Atlantic Ocean",
        "Arctic Ocean",
      ],
      answer: "Pacific Ocean",
    },
];

/***********************************************/
/*************** VARIABILI UTILI  **************/
/***********************************************/
const onPlayActions = document.querySelectorAll('.on-play');
const endLayout = document.querySelectorAll('.after-play');
const counterAnswers = document.getElementById('n_questions_given');
const questionsNav = document.getElementById('questions-nav');
const timerContainer = document.getElementById('time-value')
const answerBtns = document.querySelectorAll('#answers-box .text-button');
const wrongAnswerContainer = document.getElementById('wrong-answers-box'); 

let lastQuestionBtn = null;     //ultimo bottone di questions-nav premuto
let wrong_answers = []      //array with values {index : 123, (wrong)answer : xyz} che contiene le risposte sbagliate (comprese le nulle)


/***********************************************/
/******* ASSOCIAZIONE BOTTONI - FUNZIONI *******/
/***********************************************/
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


/***********************************************/
/************ FUNZIONI PER BOTTONI *************/
/***********************************************/
function startQuiz(){
    console.log("test bottone play");

    // Mostra bottoni di pausa/resa + domande/risposte + barra navigazione tra domande
    onPlayActions.forEach(action => {
        action.classList.remove('hidden');
    });

    // Nascondo bottone di inizio test
    startBtn.classList.add('hidden');

    // Carico barra di navigazione tra domande
    questionsNavBuilder(3);             /*php connessione a db per sapere quante domande sono da implementare*/

    // Attivo il timer
    startTimer(60);           /* php connessione a db per sapere il tempo (in secondi) */
    
    // Carico la prima domanda
    questionLoader(0);
}


function stopQuiz() {
    console.log("test bottone pausa");

    const resumePath = document.querySelector('.resume');
    const pausePaths = document.querySelectorAll('.pause');
    const btnText = document.getElementById('stop-button-text');
    const onPlayQuiz = document.querySelectorAll('#quiz-content-box .on-play');

    /* Metto in pausa */
    if (resumePath.classList.contains('hidden')) {
        // Cambio icona bottone
        resumePath.classList.remove('hidden');
        pausePaths.forEach(path => {
            path.classList.add('hidden');
        });
        btnText.textContent = "Riprendi";
        stopBtn.classList.add('bigger');

        // Nascondere quiz content box        
        onPlayQuiz.forEach(action => {
            action.classList.add('hidden');
        });
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

        // Nascondo img gioco in pausa
        document.getElementById('pause-quiz-container').classList.add('hidden');

        // Riattivo il timer
        startTimer(totalTime);
    }
}


function giveUp() {
    // Termina il quiz
    endQuiz();

    // Salvo le domande senza risposta
    const questionsNavBtns = document.querySelectorAll('.question-nav-btn');
    questionsNavBtns.forEach(btn => {
        if(!btn.classList.contains('wrong') && !btn.classList.contains('correct')) {
            wrong_answers.push({index : parseInt(btn.textContent)-1, answer : ""});
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
    score.innerHTML = "<strong>" + (questionGiven - wrong_answers.length) + "</strong>";
}


function prevQuestion() {
    console.log("test bottone prev");

    // Rimuovo stato active dal bottone di navigazione corrente
    const currQuestionNav = document.querySelector('.question-nav-btn.active');
    currQuestionNav.classList.remove('active');

    const currQuestion = parseInt(currQuestionNav.textContent);

    // Cerco bottone precedente 
    for (let id = currQuestion-1; id >= 0; id--) {                  /* da implementare connessione a db per sapere totale domande */
        // Se è la prima domanda riguardo dalla fine
        if(id < 1)
            id = 3;           /* da implementare connessione a db per sapere totale domande */

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
    for (let id = currQuestion+1; id >= 1; id++) {                  /* da implementare connessione a db per sapere totale domande */
        // Se è la prima domanda riguardo dalla fine
        if(id > 3)                     /* da implementare connessione a db per sapere totale domande */
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
    wrong_answers.length = 0;


    // Mostro layout iniziale
    startBtn.classList.remove('hidden');
}


function showWrongAnswers() {
    // Riordino risposte sbagliate
    wrong_answers.sort((a,b) => a['index'] - b['index']);  

    if(checkWrongBtn.innerText=="Riguarda errori") {
        if(wrongAnswerContainer.innerHTML == "<strong>DOMANDE SBAGLIATE</strong>") { 
            // Creo elementi con risposte sbagliate-giuste
            wrong_answers.forEach(ans => {
                const question_index = ans['index'];

                let wrongEntry = document.createElement("div");
                wrongEntry.setAttribute('id', 'wrong-single-entry');
                wrongAnswerContainer.append(wrongEntry);
            
                let wrongQuestion = document.createElement("div");
                wrongQuestion.setAttribute('id', 'wrong-question-text');
                wrongQuestion.innerHTML = "<strong>" + quizData[question_index].question + "</strong>";          /* da implementare conn a db */
                wrongEntry.append(wrongQuestion);
            
                let wrongAnswer = document.createElement("div");
                wrongAnswer.setAttribute('id', 'wrong-answer-text');
                wrongAnswer.innerHTML = "La tua risposta: <em>" + ans['answer'] + "</em>";
                wrongEntry.append(wrongAnswer);
            
                let correctAnswer = document.createElement("div");
                correctAnswer.setAttribute('id', 'correct-answer-text');
                correctAnswer.innerHTML = "La risposta corretta: <em>" + quizData[question_index].answer + "</em>";            /* da implementare conn a db */
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
/************ GESTIONE DINAMICA QUIZ ***********/
/***********************************************/
function questionLoader(question_index) {         /* da implementare supponiamo connessione a db php che mi da quizData (per farlo posso usare altra funzione con ajax)*/
    // Carico domanda
    const questionContainer = document.getElementById("question-box");
    questionContainer.innerHTML = "<strong>" + quizData[question_index].question + "</strong>";

    // Carico risposte
    answerBtns.forEach(function(button, index) {
        button.disabled = false;        // riattivo i bottoni (disattivati quando data risposta precedente)
        button.textContent = quizData[question_index].options[index];
        button.classList.remove('correct');
        button.classList.remove('wrong');
    });
}


function questionsNavBuilder(totQuestions) {
    console.log("test navBarBuilder");

    for (let i = 0; i < totQuestions; i++) {
        // Creo bottone per navigare alla domanda i+1
        const question_i_btn = document.createElement('button');
        question_i_btn.setAttribute('id', `to-question${i+1}`);
        question_i_btn.classList.add('text-button');
        question_i_btn.classList.add('question-nav-btn');
        question_i_btn.setAttribute('type', 'button');
        question_i_btn.textContent = `${i + 1}`;

        // Aggiungo ascoltatore per quel bottone che carica la domanda
        question_i_btn.addEventListener('click', () => {
            // Carico domanda corrispondente al bottone
            questionLoader(i);

            // Cambio stato in attivo per diversa formattazione del bottone cliccato
            if(lastQuestionBtn !== null)
                lastQuestionBtn.classList.remove('active'); 
            question_i_btn.classList.add('active');
            lastQuestionBtn = question_i_btn;

            // Per scroll della scrollbar
            const scrollDistance = question_i_btn.getBoundingClientRect().left - questionsNav.getBoundingClientRect().left;
            questionsNav.scroll({
                left: scrollDistance,
                behavior: 'smooth'
            });
        });

        // Aggiungo il bottone alla barra di navigazione
        questionsNav.appendChild(question_i_btn);

        // Dò stato attivo al primo bottone all'inizio del quiz
        if (i === 0) {
            question_i_btn.classList.add('active');
            lastQuestionBtn = question_i_btn;
        }
    }
}


function checkAnswer(answerBtn) {
    // Disabilito bottoni così non posso cliccare delle altre risposte
    answerBtns.forEach(function(button) {
        button.disabled = true;
    });

    // Controllo risposta data e risposta esatta
    var answer = answerBtn.textContent;  

    let navQuestionBtn = document.querySelector('.question-nav-btn.active');      //per sapere indice della domanda
    let question_index = parseInt(navQuestionBtn.textContent)-1;
    
    // Risposta esatta
    if(answer === quizData[question_index].answer) {
        answerBtn.classList.add('correct');
        navQuestionBtn.classList.add('correct');
    }
    // Risposta sbagliata
    else {
        answerBtn.classList.add('wrong');
        navQuestionBtn.classList.add('wrong');
        wrong_answers.push({index : question_index, answer : answer});        //memorizzo risposte sbagliate
    }

    // Disattivo il bottone, la domanda non potrà più essere raggiunta
    navQuestionBtn.disabled = true;

    // Aggiorno il contatore delle risposte date
    counterAnswers.textContent = parseInt(counterAnswers.textContent) + 1;
    if(counterAnswers.textContent == 3)         /* da implementare conn a db per totale domande */
        endQuiz();
    else 
        nextQuestion();
}




/***********************************************/
/**************** GESTIONE TIMER ***************/
/***********************************************/
let timer;
let totalTime;      //tempo rimanente in sec.
let isTimerRunning = false;

function startTimer(seconds) {
    if (!isTimerRunning) {
        isTimerRunning = true;
        totalTime = seconds; 
        timer = setInterval(updateTimer, 1000);
    }
}


function updateTimer() {
    if (totalTime > 0) {
        totalTime--;
        displayTime();
    } 
    else {      //se il timer finisce
        clearInterval(timer);
        isTimerRunning = false;
        endQuiz();
    }
}  


function displayTime() {
    const minutes = Math.floor(totalTime / 60);
    const seconds = totalTime % 60;
    const formattedMinutes = formatTime(minutes);
    const formattedSeconds = formatTime(seconds);
    timerContainer.innerText = `${formattedMinutes}:${formattedSeconds}`;
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
    timerContainer.innerText = `05:00`;            /* da implementare connessione a db per tempo */
    totalTime = 0;
}