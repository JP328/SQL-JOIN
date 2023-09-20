CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias(
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
	Area_de_Conhecimento VARCHAR(255) NOT NULL,
	Acessos INT
);

CREATE TABLE tb_produtos(
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(255) NOT NULL,
	Duracao INT,
    Professor VARCHAR(255) NOT NULL,
	Preco DECIMAL(10,2) NOT NULL,
	CategoriaId BIGINT NOT NULL
	CONSTRAINT CategoriaId_fk FOREIGN KEY (CategoriaId) REFERENCES tb_categorias(id)
);

-- DROP TABLE tb_produtos;

INSERT INTO tb_categorias(Area_de_Conhecimento, Acessos)
VALUES 
	('Direito', 12),
	('Administração', 44),
	('Filosofia', 520),
	('Medicina', 100),
	('Tecnologia', 1400);

INSERT INTO tb_produtos(Nome, Duracao, Professor, Preco, CategoriaId)
VALUES
	('Direito Penal', 60, 'Roberto', 49.90, 1),
	('Como gerir processos', 100, 'Claudia', 1200.90, 2),
	('Bobagem existencial', 40, 'Breno', 00.50, 3),
	('Primeiros socorros', 90, 'Manuel', 690.90, 4),
	('HTLM e CSS básicos', 30, 'Pedro', 30.90, 5),
	('Direito Trabalhista', 125, 'Ariel', 400.00, 1),
	('Comunicação assertiva', 10, 'Mauro', 999.99, 2),
	('C# Avançado', 60, 'Arnaldo', 53.99, 5);


SELECT * FROM tb_produtos WHERE Preco > 500;

SELECT * FROM tb_produtos WHERE Preco BETWEEN 600 AND 1000;

SELECT * FROM tb_produtos WHERE Nome LIKE('%j%');

SELECT Nome, Duracao, Professor, Preco, tb_categorias.Area_de_Conhecimento, tb_categorias.Acessos
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.CategoriaId = tb_categorias.Id;

SELECT Nome, Duracao, Professor, Preco, tb_categorias.Area_de_Conhecimento, tb_categorias.Acessos
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.CategoriaId = tb_categorias.Id 
WHERE CategoriaId  = 5;