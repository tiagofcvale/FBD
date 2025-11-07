Use Prescricao;

CREATE TABLE medico (
    numSNS INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) NOT NULL
);

CREATE TABLE paciente (
    numUtente INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    dataNasc DATE NOT NULL,
    endereco VARCHAR(200)
);

CREATE TABLE farmacia (
    nome VARCHAR(100) PRIMARY KEY,
    telefone CHAR(9),
    endereco VARCHAR(200)
);

CREATE TABLE farmaceutica (
    numReg INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL
);

CREATE TABLE farmaco (
    numRegFarm INT,
    nome VARCHAR(100) NOT NULL,
    formula VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (numRegFarm,nome),
    FOREIGN KEY(numRegFarm)
        REFERENCES farmaceutica(numReg)
);

CREATE TABLE prescricao (
    numPresc INT PRIMARY KEY,
    numUtente INT,
    numMedico INT,
    farmacia VARCHAR(100),
    dataProc DATE,
    FOREIGN KEY (numUtente) REFERENCES paciente(numUtente),
    FOREIGN KEY (numMedico) REFERENCES medico(numSNS),
    FOREIGN KEY (farmacia) REFERENCES farmacia(nome)
);

CREATE TABLE presc_farmaco (
    numPresc INT,
    numRegFarm INT,
    nomeFarmaco VARCHAR(100),
    PRIMARY KEY (numPresc, numRegFarm, nomeFarmaco),
    FOREIGN KEY (numPresc) REFERENCES prescricao(numPresc),
    FOREIGN KEY (numRegFarm) REFERENCES farmaceutica(numReg)
);
