-- De acordo com os comandos aprendidos, programe códigos SQL para criar um banco de dados chamado ESCOLA e deixe-o pronto para o uso. Depois, pesquise qual é o comando utilizado para inserir uma tabela no banco de dados e siga as instruções:

-- 1. crie uma tabela chamada ALUNO;  
-- 2. defina os atributos da tabela;
-- 3. adicione a chave primária de nome ID (identificador);
-- 4. adicione um atributo nome do tipo varchar;
-- 5. adicione um atributo e-mail do tipo varchar;
-- 6. adicione um atributo endereço do tipo varchar.

-- Criação do banco de dados ESCOLA
CREATE DATABASE ESCOLA;

-- Seleciona o banco de dados ESCOLA para uso
USE ESCOLA;

-- Criação da tabela ALUNO com os atributos definidos
CREATE TABLE ALUNO (
    ID INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único
    nome VARCHAR(100) NOT NULL,        -- Nome do aluno (varchar)
    email VARCHAR(100) UNIQUE NOT NULL, -- E-mail do aluno (varchar), único e obrigatório
    endereco VARCHAR(255)              -- Endereço do aluno (varchar)
);

-- Inserção dos dados na tabela ALUNO (sem o atributo telefone)
INSERT INTO ALUNO (nome, email, endereco)
VALUES 
('João Carlos', 'Jcarlos@gmail.com', 'Rua 13 de maio'),
('José Vitor', 'Jvitor@gmail.com', 'Rua da Saudade'),
('Paulo André', 'Pandr@gmail.com', 'Rua das Flores');

-- Exibir os dados da tabela ALUNO para verificação
SELECT * FROM ALUNO;