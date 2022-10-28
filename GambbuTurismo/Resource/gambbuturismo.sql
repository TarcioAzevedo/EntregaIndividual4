CREATE SCHEMA gambbuturismo;
USE gambbuturismo;

CREATE TABLE clientes (
    id int not null PRIMARY KEY auto_increment,
	nome varchar(50) not null,
    cpf varchar(12) not null,
    nascimento varchar(10) not null,
    telefone varchar(10) not null,
    endereco varchar(50) not null,
    email varchar(30) not null unique,
    senha varchar(20) not null
);

CREATE TABLE viagem (
    destino varchar(30),
    ida date not null,
    volta date,
    preco float,
    origem varchar(30),
    id int not null PRIMARY KEY,
    fk_clientes_id int not null
);
 
ALTER TABLE viagem ADD CONSTRAINT FK_viagem_2
    FOREIGN KEY (fk_clientes_id)
    REFERENCES clientes (id)
    ON DELETE RESTRICT;