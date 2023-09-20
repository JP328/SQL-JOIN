CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categoria(
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
	Tipo VARCHAR(255) NOT NULL,
	Local VARCHAR(255) NOT NULL
);

CREATE TABLE tb_produtos(
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(255) NOT NULL,
	Quantidade INT,
    DataValidade DATE NOT NULL,
	Preco DECIMAL NOT NULL,
	CategoriaId BIGINT NOT NULL
	CONSTRAINT CategoriaId_fk FOREIGN KEY (CategoriaId) REFERENCES tb_categoria(id)
);


INSERT INTO tb_categoria(Tipo, Local)
VALUES 
	('Beleza', 'Seção A'),
	('Medicamentos', 'Seção B'),
	('Higiene', 'Seção C'),
	('Alimentos', 'Seção D'),
	('Academia', 'Seção E');


INSERT INTO tb_produtos (Nome, Quantidade, DataValidade, Preco, CategoriaId)
VALUES 
	('Dorflex', 900, '2024-01-01', 7.00, 1),
	('Shampoo', 1000, '2024-01-01', 16.00, 3),
	('Álcool em gel', 1100, '2024-01-01', 15.00, 3),
	('Chocolate Diet', 1200, '2024-01-01', 9.00, 4),
	('Creatina', 1300, '2024-01-01', 120.00, 5),
	('Polaramini', 1400, '2024-01-01', 21.00, 1),
	('Delineador', 1500, '2024-01-01', 17.00, 2),
	('Lenço umedecido', 16, '2024-01-01', 11.00, 3);


SELECT * FROM tb_produtos WHERE Preco > 50;

SELECT * FROM tb_produtos WHERE Preco BETWEEN 5 AND 60;

SELECT * FROM tb_produtos WHERE Nome LIKE('%c%');


SELECT Nome, Quantidade, DataValidade, Preco, tb_categoria.Local, tb_categoria.Tipo
FROM tb_produtos INNER JOIN tb_categoria ON tb_produtos.CategoriaId = tb_categoria.Id;

SELECT Nome, Quantidade, DataValidade, Preco, tb_categoria.Local, tb_categoria.Tipo
FROM tb_produtos INNER JOIN tb_categoria ON tb_produtos.CategoriaId = tb_categoria.Id 
WHERE CategoriaId  = 3;


