-- Cria o banco de dados LOJA
CREATE DATABASE LOJA;

-- Seleciona o banco de dados LOJA para uso
USE LOJA;

-- Cria a tabela Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE
);

-- Cria a função para contar clientes cadastrados em um dia específico
CREATE FUNCTION contar_clientes_cadastrados_dia(data_cadastro_dia DATE)
RETURNS INT
BEGIN
    DECLARE total_clientes INT;
    SELECT COUNT(*) INTO total_clientes FROM Clientes WHERE data_cadastro = data_cadastro_dia;
    RETURN total_clientes;
END;

-- Insere alguns clientes para teste
INSERT INTO Clientes (nome, email, data_cadastro) VALUES
('João Silva', 'joao.silva@email.com', '2025-03-22'),
('Maria Oliveira', 'maria.oliveira@email.com', '2025-03-22'),
('Carlos Pereira', 'carlos.pereira@email.com', '2025-03-23'),
('Ana Souza', 'ana.souza@email.com', '2025-03-23'),
('Pedro Santos', 'pedro.santos@email.com', '2025-03-23');

-- Chama a função para contar clientes cadastrados em 2025-03-22
SELECT contar_clientes_cadastrados_dia('2025-03-22');

-- Chama a função para contar clientes cadastrados em 2025-03-23
SELECT contar_clientes_cadastrados_dia('2025-03-23');