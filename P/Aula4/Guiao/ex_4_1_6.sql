CREATE TABLE ATL_Pessoa (
	Numero_CC varchar(16) NOT NULL PRIMARY KEY,
	Telefone varchar(16) NOT NULL,
	Email varchar(16) NOT NULL,
	Nome varchar(16) NOT NULL,
	Data_Nascimento varchar(16) NOT NULL,
	Morada varchar(32) NOT NULL
);

CREATE TABLE ATL_Professor(
	Numero_CC varchar(16) NOT NULL PRIMARY KEY,
	Numero_Funcionario varchar(16) NOT NULL UNIQUE,

	FOREIGN KEY (Numero_CC)
		REFERENCES ATL_Pessoa (Numero_CC)
);

CREATE TABLE ATL_PessoaAutorizada(
	Numero_CC varchar(16) NOT NULL PRIMARY KEY,

	FOREIGN KEY (Numero_CC)
		REFERENCES ATL_Pessoa (Numero_CC)
);

CREATE TABLE ATL_EncarregadoDeEducaçao(
	Numero_CC varchar(16) NOT NULL PRIMARY KEY,

	FOREIGN KEY (Numero_CC)
		REFERENCES ATL_Pessoa (Numero_CC)
);

CREATE TABLE ATL_Turma(
	ID varchar(16) NOT NULL PRIMARY KEY,
	Num_Max_Aluno varchar(16) NOT NULL,
	Designaçao varchar(32) NOT NULL,
	Classe varchar(32) NOT NULL,
	AnoLetivo varchar(16) NOT NULL,
	Numero_Funcionario_Professor varchar(16) NOT NULL,

	FOREIGN KEY (Numero_Funcionario_Professor)
		REFERENCES ATL_Professor (Numero_Funcionario)
);

CREATE TABLE ATL_Aluno(
	Numero_CC varchar(16) NOT NULL PRIMARY KEY,
	Nome varchar(16) NOT NULL,
	Morada varchar(32) NOT NULL,
	ID_Turma varchar(16) NOT NULL,
	Numero_CC_EE varchar(16) NOT NULL,

	FOREIGN KEY (Numero_CC)
		REFERENCES ATL_Pessoa (Numero_CC),

	FOREIGN KEY(ID_Turma)
		REFERENCES ATL_Turma (ID),

	FOREIGN KEY (Numero_CC_EE)
		REFERENCES ATL_EncarregadoDeEducaçao (Numero_CC)
);

CREATE TABLE ATL_Atividades (
	ID varchar(16) NOT NULL PRIMARY KEY,
	Custo_Financeiro varchar(16) NOT NULL,
	Designaçao varchar(32) NOT NULL,
);

CREATE TABLE ATL_Participa (
	ID_Atividade varchar(16) NOT NULL,
	Numero_CC_Aluno varchar(16) NOT NULL,

	PRIMARY KEY (ID_Atividade, Numero_CC_Aluno),

	FOREIGN KEY (ID_Atividade)
		REFERENCES ATL_Atividades (ID),
	FOREIGN KEY (Numero_CC_Aluno)
		REFERENCES ATL_Aluno (Numero_CC)
);

CREATE TABLE ATL_Levanta (
	Numero_CC_Aluno varchar(16) NOT NULL,
	Numero_CC_Responsavel varchar(16) NOT NULL,

	PRIMARY KEY (Numero_CC_Aluno, Numero_CC_Responsavel),

	FOREIGN KEY (Numero_CC_Aluno)
		REFERENCES ATL_Aluno (Numero_CC),
	FOREIGN KEY (Numero_CC_Responsavel)
		REFERENCES ATL_PessoaAutorizada (Numero_CC)
);

CREATE TABLE ATL_Realiza (
	ID_Turma varchar(16) NOT NULL,
	ID_Atividade varchar(16) NOT NULL,

	PRIMARY KEY (ID_Turma, ID_Atividade),

	FOREIGN KEY (ID_Turma)
		REFERENCES ATL_Turma (ID),
	FOREIGN KEY (ID_Atividade)
		REFERENCES ATL_Atividades (ID)
);