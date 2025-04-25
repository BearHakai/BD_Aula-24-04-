CREATE DATABASE pw2_atividade24_04;
USE pw2_atividade24_04;

CREATE TABLE usuario (
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    dataNascimento DATE,
    cpf VARCHAR(15),
    cnpj VARCHAR(20),
    razaoSocial VARCHAR(255),
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(50) NOT NULL,
    id_pedido INT
);

CREATE TABLE login (
	id_login INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50),
    hash_senha VARCHAR(50),
    id_usuario INT
);

CREATE TABLE produto (
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30),
    marca VARCHAR(50),
    qtd DECIMAL
);

CREATE TABLE itens_pedido(
	id_itens_pedido INT AUTO_INCREMENT PRIMARY KEY,
    qtd INT,
    preco DECIMAL,
    id_pedido INT,
    id_produto INT
);

CREATE TABLE pedido (
	id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    status_pedido VARCHAR(255),
    descricao VARCHAR(255),
    id_itens_pedido INT
);

ALTER TABLE usuario ADD CONSTRAINT fk_usuario_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido);

ALTER TABLE login ADD CONSTRAINT fk_login_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);

ALTER TABLE itens_pedido ADD CONSTRAINT fk_itens_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido);
ALTER TABLE itens_pedido ADD CONSTRAINT fk_itens_poduto FOREIGN KEY (id_produto) REFERENCES produto (id_produto);

ALTER TABLE pedido ADD CONSTRAINT fk_pedido_itens FOREIGN KEY (id_itens_pedido) REFERENCES itens_pedido (id_itens_pedido);

INSERT INTO 
usuario 
(nome, dataNascimento, cpf, cnpj, razaoSocial, email, senha) 
VALUES 
("Vinicius", 2003-09-28, "123.456.789-01", "12.345.678/0001-00", "GamesJam", "gamesJam@gmail.com", "@123Games");

INSERT INTO
login
(email, hash_senha, id_usuario)
VALUES
("gamesJam@gmail.com", "%%6qundjadoq03", 1);

INSERT INTO
produto
(nome, marca, qtd)
VALUES
("Honey Rubber", "WoodenCave", 1);

INSERT INTO
itens_pedido
(qtd, preco)
VALUES
(2, 33.40);

INSERT INTO
pedido
(status_pedido, descricao, id_itens_pedido)
VALUES
("A caminho", "Jogo do uros ladrão de mel", 1);

UPDATE usuario SET id_pedido = 1 WHERE id_usuario = 1;
UPDATE itens_pedido SET id_pedido = 1, id_produto = 1 WHERE id_itens_pedido = 1;

SELECT * FROM usuario;
SELECT * FROM login;
SELECT * FROM produto;
SELECT * FROM itens_pedido;
SELECT * FROM pedido;