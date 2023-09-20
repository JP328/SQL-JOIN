CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias(
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
	Marca VARCHAR(255) NOT NULL,
	Local VARCHAR(255) NOT NULL
);

CREATE TABLE tb_produtos(
    Id BIGINT IDENTITY(1,1) PRIMARY KEY,
	Nome VARCHAR(255) NOT NULL,
	Quantidade INT,
    Material VARCHAR(255) NOT NULL,
	Preco DECIMAL(10,2) NOT NULL,
	CategoriaId BIGINT NOT NULL
	CONSTRAINT CategoriaId_fk FOREIGN KEY (CategoriaId) REFERENCES tb_categorias(id)
);

-- DROP TABLE tb_produtos;

INSERT INTO tb_categorias(Marca, Local)
VALUES 
	('Tigre', 'Seção A'),
	('Amanco', 'Seção B'),
	('Quartzolit', 'Seção C'),
	('Vedacit', 'Seção D'),
	('Bom', 'Seção E');

INSERT INTO tb_produtos(Nome, Quantidade, Material, Preco, CategoriaId)
VALUES
	('Pacote de Cimento 1kg', 600, 'Cimento', 49.90, 1),
	('Tapeçaria De Primeira', 1500, 'Tecido', 129.90, 2),
	('Tinta Acrílica Econômica Pessego', 600, 'Tinta', 57.30, 3),
	('Telha', 990, 'Cerâmica', 69.90, 4),
	('Chuveiro', 600, 'Plástico/Elétrico', 47.90, 5),
	('Areia Média Lavada', 1250, 'Areia', 60.00, 1),
	('Colher de Pedreiro com Cabo de Madeira', 100, 'Metal/Madeira', 49.90, 2),
	('Argamassa Cinza 20kg', 60, 'Argamassa', 33.99, 3);


SELECT * FROM tb_produtos WHERE Preco > 100;

SELECT * FROM tb_produtos WHERE Preco BETWEEN 70 AND 150;

SELECT * FROM tb_produtos WHERE Nome LIKE('%c%');


SELECT Nome, Quantidade, Material, Preco, tb_categorias.Marca, tb_categorias.Local 
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.CategoriaId = tb_categorias.Id;

SELECT Nome, Quantidade, Material, Preco, tb_categorias.Local, tb_categorias.Marca
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.CategoriaId = tb_categorias.Id 
WHERE CategoriaId  = 1;