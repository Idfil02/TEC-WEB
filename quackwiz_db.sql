-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2024 at 03:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quackwiz_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `domande`
--

CREATE TABLE `domande` (
  `ID` int(11) NOT NULL,
  `Domanda` varchar(200) NOT NULL,
  `Risposta1` varchar(200) NOT NULL,
  `Risposta2` varchar(200) NOT NULL,
  `Risposta3` varchar(200) NOT NULL,
  `Risposta4` varchar(200) NOT NULL,
  `Risp_corretta` varchar(200) NOT NULL,
  `Quiz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `domande`
--

INSERT INTO `domande` (`ID`, `Domanda`, `Risposta1`, `Risposta2`, `Risposta3`, `Risposta4`, `Risp_corretta`, `Quiz`) VALUES
(0, 'Chi è Dean?', 'Un Winchester', 'Un angelo', 'Un lupo mannaro', 'Un Djinn', 'Un Winchester', 1),
(0, 'Qual è la capitale di Malta?', 'la Valletta', 'Cipro', 'Sophia', 'Andorra', 'la Valletta', 2),
(0, 'Chi è stato il primo presidente degli Stati Uniti?', ' Abraham Lincoln', 'Josh Adams', 'George Washington', 'Thomas Jefferson', 'George Washington', 3),
(0, 'Qual è la capitale del Giappone?', 'Tokyo', 'Seoul', 'Pechino', 'Bangkok', 'Tokyo', 4),
(0, 'Qual è il nome del protagonista della serie di libri e film "Harry Potter"?', 'Ron Weasley', 'Hermione Granger', 'Harry Potter', 'Draco Malfoy', 'Harry Potter', 5),
(0, 'Chi è il regista del film "La dolce vita" del 1960?', 'Michelangelo Antonioni', 'Federico Fellini', 'Pier Paolo Pasolini', 'Vittorio De Sica', 'Federico Fellini', 6),
(0, 'Qual è il film diretto da Alfred Hitchcock noto per la scena della doccia?', 'Psycho', 'Vertigo', 'Rebecca', 'La finestra sul cortile', 'Psycho', 7),
(0, 'Qual è il nome del leone protagonista de "Il Re Leone"?', 'Simba', 'Mufasa', 'Scar', 'Timon', 'Simba', 8),
(0, 'In quale serie TV il protagonista è un professore che organizza una rapina alla Zecca di Spagna?', 'La Casa de Papel', 'Breaking Bad', 'Stranger Things', 'Game of Thrones', 'La Casa de Papel', 9),
(0, 'Quale fiume è noto come il fiume delle sette meraviglie del mondo?', 'Nilo', 'Mississippi', 'Amazon', 'Gange', 'Nilo', 10),
(0, 'Qual è l\'oceano più grande del mondo?', 'Atlantico', 'Indiano', 'Pacifico', 'Artico', 'Pacifico', 11),
(0, 'Dove si trova la Torre Eiffel?', 'Berlino', 'Roma', 'Parigi', 'Londra', 'Parigi', 12),
(0, 'Chi ha scoperto l\'America?', 'Vasco da Gama', 'Ferdinando Magellano', 'Cristoforo Colombo', 'Amerigo Vespucci', 'Cristoforo Colombo', 13),
(0, 'Chi è stato il primo imperatore romano?', 'Cesare', 'Nerone', 'Augusto', 'Tiberio', 'Augusto', 14),
(0, 'Qual era il fiume principale dell\'Antico Egitto?', 'Eufrate', 'Tevere', 'Gange', 'Nilo', 'Nilo', 15),
(0, 'Qual è stato il famoso sovrano francese che ha condotto le Crociate?', 'Filippo II', 'Luigi XIV', 'Carlo Magno', 'Guglielmo il Conquistatore', 'Luigi XIV', 16),
(0, 'Qual è stato l\'evento che ha segnato l\'inizio della Rivoluzione Francese?', 'Caduta della Bastiglia', 'Esecuzione di Luigi XVI', 'Inizio del Terrore', 'Invasione di Napoleone', 'Caduta della Bastiglia', 17),
(0, 'Cosa determina la forma e il tipo di eruzione di un vulcano?', 'La quantità di pioggia', 'La temperatura dell\'aria', 'La composizione chimica del magma e la quantità di gas', 'La densità della vegetazione circostante', 'La composizione chimica del magma e la quantità di gas', 18),
(0, 'Qual è l\'elemento con simbolo "H" nella tavola periodica?', 'Ossigeno', 'Idrogeno', 'Elio', 'Azoto', 'Idrogeno', 19),
(0, 'Qual è l\'unità di misura standard per la massa atomica?', 'Mole', 'Kilogrammo', 'Grammo', 'Dalton', 'Dalton', 20),
(0, 'Quale insetto è noto per il suo ronzio durante il volo?', 'Formica', 'Ape', 'Coleottero', 'Moscerino', 'Ape', 21),
(0, 'Qual è il nome scientifico del gatto domestico?', 'Felis catus', 'Canis lupus', 'Felis silvestris', 'Lynx lynx', 'Felis catus', 22),
(0, 'Quando è stata fondata l\'Unione Europea?', '1957', '1967', '1977', '1987', '1957', 23),
(0, 'Quale paese ha vinto la medaglia d\'oro alle Olimpiadi estive del 2020?', 'Stati Uniti', 'Cina', 'Giappone', 'Regno Unito', 'Stati Uniti', 24),
(1, 'Chi è Sam?', 'Un Winchester', 'Un vampiro', 'Un leviatano', 'Un agente di polizia', 'Un Winchester', 1),
(1, 'Qual è la capitale del Liechtenstein?', 'Berna', 'Vaduz', 'Bucharest', 'Sondrio', 'Vaduz', 2),
(1, 'Quale presidente è noto per aver guidato il paese durante la Guerra Civile Americana?', 'Andrew Jackson', 'Abraham Lincoln', 'James Madison', 'John Adams', 'Abraham Lincoln', 3),
(1, 'Qual è la capitale dell\'Australia?', 'Melbourne', 'Sydney', 'Canberra', 'Brisbane', 'Canberra', 4),
(1, 'Qual è la casa di Hogwarts a cui appartiene Harry Potter?', 'Tassorosso', 'Grifondoro', 'Corvonero', 'Serpeverde', 'Grifondoro', 5),
(1, 'Quale film di Roberto Benigni ha vinto l\'Oscar come Miglior Film Straniero nel 1999?', 'Il mostro', 'La tigre e la neve', 'La vita è bella', 'Johnny Stecchino', 'La vita è bella', 6),
(1, 'Chi ha diretto il film "Via col vento" del 1939?', 'Orson Welles', 'Victor Fleming', 'Billy Wilder', 'Frank Capra', 'Victor Fleming', 7),
(1, 'Chi è la principessa con i capelli lunghi in "Rapunzel - L\'intreccio della torre"?', 'Belle', 'Ariel', 'Cenerentola', 'Rapunzel', 'Rapunzel', 8),
(1, 'Quale è la serie TV basata sui romanzi di George R.R. Martin ambientata nel continente di Westeros?', 'Breaking Bad', 'Stranger Things', 'Game of Thrones', 'La Casa de Papel', 'Game of Thrones', 9),
(1, 'Qual è il fiume più lungo d\'Europa?', 'Volga', 'Danubio', 'Senna', 'Tevere', 'Volga', 10),
(1, 'Qual è il mare più grande del mondo?', 'Mediterraneo', 'Baltico', 'Rosso', 'Caspico', 'Mediterraneo', 11),
(1, 'Quale è il simbolo di Roma antica?', 'Cristo Redentore', 'Statua della Libertà', 'Colosseo', 'Torre di Pisa', 'Colosseo', 12),
(1, 'Qual è il primo uomo ad aver messo piede sulla Luna?', 'Alan Shepard', 'Buzz Aldrin', 'Yuri Gagarin', 'Neil Armstrong', 'Neil Armstrong', 13),
(1, 'Quale evento segnò la fine dell\'Impero Romano d\'Occidente?', 'Caduta di Cartagine', 'Caduta di Costantinopoli', 'Caduta di Roma', 'Caduta di Gerusalemme', 'Caduta di Roma', 14),
(1, 'Chi è stato il primo faraone dell\'Antico Egitto?', 'Cleopatra', 'Ramses II', 'Narmer', 'Tutankhamon', 'Narmer', 15),
(1, 'Chi è stato il primo re unificatore dell\'Inghilterra?', 'Enrico VIII', 'Alfredo il Grande', 'Guglielmo il Conquistatore', 'Carlo Magno', 'Alfredo il Grande', 16),
(1, 'Chi è stato il re francese durante l\'inizio della Rivoluzione Francese?', 'Carlo IX', 'Carlo X', 'Luigi XVI', 'Luigi XV', 'Luigi XVI', 17),
(1, 'Quali sono i due tipi principali di vulcani?', 'Vulcani attivi e vulcani inattivi', 'Vulcani sottomarini e vulcani terrestri', 'Vulcani esplosivi e vulcani effusivi', 'Vulcani piccoli e vulcani grandi', 'Vulcani esplosivi e vulcani effusivi', 18),
(1, 'Quale elemento è noto per essere il più leggero nella tavola periodica?', 'Idrogeno', 'Ossigeno', 'Azoto', 'Carbonio', 'Idrogeno', 19),
(1, 'Cosa rappresenta la sigla "pH" nella chimica?', 'Potenza di idrogeno', 'Pressione atmosferica', 'Peso atomico', 'Potenziale di ossidazione', 'Potenza di idrogeno', 20),
(1, 'Qual è il più grande ordine di insetti?', 'Coleotteri', 'Ditteri', 'Imenotteri', 'Lepidotteri', 'Coleotteri', 21),
(1, 'Quante dita hanno i gatti sulle zampe anteriori?', '4', '5', '6', '7', '5', 22),
(1, 'Quanti stati membri fanno attualmente parte dell\'Unione Europea?', '25', '27', '30', '32', '27', 23),
(1, 'Qual è stata la città più colpita dalla pandemia di COVID-19 nel 2020?', 'New York', 'Milano', 'Wuhan', 'Rio de Janeiro', 'Wuhan', 24),
(2, 'Chi è Castiel?', 'Un angelo', 'Un vampiro', 'Un cacciatore', 'Un mutaforma', 'Un angelo', 1),
(2, 'Qual è la capitale della Svizzera?', 'Zurigo', 'Lucerna', 'Ginevra', 'Berna', 'Berna', 2),
(2, 'Quale presidente ha proclamato la Dichiarazione di Emancipazione?', 'Theodore Roosevelt', 'Franklin D. Roosevelt', 'Abraham Lincoln', 'Thomas Jefferson', 'Abraham Lincoln', 3),
(2, 'Qual è la capitale del Brasile?', 'Rio de Janeiro', 'Brasilia', 'Sao Paulo', 'Buenos Aires', 'Brasilia', 4),
(2, 'Qual è il nome del miglior amico di Harry Potter?', 'Hermione Granger', 'Ron Weasley', 'Neville Longbottom', 'Draco Malfoy', 'Ron Weasley', 5),
(2, 'Chi ha diretto il film "Ladri di biciclette" del 1948?', 'Michelangelo Antonioni', 'Pier Paolo Pasolini', 'Vittorio De Sica', 'Federico Fellini', 'Vittorio De Sica', 6),
(2, 'Qual è il film del 1972 interpretato da Marlon Brando e diretto da Francis Ford Coppola?', 'Il padrino', 'Taxi Driver', 'C\'era una volta il West', 'Il cacciatore', 'Il padrino', 7),
(2, 'In quale film troviamo il personaggio di Jafar?', 'La Bella e la Bestia', 'Aladdin', 'La Sirenetta', 'Pocahontas', 'Aladdin', 8),
(2, 'Qual è la serie TV in cui un gruppo di ragazzi negli anni \'80 affronta misteri sovrannaturali?', 'Stranger Things', 'Breaking Bad', 'Game of Thrones', 'La Casa de Papel', 'Stranger Things', 9),
(2, 'In quale continente si trova il fiume Mackenzie?', 'Europa', 'Africa', 'Asia', 'America del Nord', 'America del Nord', 10),
(2, 'In quale oceano si trova l\'Isola di Pasqua?', 'Atlantico', 'Pacifico', 'Indian', 'Artico', 'Pacifico', 11),
(2, 'Quale è la principale attrazione turistica di Londra?', 'La Torre Pendente di Pisa', 'Piramidi di Giza', 'Big Ben', 'Empire State Building', 'Big Ben', 12),
(2, 'Chi è stato il primo esploratore a circumnavigare il globo terrestre?', 'James Cook', 'Amerigo Vespucci', 'Ferdinando Magellano', 'Vasco da Gama', 'Ferdinando Magellano', 13),
(2, 'Chi è stato il fondatore di Roma secondo la leggenda?', 'Remo', 'Romolo', 'Marte', 'Enea', 'Romolo', 14),
(2, 'In quale periodo è stata costruita la Grande Piramide di Giza?', 'Nuovo Regno', 'Tarda Antichità', 'Antico Regno', 'Medio Regno', 'Antico Regno', 15),
(2, 'Qual è stato il famoso conflitto militare tra Inghilterra e Francia durante il Medioevo?', 'Guerra delle Rose', 'Guerra dei Cent\'Anni', 'Guerra dei Trent\'Anni', 'Guerra dei Ducati', 'Guerra dei Cent\'Anni', 16),
(2, 'Chi è stato il leader radicale durante il periodo del Terrore?', 'Robespierre', 'Napoleone Bonaparte', 'Marat', 'Danton', 'Robespierre', 17),
(2, 'Qual è il vulcano più alto del mondo?', 'Mauna Kea', 'Popocatépetl', 'Mount Everest', 'Mauna Loa', 'Mauna Kea', 18),
(2, 'Qual è l\'elemento con simbolo "Fe" nella tavola periodica?', 'Ferro', 'Rame', 'Zinco', 'Argento', 'Ferro', 19),
(2, 'Quale elemento chimico è noto come "il gas nobile"?', 'Idrogeno', 'Azoto', 'Elio', 'Ossigeno', 'Elio', 20),
(2, 'Qual è il processo attraverso il quale un insetto passa dalla fase larvale a quella adulta?', 'Metamorfosi', 'Mimetismo', 'Mutazione', 'Molting', 'Metamorfosi', 21),
(2, 'Qual è il termine corretto per definire il ronzio dei gatti?', 'Miagolio', 'Squittio', 'Grugnito', 'Purr', 'Purr', 22),
(2, 'Qual è la capitale dell\'Unione Europea?', 'Berlino', 'Parigi', 'Bruxelles', 'Lussemburgo', 'Bruxelles', 23),
(2, 'Chi è stato eletto Presidente degli Stati Uniti nel 2020?', 'Donald Trump', 'Joe Biden', 'Barack Obama', 'Hillary Clinton', 'Joe Biden', 24),
(3, 'Quante stagioni ha la serie?', '12', '13', '14', '15', '15', 1),
(3, 'Qual è la capitale della Romania?', 'Budapest', 'Bucharest', 'Sophia', 'Kiev', 'Bucharest', 2),
(3, 'Quale presidente ha guidato gli Stati Uniti durante la Seconda Guerra Mondiale?', 'Franklin D. Roosevelt', 'Harry S. Truman', 'Dwight D. Eisenhower', 'John F. Kennedy', 'Franklin D. Roosevelt', 3),
(3, 'Qual è la capitale della Francia?', 'Londra', 'Roma', 'Parigi', 'Berlino', 'Parigi', 4),
(3, 'Chi è il direttore della scuola di magia e stregoneria di Hogwarts?', 'Albus Silente', 'Severus Piton', 'Minerva McGranitt', 'Rubeus Hagrid', 'Albus Silente', 5),
(3, 'Qual è il nome del regista italiano noto per il suo stile neorealista?', 'Vittorio De Sica', 'Michelangelo Antonioni', 'Federico Fellini', 'Pier Paolo Pasolini', 'Vittorio De Sica', 6),
(3, 'Chi ha diretto il film "C\'era una volta in America" del 1984?', 'Sergio Leone', 'Quentin Tarantino', 'Francis Ford Coppola', 'Martin Scorsese', 'Sergio Leone', 7),
(3, 'Qual è il nome del capitano del galeone che appare in "Peter Pan"?', 'Capitan Uncino', 'Capitan America', 'Capitan Nemo', 'Capitan Sparrow', 'Capitan Uncino', 8),
(3, 'In quale serie TV il protagonista è un chimico che diventa un produttore di metanfetamine?', 'Breaking Bad', 'Stranger Things', 'Game of Thrones', 'La Casa de Papel', 'Breaking Bad', 9),
(3, 'Quale fiume attraversa la città di Parigi?', 'Tamigi', 'Senna', 'Tevere', 'Danubio', 'Senna', 10),
(3, 'Qual è il mare più salato del mondo?', 'Mediterraneo', 'Baltico', 'Morto', 'Caspico', 'Morto', 11),
(3, 'Dove si trova il Taj Mahal?', 'Cina', 'Egitto', 'India', 'Giappone', 'India', 12),
(3, 'Chi è stato il primo a fare il giro del mondo in mongolfiera senza scalo?', 'Brian Jones', 'Bertrand Piccard', 'Richard Branson', 'Steve Fossett', 'Bertrand Piccard', 13),
(3, 'Qual è stata la durata approssimativa dell\'Impero Romano?', 'Circa 200 anni', 'Circa 700 anni', 'Circa 1000 anni', 'Circa 500 anni', 'Circa 500 anni', 14),
(3, 'Chi è stato il famoso faraone noto per la sua tomba intatta ritrovata nel 1922?', 'Amenhotep III', 'Hatshepsut', 'Tutankhamon', 'Ramses II', 'Tutankhamon', 15),
(3, 'Chi è stato il famoso condottiero normanno che conquistò l\'Inghilterra nel 1066?', 'Enrico VIII', 'Guglielmo il Conquistatore', 'Carlo Magno', 'Filippo II', 'Guglielmo il Conquistatore', 16),
(3, 'Qual è stata la famosa battaglia in cui Napoleone sconfisse le forze austriache e russe?', 'Battaglia di Austerlitz', 'Battaglia di Borodino', 'Battaglia di Lipsia', 'Battaglia di Waterloo', 'Battaglia di Austerlitz', 17),
(3, 'Quale di questi vulcani è famoso per l\'eruzione del 79 d.C. che seppellì Pompei?', 'Stromboli', 'Vesuvio', 'Kilauea', 'Etna', 'Vesuvio', 18),
(3, 'Quale elemento è presente in maggior quantità nell\'atmosfera terrestre?', 'Ossigeno', 'Idrogeno', 'Azoto', 'Elio', 'Azoto', 19),
(3, 'Cosa indica il termine "catalizzatore" in chimica?', 'Un composto che accelera una reazione chimica', 'Un composto che rallenta una reazione chimica', 'Un composto che cambia il colore di una reazione chimica', 'Un composto che non ha effetto su una reazione chimica', 'Un composto che accelera una reazione chimica', 20),
(3, 'Quale tra questi insetti è noto per le sue abilità di mimetizzazione?', 'Cicala', 'Farfalla', 'Cavalletta', 'Mantide religiosa', 'Mantide religiosa', 21),
(3, 'Qual è il nome della specie selvatica da cui il gatto domestico deriva?', 'Felis catus', 'Panthera leo', 'Felis silvestris', 'Lynx lynx', 'Felis silvestris', 22),
(3, 'Qual è la moneta ufficiale dell\'Unione Europea?', 'Dollaro', 'Euro', 'Sterlina', 'Franchi', 'Euro', 23),
(3, 'Quale evento ha scatenato una forte crisi umanitaria nel 2021?', 'Incendio della Torre Grenfell', 'Esplosione del porto di Beirut', 'Inondazioni in India', 'Crash di un aereo di linea', 'Esplosione del porto di Beirut', 24),
(4, 'Qual è la stagione più corta?', '7', '15', '3', '12', '3', 1),
(4, 'Qual è la capitale della Bielorussia?', 'Kiev', 'Minsk', 'San Pietroburgo', 'Riga', 'Minsk', 2),
(4, 'Chi è stato il primo presidente ad affrontare un processo di impeachment?', 'Bill Clinton', 'Richard Nixon', 'Andrew Johnson', 'Donald Trump', 'Andrew Johnson', 3),
(4, 'Qual è la capitale della Spagna?', 'Barcellona', 'Madrid', 'Siviglia', 'Valencia', 'Madrid', 4),
(4, 'Qual è il nome del mago oscuro che uccise i genitori di Harry Potter?', 'Lord Voldemort', 'Gellert Grindelwald', 'Bellatrix Lestrange', 'Lucius Malfoy', 'Lord Voldemort', 5),
(4, 'Chi ha diretto il film "Nuovo Cinema Paradiso" del 1988?', 'Bernardo Bertolucci', 'Federico Fellini', 'Roberto Benigni', 'Giuseppe Tornatore', 'Giuseppe Tornatore', 6),
(4, 'Qual è il film del 1957 diretto da Ingmar Bergman?', 'La dolce vita', 'L\'ottavo giorno', 'Det sjunde inseglet', 'Ladri di biciclette', 'Det sjunde inseglet', 7),
(4, 'Chi è il nemico principale nel film "La Sirenetta"?', 'Ursula', 'Malefica', 'Cruella De Vil', 'Regina Cattiva', 'Ursula', 8),
(4, 'Quale è la serie TV che racconta la storia di una comunità che si confronta con gli zombi in un mondo post-apocalittico?', 'The Walking Dead', 'Breaking Bad', 'Stranger Things', 'Game of Thrones', 'The Walking Dead', 9),
(4, 'Qual è il fiume più lungo della Cina?', 'Yangtze', 'Giallo', 'Mekong', 'Huang He', 'Yangtze', 10),
(4, 'Qual è l\'oceano più freddo del mondo?', 'Atlantico', 'Pacifico', 'Indiano', 'Artico', 'Artico', 11),
(4, 'Quale è il nome della grande piramide di Giza?', 'Piramide di Cheope', 'Piramide di Chefren', 'Piramide di Micerino', 'Piramide di Kufu', 'Piramide di Cheope', 12),
(4, 'Chi è stato il primo uomo a raggiungere il Polo Sud?', 'Richard Byrd', 'Robert Falcon Scott', 'Roald Amundsen', 'Ernest Shackleton', 'Roald Amundsen', 13),
(4, 'Chi è stato il famoso generale cartaginese che combatté contro Roma durante le guerre puniche?', 'Cicerone', 'Bruto', 'Scipione', 'Annibale', 'Annibale', 14),
(4, 'Qual era il principale sistema di scrittura dell\'Antico Egitto?', 'Geroglifici', 'Cuneiforme', 'Alfabeto greco', 'Pictogrammi', 'Geroglifici', 15),
(4, 'Quale città italiana è stata un importante centro commerciale e marittimo durante il Rinascimento?', 'Venezia', 'Firenze', 'Milano', 'Genova', 'Venezia', 16),
(4, 'Quale è stata la famosa marcia militare di Napoleone in Russia?', 'Marcia su Mosca', 'Marcia su San Pietroburgo', 'Marcia della Morte', 'Marcia su Parigi', 'Marcia su Mosca', 17),
(4, 'Qual è il vulcano più grande del Sistema Solare?', 'Etna', 'Olympus Mons', 'Vesuvio', 'Kīlauea', 'Olympus Mons', 18),
(4, 'Qual è l\'elemento più abbondante nell\'universo?', 'Idrogeno', 'Ossigeno', 'Carbonio', 'Elio', 'Idrogeno', 19),
(4, 'Quale è il termine generale per una sostanza che non può essere decomposta in sostanze più semplici attraverso reazioni chimiche?', 'Elemento', 'Composto', 'Molecola', 'Materia', 'Elemento', 20),
(4, 'Qual è l\'ordine degli insetti che include le mosche e le zanzare?', 'Coleotteri', 'Imenotteri', 'Ditteri', 'Lepidotteri', 'Ditteri', 21),
(4, 'Quanto tempo mediamente dorme un gatto al giorno?', '8 ore', '12 ore', '16 ore', '20 ore', '16 ore', 22),
(4, 'Qual è la sede del Parlamento Europeo?', 'Strasburgo', 'Bruxelles', 'Francoforte', 'Milano', 'Strasburgo', 23),
(4, 'Chi è stato il vincitore del premio Nobel per la pace nel 2020?', 'Greta Thunberg', 'Donald Trump', 'Organizzazione Mondiale della Sanità', 'Programma Alimentare Mondiale', 'Programma Alimentare Mondiale', 24),
(5, 'Come si chiama la macchina dei fratelli Winchester?', 'Jessica', 'Baby', 'Amara', 'Meg', 'Baby', 1),
(5, 'Qual è la capitale dell\'Italia?', 'Madrid', 'Berlino', 'Roma', 'Parigi', 'Roma', 2),
(5, 'Chi è stato il primo presidente afroamericano degli Stati Uniti?', 'Barack Obama', 'Bill Clinton', 'George W. Bush', 'Joe Biden', 'Barack Obama', 3),
(5, 'Qual è la capitale della Cina?', 'Shanghai', 'Pechino', 'Hong Kong', 'Seoul', 'Pechino', 4),
(5, 'Qual è il titolo del primo libro della serie di Harry Potter?', 'Harry Potter e i Doni della Morte', 'Harry Potter e il Principe Mezzosangue', 'Harry Potter e la Pietra Filosofale', 'Harry Potter e il Calice di Fuoco', 'Harry Potter e la Pietra Filosofale', 5),
(5, 'Quale regista italiano ha vinto l\'Oscar al Miglior Regista per il film "La grande bellezza" nel 2014?', 'Marco Bellocchio', 'Matteo Garrone', 'Paolo Sorrentino', 'Nanni Moretti', 'Paolo Sorrentino', 6),
(5, 'Chi ha diretto il film "Schindler\'s List" del 1993?', 'Steven Spielberg', 'James Cameron', 'Christopher Nolan', 'Martin Scorsese', 'Steven Spielberg', 7),
(5, 'Qual è il nome del pesce pagliaccio protagonista de "Alla ricerca di Nemo"?', 'Dory', 'Marlin', 'Nemo', 'Gill', 'Marlin', 8),
(5, 'In quale serie TV un gruppo di sopravvissuti cerca rifugio su una nave spaziale dopo la distruzione della Terra?', 'The 100', 'Lost', 'Black Mirror', 'The Expanse', 'The 100', 9),
(5, 'In quale paese si trova il fiume Volga?', 'Russia', 'Germania', 'Francia', 'Italia', 'Russia', 10),
(5, 'Qual è il mare interno più grande del mondo?', 'Mediterraneo', 'Baltico', 'Rosso', 'Caspico', 'Caspico', 11),
(5, 'In quale città si trova la Grande Muraglia Cinese?', 'Pechino', 'Shanghai', 'Hong Kong', 'Tokyo', 'Pechino', 12),
(5, 'Chi è stato il primo uomo a fare il giro del mondo in barca a vela in solitaria e senza scalo?', 'Robin Knox-Johnston', 'Bernard Moitessier', 'Sir Francis Chichester', 'Joshua Slocum', 'Joshua Slocum', 13),
(5, 'Qual è stata la principale causa della caduta dell\'Impero Romano?', 'Cambiamenti climatici', 'Decadenza economica e pressione delle invasioni barbariche', 'Epidemie di peste', 'Rivolte interne', 'Decadenza economica e pressione delle invasioni barbariche', 14),
(5, 'Qual era il nome della dea egizia della fertilità?', 'Isis', 'Osiride', 'Anubi', 'Horus', 'Isis', 15),
(5, 'Chi è stato il grande imperatore del Sacro Romano Impero durante il Medioevo?', 'Federico II', 'Carlo Magno', 'Francesco Giuseppe', 'Guglielmo il Conquistatore', 'Carlo Magno', 16),
(5, 'Qual è stata la forma di governo istituita da Napoleone dopo il colpo di stato del 18 Brumaio?', 'Impero', 'Repubblica', 'Monarchia', 'Oligarchia', 'Impero', 17),
(5, 'Qual è il vulcano più attivo del Giappone?', 'Sakurajima', 'Fujisan', 'Krakatoa', 'Kilauea', 'Sakurajima', 18),
(5, 'Quale elemento è noto per essere altamente reattivo con l\'acqua?', 'Ossigeno', 'Idrogeno', 'Sodio', 'Potassio', 'Sodio', 19),
(5, 'Qual è il nome dell\'equilibrio tra stati solido, liquido e gassoso di una sostanza a una certa temperatura e pressione?', 'Equilibrio termico', 'Equilibrio chimico', 'Punto di fusione', 'Punto triplo', 'Punto triplo', 20),
(5, 'Quale insetto è noto per il suo veleno e le sue colonie sociali?', 'Formica', 'Scarabeo', 'Locusta', 'Zanzara', 'Formica', 21),
(5, 'Qual è la velocità massima che un gatto può raggiungere?', '20 km/h', '30 km/h', '40 km/h', '50 km/h', '50 km/h', 22),
(5, 'Quale istituzione dell\'Unione Europea ha il compito di garantire la conformità delle leggi comunitarie nei Paesi membri?', 'Commissione Europea', 'Parlamento Europeo', 'Corte di Giustizia dell\'Unione Europea', 'Consiglio Europeo', 'Corte di Giustizia dell\'Unione Europea', 23),
(5, 'Quale fenomeno climatico estremo ha colpito la regione dell\'Artico nel 2020?', 'Tornado', 'Tsunami', 'Tempesta di sabbia', 'Ondata di calore', 'Ondata di calore', 24),
(6, 'Chi non è mai stato Satana?', 'Sam', 'Castiel', 'Dean', 'Nick', 'Dean', 1),
(6, 'Qual è la capitale della Francia?', 'Parigi', 'Londra', 'Madrid', 'Lisbona', 'Parigi', 2),
(6, 'Chi è stato il presidente durante gli attacchi dell\'11 settembre 2001?', 'George W. Bush', 'Bill Clinton', 'George H. W. Bush', 'Barack Obama', 'George W. Bush', 3),
(6, 'Qual è la capitale del Canada?', 'Toronto', 'Vancouver', 'Ottawa', 'Montreal', 'Ottawa', 4),
(6, 'Chi è l\'autore dei libri della serie di Harry Potter?', 'J.R.R. Tolkien', 'Stephen King', 'J.K. Rowling', 'George R.R. Martin', 'J.K. Rowling', 5),
(6, 'Qual è il film di Michelangelo Antonioni ambientato a Ferrara e interpretato da Monica Vitti?', 'L\'Avventura', 'La notte', 'Il deserto rosso', 'L\'Eclisse', 'L\'Avventura', 6),
(6, 'Qual è il film del 1942 diretto da Michael Curtiz e interpretato da Humphrey Bogart e Ingrid Bergman?', 'Casablanca', 'Gone with the Wind', 'Sunset Boulevard', 'The Maltese Falcon', 'Casablanca', 7),
(6, 'In quale film Disney la protagonista è una giovane guerriera polinesiana?', 'La Sirenetta', 'Pocahontas', 'Moana', 'Frozen', 'Moana', 8),
(6, 'Quale è la serie TV che segue le vicende di una famiglia che gestisce un\'azienda di aceto balsamico?', 'Master of None', 'Schitt\'s Creek', 'Parks and Recreation', 'Arrested Development', 'Schitt\'s Creek', 9),
(6, 'Quale fiume è conosciuto come il fiume delle tre capitali?', 'Tevere', 'Tamigi', 'Danubio', 'Rio delle Amazzoni', 'Danubio', 10),
(6, 'In quale oceano si trova l\'Isola di Giamaica?', 'Atlantico', 'Pacifico', 'Indiano', 'Artico', 'Atlantico', 11),
(6, 'Quale monumento è situato a Machu Picchu?', 'Cittadella Inca', 'Grande Muraglia', 'Torre di Pisa', 'Colosseo', 'Cittadella Inca', 12),
(6, 'Chi è stato il primo a raggiungere il Polo Nord?', 'Robert Edwin Peary', 'Frederick Cook', 'Roald Amundsen', 'Richard Byrd', 'Robert Edwin Peary', 13),
(6, 'Qual era la struttura sociale dell\'Antica Roma?', 'Borghesi e proletari', 'Nobiltà e contadini', 'Patrizi e plebei', 'Schiavi e padroni', 'Patrizi e plebei', 14),
(6, 'Qual era il nome della città sacra dell\'Antico Egitto, sede del culto del dio Amon?', 'Tebe', 'Luxor', 'Heliopoli', 'Menfi', 'Tebe', 15),
(6, 'Qual è stata la famosa epidemia di peste che ha devastato l\'Europa nel XIV secolo?', 'Peste di Atene', 'Peste di Londra', 'Peste di Costantinopoli', 'Peste Nera', 'Peste Nera', 16),
(6, 'Qual è stato il famoso codice legale introdotto da Napoleone?', 'Codice Napoleonico', 'Codice di Hammurabi', 'Codice di Giustiniano', 'Codice di Draco', 'Codice Napoleonico', 17),
(6, 'Qual è la temperatura media della lava in un\'eruzione vulcanica?', '50°C', '200°C', '500°C', '1000°C', '1000°C', 18),
(6, 'Quale elemento è usato comunemente come combustibile nei razzi?', 'Ossigeno', 'Idrogeno', 'Carbonio', 'Azoto', 'Idrogeno', 19),
(6, 'Quale è l\'elemento chimico più abbondante nella crosta terrestre?', 'Ossigeno', 'Idrogeno', 'Carbonio', 'Silicio', 'Ossigeno', 20),
(6, 'Qual è l\'insetto noto per la sua capacità di produrre seta?', 'Falena', 'Ragnatela', 'Vespa', 'Baco da seta', 'Baco da seta', 21),
(6, 'Qual è il riflesso di cui godono i gatti che permette loro di ritrovarsi a quattro zampe dopo una caduta?', 'Riflesso di Moro', 'Riflesso di suzione', 'Riflesso di Landau', 'Riflesso corneale', 'Riflesso di Landau', 22),
(6, 'Quale stato membro è stato l\'ultimo ad aderire all\'Unione Europea?', 'Croazia', 'Romania', 'Bulgaria', 'Slovenia', 'Croazia', 23),
(6, 'Quale importante accordo internazionale è stato ratificato dagli Stati Uniti nel 2021?', 'Accordo di Parigi sul clima', 'Accordo di Brexit', 'Accordo di libero scambio tra Stati Uniti e Cina', 'Accordo commerciale NAFTA', 'Accordo di Parigi sul clima', 24),
(7, 'Quante volte è morto Dean?', '111', '5', '73', '14', '111', 1),
(7, 'Qual è la capitale della Germania?', 'Vienna', 'Amsterdam', 'Berlino', 'Budapest', 'Berlino', 2),
(7, 'Chi è stato il primo presidente ad essere assassinato durante il mandato?', 'John F. Kennedy', 'Abraham Lincoln', 'James A. Garfield', 'William McKinley', 'Abraham Lincoln', 3),
(7, 'Qual è la capitale dell\'Argentina?', 'Buenos Aires', 'Santiago', 'Rio de Janeiro', 'Lima', 'Buenos Aires', 4),
(7, 'Qual è il nome della scuola frequentata da Harry Potter?', 'Il Collegio Invisible', 'Hogwarts', 'Beauxbatons', 'Durmstrang', 'Hogwarts', 5),
(7, 'Chi è l\'attore protagonista del film "Cinema Paradiso" del 1988?', 'Vittorio Gassman', 'Giancarlo Giannini', 'Marcello Mastroianni', 'Massimo Troisi', 'Massimo Troisi', 6),
(7, 'Chi ha diretto il film "La parola ai giurati" del 1957?', 'Sidney Lumet', 'Akira Kurosawa', 'Billy Wilder', 'Alfred Hitchcock', 'Sidney Lumet', 7),
(7, 'Chi è la protagonista del film "La Bella e la Bestia"?', 'Aurora', 'Belle', 'Jasmine', 'Cenerentola', 'Belle', 8),
(7, 'In quale serie TV una donna ritrova se stessa dopo il divorzio grazie alla danza del ventre?', 'The Marvelous Mrs. Maisel', 'Fleabag', 'Big Little Lies', 'GLOW', 'The Marvelous Mrs. Maisel', 9),
(7, 'Qual è il fiume più lungo d\'Africa?', 'Nilo', 'Congo', 'Zambezi', 'Niger', 'Nilo', 10),
(7, 'Qual è il mare che separa l\'Europa dall\'Africa?', 'Mediterraneo', 'Baltico', 'Rosso', 'Caspico', 'Mediterraneo', 11),
(7, 'Quale città ospita la Statua della Libertà?', 'New York', 'Los Angeles', 'Chicago', 'Miami', 'New York', 12),
(7, 'Chi ha compiuto il primo viaggio in aereo senza scalo intorno al mondo?', 'Wiley Post', 'Amelia Earhart', 'Charles Lindbergh', 'Howard Hughes', 'Wiley Post', 13),
(7, 'Chi fu l\'ultimo imperatore romano?', 'Diocleziano', 'Costantino', 'Romolo Augusto', 'Traiano', 'Romolo Augusto', 14),
(7, 'Qual era il nome della lingua parlata nell\'Antico Egitto?', 'Copto', 'Arabo', 'Egizio', 'Greco', 'Egizio', 15),
(7, 'Chi è stato il famoso monarca inglese conosciuto come "Lionheart"?', 'Riccardo Cuor di Leone', 'Enrico VIII', 'Edoardo I', 'Guglielmo il Conquistatore', 'Riccardo Cuor di Leone', 16),
(7, 'Chi è stato il leader della prima fase della Rivoluzione Francese, noto per il suo ruolo nella presa della Bastiglia?', 'Robespierre', 'Marat', 'Danton', 'Mirabeau', 'Marat', 17),
(7, 'Qual è il più grande sistema vulcanico del mondo?', 'Hawaiian-Emperor', 'Yellowstone', 'Alaska Peninsula', 'Isole Eolie', 'Yellowstone', 18),
(7, 'Qual è l\'elemento con simbolo "C" nella tavola periodica?', 'Carbonio', 'Calcio', 'Cadmio', 'Cesio', 'Carbonio', 19),
(7, 'Quale tipo di legame chimico coinvolge la condivisione di elettroni tra atomi?', 'Legame ionico', 'Legame covalente', 'Legame metallico', 'Legame a idrogeno', 'Legame covalente', 20),
(7, 'Quale insetto è noto per il suo forte odore quando disturbato?', 'Cimice', 'Scarafaggio', 'Coleottero', 'Cicada', 'Cimice', 21),
(7, 'Quale parte del corpo dei gatti è nota per essere sensibile alle correnti elettriche statiche?', 'Orecchie', 'Zampe', 'Codino', 'Naso', 'Zampe', 22),
(7, 'Quale dei seguenti paesi non fa parte dell\'Unione Europea?', 'Norvegia', 'Svizzera', 'Liechtenstein', 'Islanda', 'Norvegia', 23),
(7, 'Qual è stata la principale causa di proteste di massa in vari paesi nel 2020?', 'Aumento del costo della vita', 'Scandali politici', 'Riforme del sistema sanitario', 'Riforme educative', 'Aumento del costo della vita', 24),
(8, 'Chi non è un demone?', 'Crowley', 'Rowena', 'Meg', 'Azazel', 'Rowena', 1),
(8, 'Qual è la capitale del Regno Unito?', 'Dublino', 'Londra', 'Oslo', 'Stoccolma', 'Londra', 2),
(8, 'Quale presidente ha guidato il paese durante la guerra del Vietnam?', 'Dwight D. Eisenhower', 'John F. Kennedy', 'Lyndon B. Johnson', 'Richard Nixon', 'Lyndon B. Johnson', 3),
(8, 'Qual è la capitale del Messico?', 'Città del Messico', 'Madrid', 'Bogotà', 'Lima', 'Città del Messico', 4),
(8, 'Qual è il titolo del settimo libro della serie di Harry Potter?', 'Harry Potter e l\'Ordine della Fenice', 'Harry Potter e il Calice di Fuoco', 'Harry Potter e i Doni della Morte', 'Harry Potter e il Principe Mezzosangue', 'Harry Potter e i Doni della Morte', 5),
(8, 'Quale regista italiano ha diretto il film "Il conformista" del 1970?', 'Pier Paolo Pasolini', 'Luchino Visconti', 'Bernardo Bertolucci', 'Federico Fellini', 'Bernardo Bertolucci', 6),
(8, 'Qual è il film del 1962 diretto da David Lean e basato sul romanzo di Boris Pasternak?', 'Lawrence d\'Arabia', 'La grande fuga', 'Il ponte sul fiume Kwai', 'Dr. Strangelove', 'Lawrence d\'Arabia', 7),
(8, 'Qual è il nome del piccolo elefante con le orecchie grandi protagonista del suo film?', 'Dumbo', 'Bambi', 'Timothy', 'Jumbo Jr.', 'Dumbo', 8),
(8, 'Quale è la serie TV in cui un gruppo di agenti governativi combatte minacce sovrannaturali?', 'Stranger Things', 'The X-Files', 'Supernatural', 'Buffy l\'ammazzavampiri', 'The X-Files', 9),
(8, 'Quale fiume attraversa la città di Vienna?', 'Tevere', 'Senna', 'Danubio', 'Tamigi', 'Danubio', 10),
(8, 'Qual è il più grande mare del Nord?', 'Baltico', 'Mediterraneo', 'Rosso', 'Caspico', 'Baltico', 11),
(8, 'Dove si trova la Basilica di San Pietro?', 'Barcellona', 'Parigi', 'Roma', 'Città del Vaticano', 'Città del Vaticano', 12),
(8, 'Chi è stato il primo a raggiungere il Polo Nord magnetico?', 'James Clark Ross', 'Roald Amundsen', 'Richard Byrd', 'Robert Edwin Peary', 'James Clark Ross', 13),
(8, 'Quale famoso politico e generale romano governò come dittatore per un breve periodo?', 'Giulio Cesare', 'Marco Antonio', 'Pompeo', 'Cicerone', 'Giulio Cesare', 14),
(8, 'Chi è stata la famosa regina d\'Egitto che stabilì una relazione con Marco Antonio?', 'Cleopatra', 'Nefertiti', 'Hatshepsut', 'Nefertari', 'Cleopatra', 15),
(8, 'Qual è stato il famoso documento inglese del 1215 che limitava il potere del re?', 'Carta Magna', 'Bill of Rights', 'Statuto di Westminster', 'Editto di Nantes', 'Carta Magna', 16),
(8, 'Qual è stato il periodo di governo di Napoleone in Francia dopo il suo ritorno dall\'esilio di Elba?', 'I Cento Giorni', 'La Restaurazione', 'Il Consolato', 'Il Direttorio', 'I Cento Giorni', 17),
(8, 'Quale famoso vulcano è noto per le sue eruzioni esplosive e la cenere vulcanica che ha influenzato il clima mondiale?', 'Vesuvio', 'Kīlauea', 'Krakatoa', 'Mauna Loa', 'Krakatoa', 18),
(8, 'Quale elemento è presente principalmente negli ossa e nei denti?', 'Ferro', 'Calcio', 'Fosforo', 'Sodio', 'Calcio', 19),
(8, 'Qual è il processo chimico attraverso il quale le piante convertono la luce solare in energia chimica?', 'Fotosintesi', 'Respirazione', 'Fermentazione', 'Decomposizione', 'Fotosintesi', 20),
(8, 'Qual è l\'ordine degli insetti che include le api, le vespe e le formiche?', 'Imenotteri', 'Coleotteri', 'Ditteri', 'Lepidotteri', 'Imenotteri', 21),
(8, 'Qual è il nome della pelliccia morbida e soffice che si trova sul collo di alcuni gatti?', 'Cravatta', 'Collare', 'Scialle', 'Collare di Venere', 'Cravatta', 22),
(8, 'Qual è il simbolo dell\'Unione Europea?', 'Stella', 'Quadrato', 'Cerchio', 'Triangolo', 'Stella', 23),
(8, 'Qual è stata la principale causa di preoccupazione per la sicurezza alimentare nel 2021?', 'Carenza di acqua potabile', 'Crollo dei prezzi dei prodotti alimentari', 'Aumento della domanda di prodotti agricoli', 'Siccità e cambiamenti climatici', 'Siccità e cambiamenti climatici', 24),
(9, 'In quale stagione appaiono per la prima volta gli angeli?', '4', '2', '6', '7', '4', 1),
(9, 'Qual è la capitale della Spagna?', 'Madrid', 'Barcellona', 'Lisbona', 'Roma', 'Madrid', 2),
(9, 'Chi è stato il presidente statunitense che ha autorizzato l\'uso della bomba atomica durante la Seconda Guerra Mondiale?', 'Franklin D. Roosevelt', 'Harry S. Truman', 'Dwight D. Eisenhower', 'John F. Kennedy', 'Harry S. Truman', 3),
(9, 'Qual è la capitale della Russia?', 'Mosca', 'San Pietroburgo', 'Kiev', 'Varsavia', 'Mosca', 4),
(9, 'Qual è il nome del gioco di magia preferito dai maghi in Harry Potter?', 'Spellball', 'Quidditch', 'Wizball', 'Magiball', 'Quidditch', 5),
(9, 'Chi ha diretto il film "Roma città aperta" del 1945?', 'Vittorio De Sica', 'Federico Fellini', 'Michelangelo Antonioni', 'Roberto Rossellini', 'Roberto Rossellini', 6),
(9, 'Chi ha diretto il film "2001: Odissea nello spazio" del 1968?', 'George Lucas', 'Stanley Kubrick', 'Ridley Scott', 'David Lynch', 'Stanley Kubrick', 7),
(9, 'In quale film una giovane principessa si unisce ad un ladro per recuperare una lampada magica?', 'La Bella e la Bestia', 'Aladdin', 'Il Libro della Giungla', 'La Sirenetta', 'Aladdin', 8),
(9, 'In quale serie TV un gruppo di ragazzi vivono avventure fantastiche grazie a una macchina del tempo?', 'Stranger Things', 'Doctor Who', 'Black Mirror', 'Dark', 'Doctor Who', 9),
(9, 'In quale paese si trova il fiume Colorado?', 'Stati Uniti', 'Messico', 'Canada', 'Argentina', 'Stati Uniti', 10),
(9, 'Qual è il mare più caldo del mondo?', 'Mediterraneo', 'Baltico', 'Rosso', 'Caspico', 'Rosso', 11),
(9, 'Qual è il monumento più visitato al mondo?', 'Grande Muraglia', 'Piramide di Cheope', 'Torre Eiffel', 'Colosseo', 'Torre Eiffel', 12),
(9, 'Chi è stato il primo uomo ad attraversare la Terra in senso longitudinale?', 'David Kunst', 'Ralph Plaisted', 'Colin Angus', 'Walt Disney', 'David Kunst', 13),
(9, 'Qual è stato il nome dell\'impero romano orientale dopo la divisione?', 'Impero Bizantino', 'Impero Carolingio', 'Impero Ottomano', 'Impero Persiano', 'Impero Bizantino', 14),
(9, 'Qual era il nome del famoso scriba e funzionario dell\'Antico Egitto noto per la sua tomba decorata?', 'Khufu', 'Imhotep', 'Anubi', 'Nebamun', 'Nebamun', 15),
(9, 'Chi è stato il famoso condottiero e politico fiorentino durante il Rinascimento?', 'Dante Alighieri', 'Leonardo da Vinci', 'Michelangelo Buonarroti', 'Cosimo de\' Medici', 'Cosimo de\' Medici', 16),
(9, 'Qual è stata la famosa sconfitta finale di Napoleone?', 'Battaglia di Waterloo', 'Battaglia di Lipsia', 'Battaglia di Austerlitz', 'Battaglia di Borodino', 'Battaglia di Waterloo', 17),
(9, 'Qual è il vulcano più alto d\'Europa?', 'Stromboli', 'Etna', 'Vesuvio', 'Teide', 'Etna', 18),
(9, 'Quale elemento è usato per la produzione di batterie alcaline?', 'Ferro', 'Lithio', 'Sodio', 'Potassio', 'Lithio', 19),
(9, 'Quale gas è rilasciato durante la decomposizione dei composti organici?', 'Azoto', 'Ossigeno', 'Anidride carbonica', 'Idrogeno', 'Anidride carbonica', 20),
(9, 'Quale insetto è noto per il suo "canto" notturno?', 'Cavalletta', 'Grillo', 'Locusta', 'Zanzara', 'Grillo', 21),
(9, 'Quale pianta è nota per essere tossica per i gatti se ingerita?', 'Aloe vera', 'Lavanda', 'Menta', 'Lillà', 'Aloe vera', 22),
(9, 'Qual è l\'organo dell\'Unione Europea che ha il compito di adottare la legislazione europea e di definire le politiche dell\'UE?', 'Commissione Europea', 'Parlamento Europeo', 'Corte di Giustizia dell\'Unione Europea', 'Consiglio dell\'Unione Europea', 'Consiglio dell\'Unione Europea', 23),
(9, 'Quale celebrità è diventata la persona più seguita su Instagram nel 2020?', 'Kylie Jenner', 'Cristiano Ronaldo', 'Beyoncé', 'Dwayne Johnson', 'Cristiano Ronaldo', 24),
(10, 'Qual è la capitale della Danimarca?', 'Copenaghen', 'Stoccolma', 'Oslo', 'Helsinki', 'Copenaghen', 2),
(10, 'Qual è la capitale del Kazakistan?', 'Astana', 'Almaty', 'Nur-Sultan', 'Bishkek', 'Nur-Sultan', 4),
(11, 'Qual è la capitale della Macedonia?', 'Atene', 'Bucarest', 'Belgrado', 'Skopje', 'Skopje', 2),
(11, 'Qual è la capitale della Mongolia?', 'Ulan Bator', 'Kuala Lumpur', 'Bangkok', 'Seoul', 'Ulan Bator', 4),
(12, 'Qual è la capitale della Zambia?', 'Lusaka', 'Nairobi', 'Kigali', 'Harare', 'Lusaka', 4),
(13, 'Qual è la capitale del Bhutan?', 'Thimphu', 'Kathmandu', 'New Delhi', 'Dhaka', 'Thimphu', 4);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(200) NOT NULL,
  `Descrizione` varchar(500) NOT NULL,
  `Categoria` varchar(20) NOT NULL,
  `Tempo` int(11) NOT NULL,
  `Num_Like` int(11) NOT NULL,
  `Num_Giocate` int(11) NOT NULL,
  `Url_Immagine` varchar(200) NOT NULL,
  `Num_Domande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`ID`, `Nome`, `Descrizione`, `Categoria`, `Tempo`, `Num_Like`, `Num_Giocate`, `Url_Immagine`, `Num_Domande`) VALUES
