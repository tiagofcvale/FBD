Use Stocks;

CREATE TABLE tipo_fornecedor (
    codigo INT PRIMARY KEY,
    designacao VARCHAR(20) NOT NULL
);

CREATE TABLE fornecedor (
    nif CHAR(9) PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    fax varchar(15),
    endereco VARCHAR(50),
    condpag INT,
    tipo INT,
    FOREIGN KEY (tipo) REFERENCES tipo_fornecedor(codigo)
);

CREATE TABLE produto (
    codigo INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    iva INT NOT NULL,
    unidades INT NOT NULL
);

CREATE TABLE encomenda (
    numero INT PRIMARY KEY,
    data DATE NOT NULL,
    fornecedor CHAR(9),
    FOREIGN KEY (fornecedor) REFERENCES fornecedor(nif)
);

CREATE TABLE item (
    numEnc INT,
    codProd INT,
    unidades INT NOT NULL,
    PRIMARY KEY (numEnc, codProd),
    FOREIGN KEY (numEnc) REFERENCES encomenda(numero),
    FOREIGN KEY (codProd) REFERENCES produto(codigo)
);