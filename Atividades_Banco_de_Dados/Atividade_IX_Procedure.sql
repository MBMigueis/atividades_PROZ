-- Cria o banco de dados VENDAS
CREATE DATABASE VENDAS;

-- Seleciona o banco de dados VENDAS para uso
USE VENDAS;

-- Cria a tabela Produtos
CREATE TABLE Produtos (
    produto_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(03, 2)
);

-- Cria a tabela Vendas
CREATE TABLE Vendas (
    venda_id INT PRIMARY KEY AUTO_INCREMENT,
    produto_id INT,
    quantidade INT,
    data_venda DATE,
    FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id)
);

-- Cria o procedure para gerar o relatório de vendas diário
DELIMITER $$

CREATE PROCEDURE relatorio_vendas_diario(IN data_relatorio DATE)
BEGIN
    -- Seleciona os dados de vendas para a data especificada
    SELECT
        p.nome AS Produto,
        SUM(v.quantidade) AS Quantidade_Vendida,
        SUM(v.quantidade * p.preco) AS Total_Vendas
    FROM
        Vendas v
        JOIN Produtos p ON v.produto_id = p.produto_id
    WHERE
        v.data_venda = data_relatorio
    GROUP BY
        p.nome;
END $$

DELIMITER ;

-- Insere dados de produtos
INSERT INTO Produtos (nome, preco) VALUES
('Camiseta', 29.90),
('Calça Jeans', 79.90),
('Tênis', 129.90);

-- Insere dados de vendas
INSERT INTO Vendas (produto_id, quantidade, data_venda) VALUES
(1, 2, '2025-03-22'),
(2, 1, '2025-03-22'),
(3, 1, '2025-03-22'),
(1, 1, '2025-03-23'),
(2, 2, '2025-03-23');

-- Chama o procedure para gerar o relatório de vendas para 2025-03-22
CALL relatorio_vendas_diario('2025-03-22');