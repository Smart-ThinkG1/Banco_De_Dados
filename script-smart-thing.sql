DROP DATABASE IF EXISTS smartthink; 
CREATE DATABASE smartthink; 
USE smartthink;
CREATE TABLE empresa ( 
 id INT AUTO_INCREMENT PRIMARY KEY, 
 codigo VARCHAR(15) UNIQUE, 
 nomeFantasia VARCHAR(65),
 razaoSocial VARCHAR(80), 
 apelido VARCHAR(40), 
 cnpj CHAR(14) UNIQUE, 
 estado ENUM('ATIVO', 'INATIVO') NOT NULL,
 cep CHAR(8), 
 logradouro VARCHAR(100), 
 email VARCHAR(100), 
 telefone CHAR(11), 
 fkMarca INT, 
 FOREIGN KEY (fkMarca) REFERENCES empresa(id) ON DELETE CASCADE );

CREATE TABLE funcionario ( 
 id INT AUTO_INCREMENT PRIMARY KEY, 
 nome VARCHAR(85), 
 cpf CHAR(11) UNIQUE, 
 email VARCHAR(100), 
 senha VARCHAR(255), -- Hash de senha tipo 
 estado ENUM('ATIVO', 'INATIVO') NOT NULL, 
fkEmpresa INT, 
FOREIGN KEY (fkEmpresa) REFERENCES empresa(id) ON DELETE CASCADE ); 
 
CREATE TABLE reclamacao ( 
 id INT AUTO_INCREMENT PRIMARY KEY, 
 titulo TEXT, descricao TEXT, 
 dataExtracao DATETIME, 
 fkEmpresa INT, 
 FOREIGN KEY (fkEmpresa) REFERENCES empresa(id) ON DELETE CASCADE );
CREATE TABLE demandaPesquisa ( id INT AUTO_INCREMENT PRIMARY KEY, nivelInteresse INT, dataLeitura DATETIME, dataExtracao DATETIME, fkEmpresa INT, FOREIGN KEY (fkEmpresa) REFERENCES empresa(id) ON DELETE CASCADE ); 
 
CREATE TABLE avaliacao ( 
 id INT AUTO_INCREMENT PRIMARY KEY,
 qtdEstrela INT, 
 descricaoComentario TEXT, 
 dataExtracao DATETIME,
 fkEmpresa INT, 
 FOREIGN KEY (fkEmpresa) REFERENCES empresa(id) ON DELETE CASCADE ); 

 CREATE TABLE solicitacoes ( 
 id INT AUTO_INCREMENT PRIMARY KEY, 
 nome VARCHAR(60), email VARCHAR(80), 
 telefone VARCHAR(11), 
 empresa VARCHAR(40),
 estado ENUM('ATIVO', 'INATIVO') NOT NULL
 );


-- Inserindo Marcas
INSERT INTO empresa (codigo, nomeFantasia, razaoSocial, apelido, cnpj, estado, cep, logradouro, email, telefone, fkMarca)
VALUES
('MARCA001', 'McDonald\s', 'Arcos Dourados Comércio de Alimentos Ltda.', 'McD', '42110090000140', 'ATIVO', '04578005', 'Av. Dr. Chucri Zaidan, 920', 'contato@mcdonalds.com.br', '1121555070', NULL),
('MARCA002', 'Burger King', 'Burger King do Brasil S.A.', 'BK', '02747380000150', 'INATIVO', '04578905', 'Av. Juscelino Kubitschek, 1500', 'contato@burgerking.com.br', '1121236100', NULL),
('MARCA003', 'Subway', 'Subway Partners Comércio Ltda.', 'Sub', '02963710000127', 'INATIVO', '04083002', 'Av. Paulista, 1000', 'contato@subway.com.br', '1132674000', NULL),
('MARCA004', 'KFC', 'KFC Brasil Ltda.', 'Kentucky', '03657120000189', 'ATIVO', '04083001', 'Rua Vergueiro, 500', 'contato@kfc.com.br', '1133456000', NULL),
('MARCA005', 'Pizza Hut', 'Pizza Hut Brasil S.A.', 'PizzaHut', '08211629000120', 'INATIVO', '01454000', 'Rua Augusta, 1500', 'contato@pizzahut.com.br', '1123567900', NULL);

