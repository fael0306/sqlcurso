CREATE TABLE CLIENTE(
  IDCLIENTE SERIAL PRIMARY KEY, 
  NOME VARCHAR(30) NOT NULL, 
  SEXO CHAR(1) CHECK (
    SEXO IN ('M', 'F')
  ) NOT NULL, 
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

ALTER TABLE 
  endereco 
ADD 
  CONSTRAINT cs_endereco FOREIGN KEY (id_cliente) REFERENCES cliente(idcliente);
  
INSERT INTO CLIENTE (NOME, SEXO, EMAIL, CPF) 
VALUES 
  (
    'Carlos Silva', 'M', 'carlos.silva@email.com', 
    '123.456.789-01'
  ), 
  (
    'Ana Souza', 'F', 'ana.souza@email.com', 
    '234.567.890-12'
  ), 
  (
    'João Pereira', 'M', 'joao.pereira@email.com', 
    '345.678.901-23'
  ), 
  (
    'Mariana Lima', 'F', 'mariana.lima@email.com', 
    '456.789.012-34'
  ), 
  (
    'Pedro Santos', 'M', 'pedro.santos@email.com', 
    '567.890.123-45'
  ), 
  (
    'Juliana Costa', 'F', 'juliana.costa@email.com', 
    '678.901.234-56'
  ), 
  (
    'Ricardo Almeida', 'M', 'ricardo.almeida@email.com', 
    '789.012.345-67'
  ), 
  (
    'Fernanda Rocha', 'F', 'fernanda.rocha@email.com', 
    '890.123.456-78'
  ), 
  (
    'Gabriel Menezes', 'M', 'gabriel.menezes@email.com', 
    '901.234.567-89'
  ), 
  (
    'Camila Freitas', 'F', 'camila.freitas@email.com', 
    '012.345.678-90'
  );
  
INSERT INTO ENDERECO (
  RUA, BAIRRO, CIDADE, ESTADO, ID_CLIENTE
) 
VALUES 
  (
    'Rua das Flores', 'Centro', 'São Paulo', 
    'SP', 1
  ), 
  (
    'Av. Brasil', 'Jardins', 'Rio de Janeiro', 
    'RJ', 2
  ), 
  (
    'Rua 15', 'Copacabana', 'Rio de Janeiro', 
    'RJ', 3
  ), 
  (
    'Av. Paulista', 'Bela Vista', 'São Paulo', 
    'SP', 4
  ), 
  (
    'Rua Augusta', 'Vila Madalena', 'São Paulo', 
    'SP', 5
  ), 
  (
    'Av. Atlântica', 'Barra da Tijuca', 
    'Rio de Janeiro', 'RJ', 6
  ), 
  (
    'Rua Pernambuco', 'Savassi', 'Belo Horizonte', 
    'MG', 7
  ), 
  (
    'Rua Boa Viagem', 'Boa Viagem', 'Recife', 
    'PE', 8
  ), 
  (
    'SQN 405', 'Asa Norte', 'Brasília', 
    'DF', 9
  ), 
  (
    'Rua da Praia', 'Meireles', 'Fortaleza', 
    'CE', 10
  );
  
SELECT 
  * 
FROM 
  cliente cl 
  JOIN endereco en ON cl.idcliente = en.id_cliente 
WHERE 
  cl.idcliente = 1;
  
SELECT 
  nome, 
  email, 
  cpf 
FROM 
  cliente cl 
  JOIN endereco en ON cl.idcliente = en.id_cliente 
WHERE 
  cl.idcliente = 1;
  
SELECT 
  ce.nome, 
  ce.email, 
  en.rua 
FROM 
  cliente ce 
  JOIN endereco en ON ce.idcliente = en.id_cliente 
WHERE 
  idcliente = 3;
  
CREATE TABLE TELEFONE(
  IDTELEFONE SERIAL PRIMARY KEY, 
  TIPO VARCHAR(3) NOT NULL, 
  NUMERO VARCHAR(10) NOT NULL, 
  ID_CLIENTE INT
);

INSERT INTO TELEFONE (TIPO, NUMERO, ID_CLIENTE) 
VALUES 
  ('CEL', '9876543210', 1), 
  ('RES', '3456789012', 2), 
  ('COM', '4567890123', 3), 
  ('CEL', '9123456789', 4), 
  ('RES', '3234567890', 5), 
  ('COM', '4345678901', 6), 
  ('CEL', '9765432109', 7), 
  ('RES', '3012345678', 8), 
  ('COM', '4987654321', 9), 
  ('CEL', '9654321098', 10);
  
ALTER TABLE 
  telefone 
ADD 
  CONSTRAINT cs_telefone FOREIGN KEY (id_cliente) REFERENCES cliente(idcliente);
  
SELECT 
  ce.nome, 
  ce.email, 
  te.numero AS Celular 
FROM 
  cliente ce 
  JOIN telefone te ON ce.idcliente = te.id_cliente 
  JOIN endereco en ON ce.idcliente = en.id_cliente 
WHERE 
  en.estado = 'RJ' 
  and te.tipo = 'COM';
  
SELECT 
  ce.nome, 
  ce.email, 
  te.numero AS Celular 
FROM 
  cliente ce 
  JOIN telefone te ON ce.idcliente = te.id_cliente 
  JOIN endereco en ON ce.idcliente = en.id_cliente 
WHERE 
  en.estado = 'SP' 
  and ce.sexo = 'F';
  
UPDATE 
  cliente 
SET 
  email = NULL 
WHERE 
  idcliente = 1;
  
SELECT 
  nome, 
  cpf, 
  coalesce(email, 'Desconhecido') as email 
FROM 
  cliente 
WHERE 
  email IS NULL;
  
SELECT 
  cl.nome, 
  cl.email, 
  te.numero, 
  en.rua, 
  en.bairro 
FROM 
  cliente cl 
  JOIN telefone te ON cl.idcliente = te.id_cliente 
  JOIN endereco en ON cl.idcliente = en.id_cliente 
WHERE 
  en.estado = 'RJ';
  
CREATE VIEW info_clientes_RJ AS 
SELECT 
  cl.nome, 
  cl.email, 
  te.numero, 
  en.rua, 
  en.bairro 
FROM 
  cliente cl 
  JOIN telefone te ON cl.idcliente = te.id_cliente 
  JOIN endereco en ON cl.idcliente = en.id_cliente 
WHERE 
  en.estado = 'RJ';
  
SELECT 
  * 
FROM 
  info_clientes_RJ;
  
SELECT 
  nome, 
  rua, 
  bairro 
FROM 
  info_clientes_RJ;
  
CREATE 
or REPLACE FUNCTION dados_cliente(iddcliente INT) RETURNS TABLE (
  nome TEXT, email TEXT, cpf TEXT, rua TEXT, 
  bairro TEXT, cidade TEXT, estado TEXT, 
  telefone_tipo TEXT, telefone_numero TEXT
) AS $$ BEGIN RETURN QUERY 
SELECT 
  cl.nome :: TEXT, 
  coalesce(cl.email, 'Não informado') :: TEXT, 
  cl.cpf :: TEXT, 
  en.rua :: TEXT, 
  en.bairro :: TEXT, 
  en.cidade :: TEXT, 
  en.estado :: TEXT, 
  te.tipo :: TEXT, 
  te.numero :: TEXT 
FROM 
  cliente cl 
  JOIN endereco en ON cl.idcliente = en.id_cliente 
  JOIN telefone te ON cl.idcliente = te.id_cliente 
WHERE 
  iddcliente = cl.idcliente 
ORDER BY 
  nome;
END;
$$ LANGUAGE plpgsql;
