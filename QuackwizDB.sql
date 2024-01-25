drop table if exists Utenti cascade;
drop table if exists Quiz cascade;
drop table if exists Domande cascade;
drop table if exists Quiz_Salvati cascade;

create table Utenti (
	ID int primary key,
	Username varchar (50) not null,
	Email varchar (50) not null,
	Password varchar (20) not null
);

create table Quiz ( 
	ID int primary key,
	Nome varchar (200) not null,
	Descrizione varchar (500) not null,
	Categoria varchar (20) not null,
	Tempo int not null,
	Num_Like int not null,
	Num_Giocate int not null,
	Url_Immagine varchar (200) not null,
	Num_Domande int not null
);

create table Domande (
	ID int primary key,
	Domanda varchar (200) not null,
	Risp1 varchar (200) not null, 
	Risp2 varchar (200) not null, 
	Risp3 varchar (200) not null, 
	Risp4 varchar (200) not null, 
	Risp_corretta varchar (200) not null,
	Quiz int not null,
	foreign key (Quiz) references Quiz(ID)
);

create table Quiz_Salvati (
	Utente int,
	Quiz int ,
	primary key (Utente,Quiz),
	foreign key (Utente) references Utenti (ID),
	foreign key (Quiz) references Quiz(ID)
	
);

insert into Utenti (ID, Username, Email, Password ) values
(01, 'f_idiometri', 'filippo.idiometri@)studenti.unipd.it', '1234'),
(02, 'j_carretta', 'jessica.carretta@)studenti.unipd.it', '1234'),
(03, 'l_pieripolli', 'laura.pieripolli@)studenti.unipd.it', '1234'),
(04, 'v_schivo', 'valentina.schivo@)studenti.unipd.it', '1234');

