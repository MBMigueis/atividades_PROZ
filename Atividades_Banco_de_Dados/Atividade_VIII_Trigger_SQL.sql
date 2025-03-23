-- Cria o banco de dados LOJA
CREATE DATABASE LOJA;

-- Seleciona o banco de dados LOJA para uso
USE LOJA;

-- Cria a tabela Produtos
CREATE TABLE produtos (
    produto_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2),
    estoque INT
);

-- Cria a tabela Logs (para registrar as alterações no estoque)
CREATE TABLE logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    produto_id INT,
    data_hora DATETIME,
    quantidade_anterior INT,
    quantidade_nova INT,
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- Cria o trigger para registrar alterações no estoque após a inserção de um novo produto
CREATE TRIGGER registrar_estoque_inicial
AFTER INSERT ON produtos
FOR EACH ROW
BEGIN
    INSERT INTO logs (produto_id, data_hora, quantidade_anterior, quantidade_nova)
    VALUES (NEW.produto_id, NOW(), 0, NEW.estoque);
END;

-- Insere um novo produto
INSERT INTO produtos (nome, descricao, preco, estoque)
VALUES ('Camiseta Algodão', 'Camiseta básica de algodão', 29.90, 100);

-- Exibe os registros da tabela logs para verificar se o trigger foi executado corretamente
SELECT * FROM logs;