CREATE DATABASE IF NOT EXISTS smartthink;
USE smartthink;

-- Tabela de Empresas
CREATE TABLE empresa 
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(15),
    nomeFantasia VARCHAR(65),
    razaoSocial VARCHAR(65),
    apelido VARCHAR(40),
    cnpj CHAR(14),
    cep CHAR(8),
    logradouro VARCHAR(100),
    email VARCHAR(75),
    telefone CHAR(11),
    fkMarca INT,
    FOREIGN KEY (fkMarca) REFERENCES empresa(id) ON DELETE SET NULL
);

-- Tabela de Funcionários
CREATE TABLE funcionario 
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(85),
    cpf CHAR(11),
    email VARCHAR(100),
    senha VARCHAR(30),
    fotoPerfil BLOB,
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa) REFERENCES empresa(id) ON DELETE CASCADE
);

-- Tabela de Reclamações
CREATE TABLE reclamacao
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo TEXT,
    descricao TEXT,
    dataExtracao DATETIME,
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa) REFERENCES empresa(id) ON DELETE CASCADE
);

-- Tabela de Demanda Pesquisa 
CREATE TABLE demandaPesquisa 
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nivel_interesse INT,
    timeLeitura TIME,
    dataLeitura DATETIME,
    dataExtracao DATETIME,
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa) REFERENCES empresa(id) ON DELETE CASCADE
);

-- Tabela de Avaliação
CREATE TABLE avaliacao 
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    qtdEstrela INT,
    descricao_comentario TEXT,
    dataExtracao DATETIME,
    fkEmpresa INT,
    FOREIGN KEY (fkEmpresa) REFERENCES empresa(id) ON DELETE CASCADE
);

-- Tabela de Prompts 
CREATE TABLE prompt 
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo TEXT,
    pergunta TEXT,
    fkReclamacao INT,
    fkDemandaPesquisa INT,
    fkAvaliacao INT,
    FOREIGN KEY (fkReclamacao) REFERENCES reclamacao(id) ON DELETE SET NULL,
    FOREIGN KEY (fkDemandaPesquisa) REFERENCES demandaPesquisa(id) ON DELETE SET NULL,
    FOREIGN KEY (fkAvaliacao) REFERENCES avaliacao(id) ON DELETE SET NULL
);

-- Tabela de Insights
CREATE TABLE insights 
(
    id INT AUTO_INCREMENT PRIMARY KEY,
    dataHora DATETIME,
    resposta TEXT,
    fkPrompt INT,
    FOREIGN KEY (fkPrompt) REFERENCES prompt(id) ON DELETE CASCADE
);

INSERT INTO empresa (codigo, nomeFantasia, razaoSocial, apelido, cnpj, cep, logradouro, email, telefone, fkMarca)
VALUES 
('EMP001', 'McDonald\'s', 'Arcos Dourados Comércio de Alimentos Ltda.', 'McD', '42110090000140', '04578005', 'Av. Dr. Chucri Zaidan, 920', 'contato@mcdonalds.com.br', '1121555070', NULL),
('EMP002', 'Burger King', 'Burger King do Brasil S.A.', 'BK', '02747380000150', '04578905', 'Av. Juscelino Kubitschek, 1500', 'contato@burgerking.com.br', '1121236100', NULL),
('EMP003', 'Subway', 'Subway Partners Comércio Ltda.', 'Sub', '02963710000127', '04083002', 'Av. Paulista, 1000', 'contato@subway.com.br', '1132674000', NULL),
('EMP004', 'KFC', 'KFC Brasil Ltda.', 'Kentucky', '03657120000189', '04083001', 'Rua Vergueiro, 500', 'contato@kfc.com.br', '1133456000', NULL),
('EMP005', 'Pizza Hut', 'Pizza Hut Brasil S.A.', 'PizzaHut', '08211629000120', '01454000', 'Rua Augusta, 1500', 'contato@pizzahut.com.br', '1123567900', NULL);

INSERT INTO funcionario (nome, cpf, email, senha, fotoPerfil, fkEmpresa)
VALUES 
('João Silva', '12345678901', 'joao.silva@mcdonalds.com', 'senha123', NULL, 1),
('Maria Souza', '98765432109', 'maria.souza@mcdonalds.com', 'senha456', NULL, 1),
('Carlos Pereira', '23456789012', 'carlos.pereira@burgerking.com', 'senha789', NULL, 2),
('Ana Costa', '87654321098', 'ana.costa@burgerking.com', 'senha012', NULL, 2),
('Rafael Lima', '34567890123', 'rafael.lima@subway.com', 'senha345', NULL, 3),
('Julia Azevedo', '76543210987', 'julia.azevedo@subway.com', 'senha678', NULL, 3),
('Marcos Andrade', '45678901234', 'marcos.andrade@kfc.com', 'senha901', NULL, 4),
('Paula Mendes', '65432109876', 'paula.mendes@kfc.com', 'senha234', NULL, 4),
('Lucas Martins', '56789012345', 'lucas.martins@pizzahut.com', 'senha567', NULL, 5),
('Fernanda Rocha', '54321098765', 'fernanda.rocha@pizzahut.com', 'senha890', NULL, 5);
