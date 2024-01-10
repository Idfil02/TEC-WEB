drop table if exists Utenti cascade;
drop table if exists Quiz cascade;
drop table if exists Domande cascade;

create table Utenti (
	ID int primary key,
	Username varchar not null,
	Email varchar not null,
	Password varchar not null
);

create table Quiz ( 
	ID int primary key,
	Nome varchar not null,
	Descrizione varchar not null,
	Categoria varchar not null,
	Tempo time not null,
	Num_Like int not null,
	Num_Giocate int not null,
	Url_Immagine varchar not null
);

create table Domande (
	ID int primary key,
	Domanda varchar not null,
	Risposta varchar not null, 
	Risp_corretta varchar not null,
	Quiz int,
	foreign key (Quiz) references Quiz(ID)
);

insert into Utenti (ID, Username, Email, Password) values
(01, 'f_idiometri', 'filippo.idiometri@)studenti.unipd.it', '1234'),
(02, 'j_carretta', 'jessica.carretta@)studenti.unipd.it', '1234'),
(03, 'l_pieripolli', 'laura.pieripolli@)studenti.unipd.it', '1234'),
(04, 'v_schivo', 'valentina.schivo@)studenti.unipd.it', '1234');