-- Inserindo Empresas Vinculadas às Marcas
INSERT INTO empresa (codigo, nomeFantasia, razaoSocial, apelido, cnpj, estado, cep, logradouro, email, telefone, fkMarca)
VALUES
('EMP001', 'McDonald\s Loja 1', 'Arcos Dourados Comércio de Alimentos Ltda.', 'McD Loja 1', '42110090000141', 'ATIVO', '04578006', 'Rua A, 100', 'loja1@mcdonalds.com.br', '1121555071', 1),
('EMP002', 'McDonald\s Loja 2', 'Arcos Dourados Comércio de Alimentos Ltda.', 'McD Loja 2', '42110090000142', 'ATIVO', '04578007', 'Rua B, 200', 'loja2@mcdonalds.com.br', '1121555072', 1),
('EMP003', 'Burger King Loja 1', 'Burger King do Brasil S.A.', 'BK Loja 1', '02747380000151', 'ATIVO', '04578906', 'Rua C, 300', 'loja1@burgerking.com.br', '1121236101', 2),
('EMP004', 'Burger King Loja 2', 'Burger King do Brasil S.A.', 'BK Loja 2', '02747380000152', 'INATIVO', '04578907', 'Rua D, 400', 'loja2@burgerking.com.br', '1121236102', 2),
('EMP005', 'Subway Loja 1', 'Subway Partners Comércio Ltda.', 'Sub Loja 1', '02963710000128', 'INATIVO', '04083003', 'Rua E, 500', 'loja1@subway.com.br', '1132674001', 3),
('EMP006', 'Subway Loja 2', 'Subway Partners Comércio Ltda.', 'Sub Loja 2', '02963710000129', 'INATIVO', '04083004', 'Rua F, 600', 'loja2@subway.com.br', '1132674002', 3),
('EMP007', 'KFC Loja 1', 'KFC Brasil Ltda.', 'KFC Loja 1', '03657120000190', 'ATIVO', '04083005', 'Rua G, 700', 'loja1@kfc.com.br', '1133456001', 4),
('EMP008', 'Pizza Hut Loja 1', 'Pizza Hut Brasil S.A.', 'PizzaHut Loja 1', '08211629000121', 'ATIVO', '01454001', 'Rua H, 800', 'loja1@pizzahut.com.br', '1123567901', 5);

-- Funcionários: Diretores
INSERT INTO funcionario (nome, cpf, email, senha, estado, fkEmpresa)
VALUES
('Carlos Silva', '12345678901', 'carlos.diretor@mcdonalds.com', 'senha_hashada', 'INATIVO', 1),
('Ana Oliveira', '23456789012', 'ana.diretor@burgerking.com', 'senha_hashada', 'INATIVO', 3),
('Paulo Souza', '34567890123', 'paulo.diretor@subway.com', 'senha_hashada', 'ATIVO', 5),
('Mariana Costa', '45678901234', 'mariana.diretor@kfc.com', 'senha_hashada', 'ATIVO', 7),
('Julia Azevedo', '56789012345', 'julia.diretor@pizzahut.com', 'senha_hashada', 'ATIVO', 8);

-- Funcionários: Gerentes
INSERT INTO funcionario (nome, cpf, email, senha, estado, fkEmpresa)
VALUES
('João Almeida', '12345678902', 'joao.gerente@mcdonalds.com', 'senha_hashada', 'ATIVO', 2),
('Maria Santos', '23456789013', 'maria.gerente@burgerking.com', 'senha_hashada', 'ATIVO', 4),
('Rafael Lima', '34567890124', 'rafael.gerente@subway.com', 'senha_hashada', 'ATIVO', 6),
('Fernanda Rocha', '45678901235', 'fernanda.gerente@kfc.com', 'senha_hashada', 'INATIVO', 7),
('Lucas Martins', '56789012346', 'lucas.gerente@pizzahut.com', 'senha_hashada', 'INATIVO', 8);

-- Reclamações Simuladas
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa)
VALUES
('Produto com defeito', 'Recebi um sanduíche com ingredientes diferentes do pedido.', NOW(), 1),
('Atendimento ruim', 'Funcionários mal educados e demora no atendimento.', NOW(), 3),
('Entrega atrasada', 'Pedido demorou mais de 2 horas para chegar.', NOW(), 5),
('Erro na cobrança', 'Cobrança duplicada no cartão.', NOW(), 7),
('Comida fria', 'Pizza chegou fria e mal embalada.', NOW(), 8),
('Ambiente sujo', 'Mesas e banheiros estavam em péssimas condições.', NOW(), 2),
('Pedido errado', 'Recebi itens diferentes do que pedi.', NOW(), 4),
('Sem estoque', 'Faltavam vários produtos no cardápio.', NOW(), 6);

-- Demandas de Pesquisa
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa)
VALUES
(5, '2024-11-11 10:00:00', NOW(), 1),
(4, '2024-11-12 14:30:00', NOW(), 3),
(3, '2024-11-13 09:15:00', NOW(), 5),
(2, '2024-11-14 12:45:00', NOW(), 7),
(1, '2024-11-15 18:00:00', NOW(), 8),
(3, '2024-11-16 08:00:00', NOW(), 2),
(4, '2024-11-17 16:20:00', NOW(), 4),
(5, '2024-11-18 19:30:00', NOW(), 6);

-- Avaliações
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa)
VALUES
(5, 'Ótimo atendimento e comida deliciosa!', NOW(), 1),
(4, 'Boa comida, mas atendimento pode melhorar.', NOW(), 2),
(3, 'Esperava mais do sabor.', NOW(), 3),
(2, 'Demoraram muito para entregar.', NOW(), 4),
(1, 'Comida fria e atendimento ruim.', NOW(), 5),
(5, 'Excelente experiência, voltarei novamente!', NOW(), 6),
(4, 'Ambiente agradável, mas o pedido demorou.', NOW(), 7),
(3, 'Médio, itens faltando no pedido.', NOW(), 8);