CREATE TABLE CLIENTE(
    IDCLIENTE SERIAL PRIMARY KEY,
    NOME VARCHAR(30) NOT NULL,
    SEXO CHAR(1) CHECK (SEXO IN ('M', 'F')) NOT NULL,
    EMAIL VARCHAR(50) UNIQUE,
    CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
    IDENDERECO SERIAL PRIMARY KEY, 
    RUA VARCHAR(30) NOT NULL,
    BAIRRO VARCHAR(30) NOT NULL,
    CIDADE VARCHAR(30) NOT NULL,
    ESTADO VARCHAR(2) NOT NULL,
    ID_CLIENTE INT UNIQUE
);

ALTER TABLE endereco
ADD CONSTRAINT cs_endereco FOREIGN KEY (id_cliente) REFERENCES cliente(idcliente);

INSERT INTO CLIENTE (NOME, SEXO, EMAIL, CPF) VALUES
('Carlos Silva', 'M', 'carlos.silva@email.com', '123.456.789-01'),
('Ana Souza', 'F', 'ana.souza@email.com', '234.567.890-12'),
('João Pereira', 'M', 'joao.pereira@email.com', '345.678.901-23'),
('Mariana Lima', 'F', 'mariana.lima@email.com', '456.789.012-34'),
('Pedro Santos', 'M', 'pedro.santos@email.com', '567.890.123-45'),
('Juliana Costa', 'F', 'juliana.costa@email.com', '678.901.234-56'),
('Ricardo Almeida', 'M', 'ricardo.almeida@email.com', '789.012.345-67'),
('Fernanda Rocha', 'F', 'fernanda.rocha@email.com', '890.123.456-78'),
('Gabriel Menezes', 'M', 'gabriel.menezes@email.com', '901.234.567-89'),
('Camila Freitas', 'F', 'camila.freitas@email.com', '012.345.678-90');

INSERT INTO ENDERECO (RUA, BAIRRO, CIDADE, ESTADO, ID_CLIENTE) VALUES
('Rua das Flores', 'Centro', 'São Paulo', 'SP', 1),
('Av. Brasil', 'Jardins', 'Rio de Janeiro', 'RJ', 2),
('Rua 15', 'Copacabana', 'Rio de Janeiro', 'RJ', 3),
('Av. Paulista', 'Bela Vista', 'São Paulo', 'SP', 4),
('Rua Augusta', 'Vila Madalena', 'São Paulo', 'SP', 5),
('Av. Atlântica', 'Barra da Tijuca', 'Rio de Janeiro', 'RJ', 6),
('Rua Pernambuco', 'Savassi', 'Belo Horizonte', 'MG', 7),
('Rua Boa Viagem', 'Boa Viagem', 'Recife', 'PE', 8),
('SQN 405', 'Asa Norte', 'Brasília', 'DF', 9),
('Rua da Praia', 'Meireles', 'Fortaleza', 'CE', 10);

SELECT * FROM cliente cl
JOIN endereco en ON cl.idcliente = en.id_cliente
WHERE cl.idcliente = 1;

SELECT nome, email, cpf FROM cliente cl
JOIN endereco en ON cl.idcliente = en.id_cliente
WHERE cl.idcliente = 1;

SELECT ce.nome, ce.email, en.rua FROM cliente ce JOIN endereco en
ON ce.idcliente=en.id_cliente
WHERE idcliente=3;