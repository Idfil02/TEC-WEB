function startQuiz(){
    console.log("test bottone play");

    /* Mostra bottoni di pausa/resa e domande/risposte e navigazione tra domande*/
    const onPlayActions = document.querySelectorAll('.on-play');
    onPlayActions.forEach(action => {
        action.classList.remove('hidden');
    });

    /* Nascondo bottone di inizio test */
    const startBtn = document.getElementById('play-button');
    startBtn.classList.add('hidden');

    /* Carico nav tra domande */
    questionsNavBuilder(3);             /*php connessione a db per sapere quante domande sono da implementare*/

    /* Carico la prima domanda */
    questionLoader(0);

    /* Inizio il timer da implementare */
    startTimer(300);           /* php connessione a db per sapere il tempo (in secondi) */
}


function stopQuiz() {
    console.log("test bottone pausa");

    changeStopStatus();
}


function changeStopStatus() {
    const resumePath = document.querySelector('.resume');
    const pausePaths = document.querySelectorAll('.pause');
    const btnText = document.getElementById('stop-button-text');
    const stopBtn = document.querySelector('#stop-button.change-size');

    /* Quando faccio pausa */
    if (resumePath.classList.contains('hidden')) {
        resumePath.classList.remove('hidden');
        pausePaths.forEach(path => {
            path.classList.add('hidden');
        });
        btnText.textContent = "Riprendi";
        stopBtn.classList.add('bigger');
        /* nascondere quiz content box da implementare*/

        /* Pauso il timer */
        pauseTimer();
    } 
    /* Quando voglio riprendere */
    else {
        resumePath.classList.add('hidden');

        pausePaths.forEach(path => {
            path.classList.remove('hidden');
        });
        btnText.textContent = "Pausa";
        stopBtn.classList.remove('bigger');
        /* mostrare quiz content box da implementare*/

        /* Riprendo il timer */
        startTimer(totalTime);
    }
}

function endQuiz() {
    console.log("test bottone fine");

    /* fermo il timer */
    pauseTimer();

    /* nascondo tutto quello che è solo in gioco */
    const onPlayActions = document.querySelectorAll('#quiz-info div.on-play');
    onPlayActions.forEach(action => {
        action.classList.add('hidden');
    });
}

function prevQuestion() {
    console.log("test prev");

    /*da implementare*/
}

function nextQuestion() {
    console.log("test next");

    /*da implementare*/
}



/* TEST */
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


function questionLoader(question_index) {         /* da implementare supponiamo connessione a db php che mi da quizData (per farlo posso usare altra funzione con ajax)*/
    const navQuestionBtn = document.querySelector('.questionNavBtn.active');

    const questionContainer = document.getElementById("question-box");
    questionContainer.innerHTML = "<strong>" + quizData[question_index].question + "</strong>";

    let answerBtns = document.querySelectorAll('#answers-box .text-button');
    answerBtns.forEach(function(button, index) {
        button.textContent = quizData[question_index].options[index];
        button.classList.remove('correct');
        button.classList.remove('wrong');
        if(navQuestionBtn.classList.contains('wrong') || navQuestionBtn.classList.contains('correct')) {
            button.disabled = true;
            /* colorare i bottoni come detto */
        }
        else {
            button.disabled = false;
        }
    });
}


let lastQuestionBtn = null;
function questionsNavBuilder(totQuestions) {
    const questionsNav = document.getElementById('questions-nav');

    console.log("test");
    for (let i = 0; i < totQuestions; i++) {                /* manca anche scroll se non ci stanno */
        const question_i_btn = document.createElement('button');
        question_i_btn.classList.add('text-button');
        question_i_btn.classList.add('questionNavBtn');
        question_i_btn.setAttribute('type', 'button');
        question_i_btn.textContent = `${i + 1}`;

        question_i_btn.addEventListener('click', () => {
            /* carico domanda corrispondente al bottone */
            questionLoader(i);

            /* tolgo evidenza da vecchio bottone premuto e evidenzio bottone relativo alla nuova domanda*/
            if(lastQuestionBtn !== null)
                lastQuestionBtn.classList.remove('active'); 
            question_i_btn.classList.add('active');
            lastQuestionBtn = question_i_btn;
        });

        questionsNav.appendChild(question_i_btn);

        if (i === 0) {          /* do stato active al primo bottone */
            question_i_btn.classList.add('active');
            lastQuestionBtn = question_i_btn;
        }
    }
}


function checkAnswer(answerBtn) {
    /* disabilito bottoni così non posso più cliccare altra risposta */
    let answerBtns = document.querySelectorAll('#answers-box .text-button');
    answerBtns.forEach(function(button) {
        button.disabled = true;
    });

    var answer = answerBtn.textContent;  

    let navQuestionBtn = document.querySelector('.questionNavBtn.active');      //per sapere indice della domanda
    let question_index = parseInt(navQuestionBtn.textContent)-1;
    
    if(answer === quizData[question_index].answer) {
        answerBtn.classList.add('correct');
        navQuestionBtn.classList.add('correct');
    }
    else {
        answerBtn.classList.add('wrong');
        navQuestionBtn.classList.add('wrong');
    }

    /* contatore risposte giuste */
    const counterAnswers = document.getElementById('n_questions_given');
    counterAnswers.textContent = parseInt(counterAnswers.textContent) + 1;
    if(counterAnswers.textContent == 3)         /* da implementare conn a db per totale domande */
        endQuiz();
    else 
        nextQuestion();

    /* da implementare ricordare quale giusta e quale sbagliata */
}


/*da implementare cosa che non posso puù ricliccare se vado nella stessa domanda già data*/




/* COSE DEL TIMER */
let timer;
let totalTime;
let isTimerRunning = false;

function startTimer(seconds) {
    if (!isTimerRunning) {
        isTimerRunning = true;
        totalTime = seconds;       /* tempo rimanente in secondi */
        timer = setInterval(updateTimer, 1000);
    }
}


function updateTimer() {
    if (totalTime > 0) {
        totalTime--;
        displayTime();
    } 
    else {      /* se finisco timer */
        clearInterval(timer);
        isTimerRunning = false;
    }
}  


function displayTime() {
    const minutes = Math.floor(totalTime / 60);
    const seconds = totalTime % 60;
    const formattedMinutes = formatTime(minutes);
    const formattedSeconds = formatTime(seconds);
    document.getElementById('time-value').innerText = `${formattedMinutes}:${formattedSeconds}`;
}
  
function formatTime(time) {
    return time < 10 ? `0${time}` : time;
}


function pauseTimer() {
    clearInterval(timer);
    isTimerRunning = false;
}


/* non so se mi serva 
function resetTimer() {
  clearInterval(timer);
  isTimerRunning = false;
  document.getElementById('display').innerText = `00:00`;
  totalTime = 0;
}*/