(1, 'Quante ne sai su Supernatural?', 'Metti alla prova la tua conoscenza sulla serie TV Supernatural rispondendo a queste domande.', 'Intrattenimento', 240, 0, 0, 'img/spn.jpg', 10),
(2, 'Quante ne sai sulle capitali d\'Europa?', 'Sei un campione sulla Geografia? Testa le tue abilità indovinando queste capitali europee.', 'Geografia', 300, 0, 0, 'img/eu.jpg', 12),
(3, 'Quante ne sai sui presidenti americani?', 'Metti alla prova la tua conoscenza rispondendo a queste domande sui presidenti d\'America.', 'Storia', 240, 0, 0, 'img/ap.jpg', 10),
(4, 'Quante ne sai sulle capitali del mondo?', 'Testa le tue conoscenze geografiche indovinando le capitali di questi Paesi.', 'Geografia', 360, 0, 0, 'img/wc.jpg', 14),
(5, 'Quante ne sai sulla saga di Harry Potter?', 'Sei un fan di Harry Potter? Metti alla prova le tue conoscenze sulla saga di maghi più famosa.', 'Intrattenimento', 240, 0, 0, 'img/hp.jpg', 10),
(6, 'Quante ne sai sul cinema d\'autore italiano?', 'Se sei un amante del cinema italiano questo quiz metterà alla prova le tue conoscenze.', 'Intrattenimento', 240, 0, 0, 'img/cdi.jpg', 10),
(7, 'Quante ne sai sui film classici?', 'Se ami i film cult saprai sicuramente rispondere a questo quiz!', 'Intrattenimento', 240, 0, 0, 'img/fc.jpg', 10),
(8, 'Quante ne sai sui film d\'animazione Disney?', 'Metti alla prova le tue conoscenze sui cartoni che hanno fatto la storia.', 'Intrattenimento', 240, 0, 0, 'img/wd.jpg', 10),
(9, 'Di quale serie tv si tratta?', 'Se sei un appassionato di serie tv rispondi a questo quiz.', 'Intrattenimento', 240, 0, 0, 'img/stv.jpg', 10),
(10, 'Fiumi del Mondo', 'Metti alla prova le tue conoscensce geografiche rispondendo a queste domande sui fiumi più famosi.', 'Geografia', 240, 0, 0, 'img/fiu.jpg', 10),
(11, 'Quante ne sai su mari e oceani?', 'Ecco 10 domande per mettere alla prova le tue conoscenze.', 'Geografia', 240, 0, 0, 'img/os.jpg', 10),
(12, 'Monumenti del Mondo', 'Sei appassionato di Geografia? Testa le tue abilità con questo quiz sui monumenti più famosi del mondo.', 'Geografia', 240, 0, 0, 'img/mm.jpg', 10),
(13, 'Esploratori Coraggiosi', 'Ti piace la Storia ed esplorare il mondo? Allora questo quiz fa per te!', 'Storia', 240, 0, 0, 'img/esp.jpg', 10),
(14, 'Quante ne sai sull\'Antica Roma?', 'Sei un appassionato di Storia? Allora rispondi a queste domande su Roma antica.', 'Storia', 240, 0, 0, 'img/ro.jpg', 10),
(15, 'Quante ne sai sull\'Antico Egitto?', ' Se ami la storia egizia metti alla prova le tue conoscenze con questo quiz.', 'Storia', 240, 0, 0, 'img/egi.jpg', 10),
(16, 'Storia del Medioevo', 'Metti alla prova le tue conoscenze storiche rispondendo a queste domande sul Medioevo.', 'Storia', 240, 0, 0, 'img/me.jpg', 10),
(17, 'Rivoluzione Francese e Napoleone Bonaparte', 'Se la Storia ti appassiona testa le tue abilità rispondendo a questo quiz.', 'Storia', 240, 0, 0, 'img/rf.jpg', 10),
(18, 'Quante ne sai sui vulcani?', 'Ecco 10 domande per mettere alla prova le tue conoscenze sui vulcani.', 'Geografia', 240, 0, 0, 'img/vo.jpg', 10),
(19, 'Tavola Periodica', 'Testa le tue conoscenze degli elementi risposndendo a questo quiz', 'Chimica', 240, 0, 0, 'img/tvp.jpg',10),
(20, 'Quante ne sai sulla Chimica?', 'Sei un appassionato di Chimica? Allora questo quiz fa per te!','Chimica', 240, 0,0, 'img/chi.jpg', 10),
(21, 'Quante ne sai sugli insetti?', 'Se ti piacciono gli insetti testa le tue conoscenze rispondendo a queste domande.', 'Natura', 240, 0, 0, 'img/ins.jpg',10),
(22, 'Quante ne sai sui gatti?', 'Se ami i gatti ecco per te un quiz sui felini.','Natura', 240, 0, 0, 'img/gat.jpg',10),
(23, 'Quante ne sai sull\'Unione Europea', 'Metti alla prova le tue conoscenze rispondendo a queste domande sull\'UE.', 'Cittadinanza', 240, 0, 0, 'img/une.jpg', 10),
(24, 'Attualità', 'Sei sempre informato sulle ultime notizie? Allora saprai sicuramente rispondere a questo quiz!', 'Attualità', 240, 0, 0, 'img/att.jpg', 10);
-- --------------------------------------------------------

