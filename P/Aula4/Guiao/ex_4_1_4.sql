CREATE TABLE SPEM_Medico (
	ID_SNS VARCHAR(16) NOT NULL PRIMARY KEY,
	Nome VARCHAR(32) NOT NULL,
	Especialidade VARCHAR(32) NOT NULL
);

CREATE TABLE SPEM_Paciente (
	Numero_Utente VARCHAR(16) NOT NULL PRIMARY KEY,
	DataNascimento VARCHAR(32) NOT NULL,
	Endereço VARCHAR(64) NOT NULL,
	Nome VARCHAR(32) NOT NULL,
	ID_SNS_Medico VARCHAR(16) NOT NULL,

	FOREIGN KEY (ID_SNS_Medico)
		REFERENCES SPEM_Medico (ID_SNS)
);

CREATE TABLE SPEM_Farmacia (
	NIF VARCHAR(16) NOT NULL PRIMARY KEY,
	Nome VARCHAR(32) NOT NULL,
	Endereço VARCHAR(32) NOT NULL,
	Telefone VARCHAR(32) NOT NULL
);

CREATE TABLE SPEM_Farmaceutica (
	Num_Registo_Nacional VARCHAR(16) NOT NULL PRIMARY KEY,
	Nome VARCHAR(32) NOT NULL,
	Endereço VARCHAR(32) NOT NULL,
	Telefone VARCHAR(32) NOT NULL
);

CREATE TABLE SPEM_Farmaco (
	Nome_Comercial VARCHAR(32) NOT NULL PRIMARY KEY,
	Formula VARCHAR(32) NOT NULL,
	NIF_Farmacia VARCHAR(16) NOT NULL,
	Num_Registo_Nacional_Farmaceutica VARCHAR(16) NOT NULL

	FOREIGN KEY (NIF_Farmacia)
		REFERENCES SPEM_Farmacia(NIF),

	FOREIGN KEY (Num_Registo_Nacional_Farmaceutica)
		REFERENCES SPEM_Farmaceutica (Num_Registo_Nacional)
);

CREATE TABLE SPEM_Prescrição (
	ID VARCHAR(16) NOT NULL PRIMARY KEY,
	[Data] VARCHAR(32) NOT NULL,
	ID_SNS_Medico VARCHAR(16) NOT NULL,
	Numero_Utente_Paciente VARCHAR(16) NOT NULL,
	Nome_Comercial_Farmaco VARCHAR(32) NOT NULL,
	NIF_Farmacia VARCHAR(16) NOT NULL,

	FOREIGN KEY (Nome_Comercial_Farmaco)
		REFERENCES SPEM_Farmaco (Nome_Comercial),

	FOREIGN KEY (Numero_Utente_Paciente)
		REFERENCES SPEM_Paciente (Numero_Utente),

	FOREIGN KEY (ID_SNS_Medico)
		REFERENCES SPEM_Medico (ID_SNS),

	FOREIGN KEY (NIF_Farmacia)
		REFERENCES SPEM_Farmacia(NIF)

);