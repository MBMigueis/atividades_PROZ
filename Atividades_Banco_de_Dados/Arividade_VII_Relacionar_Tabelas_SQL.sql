-- Cria o banco de dados LIVRARIA
CREATE DATABASE LIVRARIA;

-- Seleciona o banco de dados LIVRARIA para uso
USE LIVRARIA;

-- Cria a tabela Clientes
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    endereco VARCHAR(255)
);

-- Cria a tabela Livros
CREATE TABLE livros (
    livro_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(100),
    preco DECIMAL(10, 2)
);

-- Cria a tabela Pedidos
CREATE TABLE pedidos (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    livro_id INT,
    quantidade INT,
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (livro_id) REFERENCES livros(livro_id)
);

-- Insere dados na tabela Clientes
INSERT INTO clientes (nome, email, endereco) VALUES
('João Silva', 'joao.silva@email.com', 'Rua A, 123'),
('Maria Oliveira', 'maria.oliveira@email.com', 'Avenida B, 456'),
('Carlos Pereira', 'carlos.pereira@email.com', 'Travessa C, 789');

-- Insere dados na tabela Livros
INSERT INTO livros (titulo, autor, preco) VALUES
('A Guerra dos Tronos', 'George R. R. Martin', 59.90),
('O Senhor dos Anéis', 'J. R. R. Tolkien', 49.90),
('Harry Potter e a Pedra Filosofal', 'J. K. Rowling', 39.90);

-- Insere dados na tabela Pedidos
INSERT INTO pedidos (cliente_id, livro_id, quantidade, data_pedido) VALUES
(1, 1, 2, '2023-10-26'),
(2, 2, 1, '2023-10-27'),
(1, 3, 1, '2023-10-28'),
(3, 1, 1, '2023-10-29');

-- Consultas com JOIN:

-- INNER JOIN: Exibe os pedidos com informações do cliente e do livro
SELECT pedidos.pedido_id, clientes.nome AS cliente, livros.titulo AS livro, pedidos.quantidade, pedidos.data_pedido
FROM pedidos
INNER JOIN clientes ON pedidos.cliente_id = clientes.cliente_id
INNER JOIN livros ON pedidos.livro_id = livros.livro_id;

-- LEFT JOIN: Exibe todos os clientes e seus pedidos (se houver)
SELECT clientes.nome AS cliente, livros.titulo AS livro, pedidos.quantidade, pedidos.data_pedido
FROM clientes
LEFT JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id
LEFT JOIN livros ON pedidos.livro_id = livros.livro_id;

-- RIGHT JOIN: Exibe todos os livros e seus pedidos (se houver)
SELECT livros.titulo AS livro, clientes.nome AS cliente, pedidos.quantidade, pedidos.data_pedido
FROM livros
RIGHT JOIN pedidos ON livros.livro_id = pedidos.livro_id
RIGHT JOIN clientes ON pedidos.cliente_id = clientes.cliente_id;