--
-- Table structure for table `salvati`
--

CREATE TABLE `salvati` (
  `Utente` int(11) DEFAULT NULL,
  `Quiz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suggerimenti`
--

CREATE TABLE `suggerimenti` (
  `Utente` int(11) NOT NULL,
  `Testo` text NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Table structure for table `utenti`
--

CREATE TABLE `utenti` (
  `ID` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utenti`
--

INSERT INTO `utenti` (`ID`, `Username`, `Email`, `Password`) VALUES
(1, 'user', 'user@user.it', '$2y$10$DDOBI0/riVo.yi5ZRvQ/TuPUsDnmbkRnU0R6u8aiDstkf4Lg9JnvK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `domande`
--
ALTER TABLE `domande`
  ADD PRIMARY KEY (`ID`,`Quiz`),
  ADD KEY `dom_quiz_id_fk` (`Quiz`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `salvati`
--
ALTER TABLE `salvati`
  ADD KEY `sav_quiz_id_fk` (`Quiz`),
  ADD KEY `sav_user_id_fk` (`Utente`);

--
-- Indexes for table `suggerimenti`
--
ALTER TABLE `suggerimenti`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `suggerimenti`
--
ALTER TABLE `suggerimenti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `utenti`
--
ALTER TABLE `utenti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `domande`
--
ALTER TABLE `domande`
  ADD CONSTRAINT `dom_quiz_id_fk` FOREIGN KEY (`Quiz`) REFERENCES `quiz` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salvati`
--
ALTER TABLE `salvati`
  ADD CONSTRAINT `sav_quiz_id_fk` FOREIGN KEY (`Quiz`) REFERENCES `quiz` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `sav_user_id_fk` FOREIGN KEY (`Utente`) REFERENCES `utenti` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
