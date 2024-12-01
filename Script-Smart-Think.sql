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
 cpf CHAR(14) UNIQUE, 
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
-- Inserindo as marcas (McDonald's, Burger King e KFC)
INSERT INTO empresa (codigo, nomeFantasia, razaoSocial, apelido, cnpj, estado, cep, logradouro, email, telefone, fkMarca)
VALUES
('MARCA001', 'McDonalds', 'Arcos Dourados Comércio de Alimentos Ltda.', 'McD', '42110090000140', 'ATIVO', '04578005', 'Av. Dr. Chucri Zaidan, 920', 'contato@mcdonalds.com.br', '1121555070', NULL),
('MARCA002', 'Burger King', 'Burger King do Brasil S.A.', 'BK', '02747380000150', 'ATIVO', '04578905', 'Av. Juscelino Kubitschek, 1500', 'contato@burgerking.com.br', '1121236100', NULL),
('MARCA003', 'KFC', 'KFC Brasil Ltda.', 'Kentucky', '03657120000189', 'ATIVO', '04083001', 'Rua Vergueiro, 500', 'contato@kfc.com.br', '1133456000', NULL);

-- Inserindo 3 unidades para cada marca
INSERT INTO empresa (codigo, nomeFantasia, razaoSocial, apelido, cnpj, estado, cep, logradouro, email, telefone, fkMarca)
VALUES
-- Unidades McDonald's
('EMP001', 'McDonalds Loja 1', 'Arcos Dourados Comércio de Alimentos Ltda.', 'McD Loja 1', '42110090000141', 'ATIVO', '04578006', 'Rua A, 100', 'loja1@mcdonalds.com.br', '1121555071', 1),
('EMP002', 'McDonalds Loja 2', 'Arcos Dourados Comércio de Alimentos Ltda.', 'McD Loja 2', '42110090000142', 'ATIVO', '04578007', 'Rua B, 200', 'loja2@mcdonalds.com.br', '1121555072', 1),
('EMP003', 'McDonalds Loja 3', 'Arcos Dourados Comércio de Alimentos Ltda.', 'McD Loja 3', '42110090000143', 'ATIVO', '04578008', 'Rua C, 300', 'loja3@mcdonalds.com.br', '1121555073', 1),

-- Unidades Burger King
('EMP004', 'Burger King Loja 1', 'Burger King do Brasil S.A.', 'BK Loja 1', '02747380000151', 'ATIVO', '04578906', 'Rua D, 400', 'loja1@burgerking.com.br', '1121236101', 2),
('EMP005', 'Burger King Loja 2', 'Burger King do Brasil S.A.', 'BK Loja 2', '02747380000152', 'ATIVO', '04578907', 'Rua E, 500', 'loja2@burgerking.com.br', '1121236102', 2),
('EMP006', 'Burger King Loja 3', 'Burger King do Brasil S.A.', 'BK Loja 3', '02747380000153', 'ATIVO', '04578908', 'Rua F, 600', 'loja3@burgerking.com.br', '1121236103', 2),

-- Unidades KFC
('EMP007', 'KFC Loja 1', 'KFC Brasil Ltda.', 'KFC Loja 1', '03657120000190', 'ATIVO', '04083005', 'Rua G, 700', 'loja1@kfc.com.br', '1133456001', 3),
('EMP008', 'KFC Loja 2', 'KFC Brasil Ltda.', 'KFC Loja 2', '03657120000191', 'ATIVO', '04083006', 'Rua H, 800', 'loja2@kfc.com.br', '1133456002', 3),
('EMP009', 'KFC Loja 3', 'KFC Brasil Ltda.', 'KFC Loja 3', '03657120000192', 'ATIVO', '04083007', 'Rua I, 900', 'loja3@kfc.com.br', '1133456003', 3);

-- Inserindo diretores das marcas
INSERT INTO funcionario (nome, cpf, email, senha, estado, fkEmpresa)
VALUES
('Carlos Silva', '12345678901', 'carlos.diretor@mcdonalds.com', 'senha_hashada', 'ATIVO', 1),
('Ana Oliveira', '23456789012', 'ana.diretor@burgerking.com', 'senha_hashada', 'ATIVO', 2),
('Mariana Costa', '34567890123', 'mariana.diretor@kfc.com', 'senha_hashada', 'ATIVO', 3),
('Cristhian Lauriano Rocha', '85963214596','cristhian.marqueze@sptech.school','senha_hashada','ATIVO',4),
('Fernando Henrique Santos Soares', '65932478512','fernando.soares@sptech.school','senha_hashada','ATIVO',5),
('Gustavo Aloe Gnecco', '20365478951', 'gustavo.moraes@sptech.school','senha_hashada','ATIVO',6),
('Denyel Henry Feitosa', '65932415627','denyel.oliveira@sptech.school','senha_hashada','ATIVO',7),
('Ana Cladia Ferreira','89654712304','ana.fsilva@sptech.school','senha_hashada','ATIVO',8);

-- Inserindo gerentes das unidades
INSERT INTO funcionario (nome, cpf, email, senha, estado, fkEmpresa)
VALUES
-- Gerentes McDonald's
('João Almeida', '12345678902', 'joao.gerente@mcdonalds.com', 'senha_hashada', 'ATIVO', 4),
('Pedro Gomes', '23456789014', 'pedro.gerente@mcdonalds.com', 'senha_hashada', 'ATIVO', 5),
('Laura Fernandes', '34567890124', 'laura.gerente@mcdonalds.com', 'senha_hashada', 'ATIVO', 6),

-- Gerentes Burger King
('Maria Santos', '45678901235', 'maria.gerente@burgerking.com', 'senha_hashada', 'ATIVO', 7),
('Rafael Lima', '56789012346', 'rafael.gerente@burgerking.com', 'senha_hashada', 'ATIVO', 8),
('Fernanda Rocha', '67890123457', 'fernanda.gerente@burgerking.com', 'senha_hashada', 'ATIVO', 9),

-- Gerentes KFC
('Lucas Martins', '78901234568', 'lucas.gerente@kfc.com', 'senha_hashada', 'ATIVO', 10),
('André Menezes', '89012345679', 'andre.gerente@kfc.com', 'senha_hashada', 'ATIVO', 11),
('Julia Azevedo', '90123456780', 'julia.gerente@kfc.com', 'senha_hashada', 'ATIVO', 12);

INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Má iluminação', 'O restaurante estava escuro.', '2024-08-15 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Erro no drive-thru', 'Esqueceram parte do pedido.', '2024-02-10 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Fila longa', 'Esperei mais de 30 minutos.', '2024-08-08 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Produto errado', 'Recebi um pedido diferente do solicitado.', '2024-08-10 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2024-03-15 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2024-01-11 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2024-05-22 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('App com erro', 'Ocupom não funcionou no aplicativo.', '2024-01-26 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Fila longa', 'Esperei mais de 30 minutos.', '2024-01-24 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Erro no drive-thru', 'Esqueceram parte do pedido.', '2024-06-04 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Erro no drive-thru', 'Esqueceram parte do pedido.', '2024-08-08 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Erro no drive-thru', 'Esqueceram parte do pedido.', '2024-05-13 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Falta de molho', 'Não entregaram os molhos solicitados.', '2024-10-19 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Local sujo', 'O ambiente estava desorganizado.', '2024-04-26 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2023-12-10 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Local sujo', 'O ambiente estava desorganizado.', '2024-08-13 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Falta de molho', 'Não entregaram os molhos solicitados.', '2024-11-07 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Erro no drive-thru', 'Esqueceram parte do pedido.', '2024-05-13 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2024-03-11 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2024-01-01 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pedido incompleto', 'Itens do combo estavam faltando.', '2024-03-23 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Batata fria', 'As batatas fritas estavam geladas.', '2024-07-29 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2023-12-13 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Erro no drive-thru', 'Esqueceram parte do pedido.', '2024-06-18 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Hambúrguer queimado', 'Sanduíche passou do ponto.', '2024-11-14 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Má iluminação', 'O restaurante estava escuro.', '2024-09-17 09:18:14', 2);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Falta de molho', 'Não entregaram os molhos solicitados.', '2024-06-06 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Hambúrguer queimado', 'Sanduíche passou do ponto.', '2024-03-12 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Erro no drive-thru', 'Esqueceram parte do pedido.', '2024-09-02 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Erro no drive-thru', 'Esqueceram parte do pedido.', '2024-07-21 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Local sujo', 'O ambiente estava desorganizado.', '2024-01-27 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('App com erro', 'Ocupom não funcionou no aplicativo.', '2024-11-03 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Fila longa', 'Esperei mais de 30 minutos.', '2024-10-07 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2024-05-24 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Hambúrguer queimado', 'Sanduíche passou do ponto.', '2024-01-29 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Falta de molho', 'Não entregaram os molhos solicitados.', '2024-11-09 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Má iluminação', 'O restaurante estava escuro.', '2024-08-01 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Fila longa', 'Esperei mais de 30 minutos.', '2024-03-25 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pedido incompleto', 'Itens do combo estavam faltando.', '2024-01-01 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Local sujo', 'O ambiente estava desorganizado.', '2024-07-01 09:18:14', 3);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('App com erro', 'Ocupom não funcionou no aplicativo.', '2023-12-17 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2024-11-11 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2024-06-30 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2024-09-13 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2024-09-11 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Preço alto', 'Achei os preços muito caros.', '2024-03-30 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2024-11-25 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Demora na entrega', 'Esperei muito pelo meu pedido.', '2024-09-12 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Má iluminação', 'O restaurante estava escuro.', '2024-06-27 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Demora na entrega', 'Esperei muito pelo meu pedido.', '2024-09-25 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Demora na entrega', 'Esperei muito pelo meu pedido.', '2024-05-31 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Hambúrguer queimado', 'Sanduíche passou do ponto.', '2023-12-19 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Produto errado', 'Recebi um pedido diferente do solicitado.', '2024-09-03 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('App com erro', 'Ocupom não funcionou no aplicativo.', '2024-04-23 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Atendimento ruim', 'Funcionário foi mal-educado.', '2024-02-08 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('App com erro', 'Ocupom não funcionou no aplicativo.', '2024-01-08 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Batata fria', 'As batatas fritas estavam geladas.', '2024-04-30 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Produto errado', 'Recebi um pedido diferente do solicitado.', '2024-04-12 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Atendimento ruim', 'Funcionário foi mal-educado.', '2024-03-10 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Atendimento ruim', 'Funcionário foi mal-educado.', '2024-10-30 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Atendimento ruim', 'Funcionário foi mal-educado.', '2024-01-20 09:18:14', 4);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2024-05-08 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Fila longa', 'Esperei mais de 30 minutos.', '2024-10-31 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Demora na entrega', 'Esperei muito pelo meu pedido.', '2024-02-04 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Batata fria', 'As batatas fritas estavam geladas.', '2024-11-18 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Má iluminação', 'O restaurante estava escuro.', '2024-05-19 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Falta de molho', 'Não entregaram os molhos solicitados.', '2024-05-08 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Má iluminação', 'O restaurante estava escuro.', '2024-04-14 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2024-06-21 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Demora na entrega', 'Esperei muito pelo meu pedido.', '2024-11-18 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2024-09-23 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Atendimento ruim', 'Funcionário foi mal-educado.', '2024-10-15 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Má iluminação', 'O restaurante estava escuro.', '2024-07-10 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('App com erro', 'Ocupom não funcionou no aplicativo.', '2024-08-21 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2024-10-06 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Atendimento ruim', 'Funcionário foi mal-educado.', '2024-11-17 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Atendimento ruim', 'Funcionário foi mal-educado.', '2024-10-13 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Atendimento ruim', 'Funcionário foi mal-educado.', '2024-04-20 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Local sujo', 'O ambiente estava desorganizado.', '2024-03-04 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Erro no drive-thru', 'Esqueceram parte do pedido.', '2024-08-15 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('App com erro', 'Ocupom não funcionou no aplicativo.', '2024-01-17 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pedido incompleto', 'Itens do combo estavam faltando.', '2024-10-03 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2024-06-17 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Produto errado', 'Recebi um pedido diferente do solicitado.', '2024-10-14 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Demora na entrega', 'Esperei muito pelo meu pedido.', '2024-09-26 09:18:14', 5);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Preço alto', 'Achei os preços muito caros.', '2024-01-30 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Local sujo', 'O ambiente estava desorganizado.', '2024-07-09 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Fila longa', 'Esperei mais de 30 minutos.', '2024-04-15 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Hambúrguer queimado', 'Sanduíche passou do ponto.', '2024-05-11 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Má iluminação', 'O restaurante estava escuro.', '2023-12-08 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Falta de molho', 'Não entregaram os molhos solicitados.', '2023-12-02 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2024-07-29 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2024-07-05 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Produto errado', 'Recebi um pedido diferente do solicitado.', '2024-06-29 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Demora na entrega', 'Esperei muito pelo meu pedido.', '2024-02-13 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pedido incompleto', 'Itens do combo estavam faltando.', '2024-10-03 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Erro no drive-thru', 'Esqueceram parte do pedido.', '2024-08-29 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2024-04-29 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2024-05-15 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2024-07-26 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Hambúrguer queimado', 'Sanduíche passou do ponto.', '2024-05-17 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Demora na entrega', 'Esperei muito pelo meu pedido.', '2024-06-04 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('App com erro', 'Ocupom não funcionou no aplicativo.', '2024-02-26 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2024-01-23 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Batata fria', 'As batatas fritas estavam geladas.', '2024-02-25 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Local sujo', 'O ambiente estava desorganizado.', '2024-08-21 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Erro no drive-thru', 'Esqueceram parte do pedido.', '2024-10-30 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Falta de molho', 'Não entregaram os molhos solicitados.', '2024-09-08 09:18:14', 6);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Atendimento ruim', 'Funcionário foi mal-educado.', '2024-01-13 09:18:14', 7);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Batata fria', 'As batatas fritas estavam geladas.', '2023-12-20 09:18:14', 7);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Fila longa', 'Esperei mais de 30 minutos.', '2024-07-27 09:18:14', 7);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Fila longa', 'Esperei mais de 30 minutos.', '2024-01-21 09:18:14', 7);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Local sujo', 'O ambiente estava desorganizado.', '2024-07-21 09:18:14', 7);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Batata fria', 'As batatas fritas estavam geladas.', '2024-02-07 09:18:14', 7);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Hambúrguer queimado', 'Sanduíche passou do ponto.', '2024-03-21 09:18:14', 7);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Erro no drive-thru', 'Esqueceram parte do pedido.', '2024-05-25 09:18:14', 7);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2023-12-12 09:18:14', 7);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2024-01-30 09:18:14', 7);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Atendimento ruim', 'Funcionário foi mal-educado.', '2024-10-04 09:18:14', 7);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Falta de molho', 'Não entregaram os molhos solicitados.', '2023-12-18 09:18:14', 7);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Falta de molho', 'Não entregaram os molhos solicitados.', '2024-09-21 09:18:14', 7);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pedido incompleto', 'Itens do combo estavam faltando.', '2024-02-25 09:18:14', 8);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pedido incompleto', 'Itens do combo estavam faltando.', '2023-12-02 09:18:14', 8);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Local sujo', 'O ambiente estava desorganizado.', '2024-05-18 09:18:14', 8);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pedido incompleto', 'Itens do combo estavam faltando.', '2024-01-26 09:18:14', 8);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Hambúrguer queimado', 'Sanduíche passou do ponto.', '2024-01-14 09:18:14', 8);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2023-12-14 09:18:14', 8);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Má iluminação', 'O restaurante estava escuro.', '2024-06-07 09:18:14', 8);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Erro no drive-thru', 'Esqueceram parte do pedido.', '2024-09-12 09:18:14', 8);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Batata fria', 'As batatas fritas estavam geladas.', '2024-02-28 09:18:14', 8);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Preço alto', 'Achei os preços muito caros.', '2024-11-10 09:18:14', 8);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Falta de molho', 'Não entregaram os molhos solicitados.', '2024-09-05 09:18:14', 8);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Bebida sem gás', 'O refrigerante estava sem gás.', '2024-11-19 09:18:14', 9);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('App com erro', 'Ocupom não funcionou no aplicativo.', '2024-08-03 09:18:14', 9);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2024-11-14 09:18:14', 9);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Hambúrguer queimado', 'Sanduíche passou do ponto.', '2024-10-14 09:18:14', 9);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Hambúrguer queimado', 'Sanduíche passou do ponto.', '2024-04-16 09:18:14', 9);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Hambúrguer queimado', 'Sanduíche passou do ponto.', '2024-02-27 09:18:14', 9);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Fila longa', 'Esperei mais de 30 minutos.', '2024-04-13 09:18:14', 9);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Produto errado', 'Recebi um pedido diferente do solicitado.', '2023-12-08 09:18:14', 10);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Batata fria', 'As batatas fritas estavam geladas.', '2024-11-25 09:18:14', 10);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Hambúrguer queimado', 'Sanduíche passou do ponto.', '2024-06-02 09:18:14', 10);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('App com erro', 'Ocupom não funcionou no aplicativo.', '2024-02-05 09:18:14', 10);
INSERT INTO reclamacao (titulo, descricao, dataExtracao, fkEmpresa) VALUES ('Pagamento recusado', 'Problemas ao pagar com cartão.', '2023-12-21 09:18:14', 10);

-- Inserts for table demandaPesquisa with more varied data
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2023-12-30 09:18:14', '2023-12-30 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-02-12 09:18:14', '2024-02-12 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-09-25 09:18:14', '2024-09-25 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-10-27 09:18:14', '2024-10-27 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-10-08 09:18:14', '2024-10-08 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-03-27 09:18:14', '2024-03-27 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-11-06 09:18:14', '2024-11-06 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-02-12 09:18:14', '2024-02-12 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2023-12-16 09:18:14', '2023-12-16 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-04-18 09:18:14', '2024-04-18 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-06-29 09:18:14', '2024-06-29 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-01-02 09:18:14', '2024-01-02 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-11-03 09:18:14', '2024-11-03 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-02-23 09:18:14', '2024-02-23 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-11-23 09:18:14', '2024-11-23 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (10, '2024-08-21 09:18:14', '2024-08-21 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-03-03 09:18:14', '2024-03-03 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (10, '2024-06-10 09:18:14', '2024-06-10 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (10, '2024-07-13 09:18:14', '2024-07-13 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-05-28 09:18:14', '2024-05-28 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-09-03 09:18:14', '2024-09-03 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-04-25 09:18:14', '2024-04-25 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2023-12-03 09:18:14', '2023-12-03 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-07-17 09:18:14', '2024-07-17 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-10-17 09:18:14', '2024-10-17 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-03-09 09:18:14', '2024-03-09 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2023-12-17 09:18:14', '2023-12-17 09:18:14', 2);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-09-08 09:18:14', '2024-09-08 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-02-26 09:18:14', '2024-02-26 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-07-01 09:18:14', '2024-07-01 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2023-12-17 09:18:14', '2023-12-17 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-03-25 09:18:14', '2024-03-25 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-05-17 09:18:14', '2024-05-17 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-06-17 09:18:14', '2024-06-17 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2023-12-25 09:18:14', '2023-12-25 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-09-14 09:18:14', '2024-09-14 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-07-20 09:18:14', '2024-07-20 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-10-08 09:18:14', '2024-10-08 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-04-10 09:18:14', '2024-04-10 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (10, '2024-10-28 09:18:14', '2024-10-28 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-07-13 09:18:14', '2024-07-13 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-08-16 09:18:14', '2024-08-16 09:18:14', 3);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-05-26 09:18:14', '2024-05-26 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-10-03 09:18:14', '2024-10-03 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-01-01 09:18:14', '2024-01-01 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-02-12 09:18:14', '2024-02-12 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-06-29 09:18:14', '2024-06-29 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-07-28 09:18:14', '2024-07-28 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-08-31 09:18:14', '2024-08-31 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-02-23 09:18:14', '2024-02-23 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-03-12 09:18:14', '2024-03-12 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-06-21 09:18:14', '2024-06-21 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-01-17 09:18:14', '2024-01-17 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-07-05 09:18:14', '2024-07-05 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-10-21 09:18:14', '2024-10-21 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-08-12 09:18:14', '2024-08-12 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-03-02 09:18:14', '2024-03-02 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-06-02 09:18:14', '2024-06-02 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-08-22 09:18:14', '2024-08-22 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-11-13 09:18:14', '2024-11-13 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-05-16 09:18:14', '2024-05-16 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-01-31 09:18:14', '2024-01-31 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2023-12-20 09:18:14', '2023-12-20 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (10, '2024-06-18 09:18:14', '2024-06-18 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-06-11 09:18:14', '2024-06-11 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-06-05 09:18:14', '2024-06-05 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-08-11 09:18:14', '2024-08-11 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-06-22 09:18:14', '2024-06-22 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-01-19 09:18:14', '2024-01-19 09:18:14', 4);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-06-01 09:18:14', '2024-06-01 09:18:14', 5);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-11-01 09:18:14', '2024-11-01 09:18:14', 5);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-06-12 09:18:14', '2024-06-12 09:18:14', 5);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-03-15 09:18:14', '2024-03-15 09:18:14', 5);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-07-24 09:18:14', '2024-07-24 09:18:14', 5);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-02-13 09:18:14', '2024-02-13 09:18:14', 5);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-02-17 09:18:14', '2024-02-17 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-06-04 09:18:14', '2024-06-04 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-02-05 09:18:14', '2024-02-05 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-04-10 09:18:14', '2024-04-10 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-04-04 09:18:14', '2024-04-04 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-11-28 09:18:14', '2024-11-28 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2023-12-26 09:18:14', '2023-12-26 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-05-06 09:18:14', '2024-05-06 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-11-01 09:18:14', '2024-11-01 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (10, '2024-07-06 09:18:14', '2024-07-06 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-10-20 09:18:14', '2024-10-20 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-04-21 09:18:14', '2024-04-21 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-07-23 09:18:14', '2024-07-23 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-07-16 09:18:14', '2024-07-16 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-05-23 09:18:14', '2024-05-23 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-04-13 09:18:14', '2024-04-13 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-02-01 09:18:14', '2024-02-01 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-07-22 09:18:14', '2024-07-22 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-03-21 09:18:14', '2024-03-21 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2023-12-05 09:18:14', '2023-12-05 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-04-29 09:18:14', '2024-04-29 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-03-17 09:18:14', '2024-03-17 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-09-12 09:18:14', '2024-09-12 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-04-12 09:18:14', '2024-04-12 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-04-23 09:18:14', '2024-04-23 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-09-21 09:18:14', '2024-09-21 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (10, '2024-10-22 09:18:14', '2024-10-22 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (10, '2024-11-26 09:18:14', '2024-11-26 09:18:14', 6);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-11-12 09:18:14', '2024-11-12 09:18:14', 7);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-03-06 09:18:14', '2024-03-06 09:18:14', 7);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-08-11 09:18:14', '2024-08-11 09:18:14', 7);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-08-03 09:18:14', '2024-08-03 09:18:14', 7);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (10, '2024-11-27 09:18:14', '2024-11-27 09:18:14', 7);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-08-14 09:18:14', '2024-08-14 09:18:14', 7);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-07-07 09:18:14', '2024-07-07 09:18:14', 7);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-03-28 09:18:14', '2024-03-28 09:18:14', 7);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-01-15 09:18:14', '2024-01-15 09:18:14', 7);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (10, '2024-04-16 09:18:14', '2024-04-16 09:18:14', 7);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-01-31 09:18:14', '2024-01-31 09:18:14', 8);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-09-07 09:18:14', '2024-09-07 09:18:14', 8);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-05-27 09:18:14', '2024-05-27 09:18:14', 8);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-05-29 09:18:14', '2024-05-29 09:18:14', 8);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-02-18 09:18:14', '2024-02-18 09:18:14', 8);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-02-20 09:18:14', '2024-02-20 09:18:14', 8);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-06-20 09:18:14', '2024-06-20 09:18:14', 8);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-06-27 09:18:14', '2024-06-27 09:18:14', 8);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-05-16 09:18:14', '2024-05-16 09:18:14', 8);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-02-22 09:18:14', '2024-02-22 09:18:14', 8);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-08-12 09:18:14', '2024-08-12 09:18:14', 8);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-09-28 09:18:14', '2024-09-28 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-03-23 09:18:14', '2024-03-23 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-11-07 09:18:14', '2024-11-07 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-03-03 09:18:14', '2024-03-03 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-04-13 09:18:14', '2024-04-13 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-02-03 09:18:14', '2024-02-03 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-02-19 09:18:14', '2024-02-19 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (10, '2024-07-12 09:18:14', '2024-07-12 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-04-20 09:18:14', '2024-04-20 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (10, '2024-03-31 09:18:14', '2024-03-31 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-05-02 09:18:14', '2024-05-02 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-04-05 09:18:14', '2024-04-05 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (10, '2024-05-24 09:18:14', '2024-05-24 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-04-26 09:18:14', '2024-04-26 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-03-10 09:18:14', '2024-03-10 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-04-19 09:18:14', '2024-04-19 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-04-07 09:18:14', '2024-04-07 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-05-20 09:18:14', '2024-05-20 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-09-18 09:18:14', '2024-09-18 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-03-30 09:18:14', '2024-03-30 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-11-28 09:18:14', '2024-11-28 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-04-29 09:18:14', '2024-04-29 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-08-10 09:18:14', '2024-08-10 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-08-16 09:18:14', '2024-08-16 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-07-30 09:18:14', '2024-07-30 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-06-10 09:18:14', '2024-06-10 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-06-08 09:18:14', '2024-06-08 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2023-12-11 09:18:14', '2023-12-11 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (5, '2024-07-07 09:18:14', '2024-07-07 09:18:14', 9);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2023-12-06 09:18:14', '2023-12-06 09:18:14', 10);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (9, '2024-07-27 09:18:14', '2024-07-27 09:18:14', 10);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-04-08 09:18:14', '2024-04-08 09:18:14', 10);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-03-08 09:18:14', '2024-03-08 09:18:14', 10);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (7, '2024-03-03 09:18:14', '2024-03-03 09:18:14', 10);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (8, '2024-11-13 09:18:14', '2024-11-13 09:18:14', 10);
INSERT INTO demandaPesquisa (nivelInteresse, dataLeitura, dataExtracao, fkEmpresa) VALUES (6, '2024-02-01 09:18:14', '2024-02-01 09:18:14', 10);

-- Inserts for table avaliacao with more varied data
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Lanches deliciosos.', '2024-07-11 09:18:14', 2);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2024-10-25 09:18:14', 2);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2024-05-31 09:18:14', 2);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Lanches deliciosos.', '2024-07-03 09:18:14', 2);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Local muito barulhento.', '2024-08-18 09:18:14', 2);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Bom custo-benefício.', '2024-08-02 09:18:14', 2);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Refrigerante sem gás.', '2024-05-05 09:18:14', 2);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2024-03-09 09:18:14', 2);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Poderia melhorar o ambiente.', '2024-09-10 09:18:14', 2);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Poderia melhorar o ambiente.', '2024-05-09 09:18:14', 2);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Ambiente limpo e agradável.', '2023-12-29 09:18:14', 2);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Lanches deliciosos.', '2024-06-09 09:18:14', 2);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Achei o lanche médio.', '2024-10-29 09:18:14', 2);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Refrigerante sem gás.', '2024-09-13 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Bom custo-benefício.', '2024-03-09 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Local muito barulhento.', '2024-04-12 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Achei o lanche médio.', '2024-10-14 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Batata frita fria.', '2024-10-09 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Bom custo-benefício.', '2024-07-19 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Bom custo-benefício.', '2024-01-23 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2024-07-27 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Lanches deliciosos.', '2024-02-22 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Sanduíche estava bom.', '2024-07-01 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Local muito barulhento.', '2024-07-23 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Refrigerante sem gás.', '2024-11-11 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2024-07-13 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2024-06-19 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2024-08-27 09:18:14', 3);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Achei o lanche médio.', '2024-08-03 09:18:14', 4);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Funcionários muito educados.', '2024-04-12 09:18:14', 4);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Lanches deliciosos.', '2024-07-21 09:18:14', 4);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Lanches deliciosos.', '2024-10-27 09:18:14', 4);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Ótimo atendimento.', '2024-02-09 09:18:14', 4);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Muito ruim, não volto.', '2024-05-23 09:18:14', 4);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Batata frita fria.', '2024-03-27 09:18:14', 4);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Sanduíche estava bom.', '2024-08-03 09:18:14', 4);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Ambiente limpo e agradável.', '2024-04-20 09:18:14', 4);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Poderia melhorar o ambiente.', '2024-04-23 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Funcionários muito educados.', '2024-02-11 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Sanduíche estava bom.', '2024-06-18 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2023-12-31 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Poderia melhorar o ambiente.', '2024-09-25 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2024-07-17 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2024-08-03 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Muito ruim, não volto.', '2024-11-29 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Bom custo-benefício.', '2024-03-05 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Bom custo-benefício.', '2024-09-18 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Batata frita fria.', '2023-12-06 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2024-08-31 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Local muito barulhento.', '2024-08-18 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Lanches deliciosos.', '2023-12-23 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Ótimo atendimento.', '2024-05-03 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Ambiente limpo e agradável.', '2024-04-09 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Poderia melhorar o ambiente.', '2024-02-15 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Adorei a experiência.', '2024-10-03 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Poderia melhorar o ambiente.', '2024-02-18 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Refrigerante sem gás.', '2024-02-07 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Adorei a experiência.', '2024-11-27 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2023-12-14 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Muito ruim, não volto.', '2024-02-12 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Ambiente limpo e agradável.', '2023-12-28 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Lanches deliciosos.', '2023-12-23 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Funcionários muito educados.', '2023-12-12 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Local muito barulhento.', '2024-04-25 09:18:14', 5);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Batata frita fria.', '2024-07-06 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2024-04-06 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2024-05-27 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Ótimo atendimento.', '2024-05-11 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Achei o lanche médio.', '2024-02-20 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Batata frita fria.', '2024-05-08 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Muito ruim, não volto.', '2024-02-08 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Refrigerante sem gás.', '2024-04-02 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Achei o lanche médio.', '2024-02-07 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Bom custo-benefício.', '2024-01-18 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Refrigerante sem gás.', '2024-01-13 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Muito ruim, não volto.', '2024-06-08 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Ótimo atendimento.', '2024-09-22 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Refrigerante sem gás.', '2024-01-11 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Batata frita fria.', '2024-06-20 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Refrigerante sem gás.', '2024-11-27 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2024-06-26 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2024-08-25 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Adorei a experiência.', '2024-02-14 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Bom custo-benefício.', '2024-12-01 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Ótimo atendimento.', '2024-01-17 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Adorei a experiência.', '2024-05-31 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Batata frita fria.', '2024-02-06 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Ótimo atendimento.', '2023-12-15 09:18:14', 6);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Sanduíche estava bom.', '2024-07-01 09:18:14', 7);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Poderia melhorar o ambiente.', '2024-07-28 09:18:14', 7);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Achei o lanche médio.', '2024-05-05 09:18:14', 7);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Sanduíche estava bom.', '2024-04-28 09:18:14', 7);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Local muito barulhento.', '2024-06-29 09:18:14', 7);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2024-02-05 09:18:14', 7);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Achei o lanche médio.', '2024-02-03 09:18:14', 7);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Ambiente limpo e agradável.', '2024-09-14 09:18:14', 7);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Batata frita fria.', '2024-06-16 09:18:14', 7);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Refrigerante sem gás.', '2024-11-27 09:18:14', 7);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Refrigerante sem gás.', '2024-08-24 09:18:14', 7);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Funcionários muito educados.', '2024-07-12 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Muito ruim, não volto.', '2024-10-28 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2024-08-13 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Poderia melhorar o ambiente.', '2024-03-25 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Batata frita fria.', '2024-03-14 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Poderia melhorar o ambiente.', '2024-01-30 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Achei o lanche médio.', '2024-01-14 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2024-03-03 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Local muito barulhento.', '2023-12-18 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2023-12-03 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2024-07-05 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Achei o lanche médio.', '2024-03-09 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Refrigerante sem gás.', '2024-07-29 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Poderia melhorar o ambiente.', '2024-03-16 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Sanduíche estava bom.', '2024-05-28 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Ótimo atendimento.', '2024-06-04 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Local muito barulhento.', '2024-09-01 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Local muito barulhento.', '2024-03-31 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Adorei a experiência.', '2024-07-20 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2024-02-02 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Achei o lanche médio.', '2024-07-06 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Funcionários muito educados.', '2024-04-07 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Achei o lanche médio.', '2024-03-13 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Ótimo atendimento.', '2024-03-16 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2024-08-24 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Achei o lanche médio.', '2024-01-26 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Ambiente limpo e agradável.', '2024-01-13 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Poderia melhorar o ambiente.', '2024-07-17 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Sanduíche estava bom.', '2023-12-20 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2024-02-15 09:18:14', 8);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Local muito barulhento.', '2024-04-15 09:18:14', 9);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Refrigerante sem gás.', '2024-05-05 09:18:14', 9);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Ótimo atendimento.', '2024-08-02 09:18:14', 9);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Funcionários muito educados.', '2024-09-23 09:18:14', 9);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2024-09-26 09:18:14', 9);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Lanches deliciosos.', '2024-03-22 09:18:14', 9);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Poderia melhorar o ambiente.', '2024-08-09 09:18:14', 9);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Achei o lanche médio.', '2024-08-30 09:18:14', 9);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Ambiente limpo e agradável.', '2024-09-26 09:18:14', 9);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Bom custo-benefício.', '2024-02-15 09:18:14', 9);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Adorei a experiência.', '2024-10-17 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Ambiente limpo e agradável.', '2024-05-11 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Local muito barulhento.', '2024-04-10 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Ambiente limpo e agradável.', '2024-05-26 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Não recomendo.', '2024-08-22 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2024-09-25 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Ambiente limpo e agradável.', '2024-07-28 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Batata frita fria.', '2024-07-07 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Bom custo-benefício.', '2024-08-11 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Muito ruim, não volto.', '2024-10-06 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (1, 'Muito ruim, não volto.', '2024-05-09 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (2, 'Batata frita fria.', '2024-03-02 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Demorou um pouco.', '2024-09-25 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (3, 'Sanduíche estava bom.', '2024-05-13 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (5, 'Ótimo atendimento.', '2024-01-09 09:18:14', 10);
INSERT INTO avaliacao (qtdEstrela, descricaoComentario, dataExtracao, fkEmpresa) VALUES (4, 'Ambiente limpo e agradável.', '2024-07-06 09:18:14', 10);

-- Inserts for table solicitacoes with more varied data
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Pedro Gomes', 'pedro.gomes@empresa2.com', '11944444444', 'Loja 2', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rodrigo Oliveira', 'rodrigo.oliveira@empresa2.com', '11999933333', 'Loja 2', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Julia Azevedo', 'julia.azevedo@empresa2.com', '11900000000', 'Loja 2', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Sofia Almeida', 'sofia.almeida@empresa2.com', '11999944444', 'Loja 2', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Gabriel Santos', 'gabriel.santos@empresa2.com', '11999911111', 'Loja 2', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Thiago Pereira', 'thiago.pereira@empresa2.com', '11999955555', 'Loja 2', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Paula Mendes', 'paula.mendes@empresa2.com', '11999922222', 'Loja 2', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Laura Rocha', 'laura.rocha@empresa2.com', '11922222222', 'Loja 2', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa2.com', '11911111111', 'Loja 2', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Carlos Souza', 'carlos.souza@empresa2.com', '11977777777', 'Loja 2', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Lucas Ferreira', 'lucas.ferreira@empresa2.com', '11933333333', 'Loja 2', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Lucas Ferreira', 'lucas.ferreira@empresa2.com', '11933333333', 'Loja 2', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Laura Rocha', 'laura.rocha@empresa2.com', '11922222222', 'Loja 2', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Sofia Almeida', 'sofia.almeida@empresa2.com', '11999944444', 'Loja 2', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Fernanda Silva', 'fernanda.silva@empresa3.com', '11955555555', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Julia Azevedo', 'julia.azevedo@empresa3.com', '11900000000', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Pedro Gomes', 'pedro.gomes@empresa3.com', '11944444444', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Gabriel Santos', 'gabriel.santos@empresa3.com', '11999911111', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Fernanda Silva', 'fernanda.silva@empresa3.com', '11955555555', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa3.com', '11911111111', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Paula Mendes', 'paula.mendes@empresa3.com', '11999922222', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Pedro Gomes', 'pedro.gomes@empresa3.com', '11944444444', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Maria Oliveira', 'maria.oliveira@empresa3.com', '11988888888', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Paula Mendes', 'paula.mendes@empresa3.com', '11999922222', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa3.com', '11911111111', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rodrigo Oliveira', 'rodrigo.oliveira@empresa3.com', '11999933333', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Fernanda Silva', 'fernanda.silva@empresa3.com', '11955555555', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Lucas Ferreira', 'lucas.ferreira@empresa3.com', '11933333333', 'Loja 3', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa4.com', '11966666666', 'Loja 4', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa4.com', '11966666666', 'Loja 4', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Gabriel Santos', 'gabriel.santos@empresa4.com', '11999911111', 'Loja 4', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Pedro Gomes', 'pedro.gomes@empresa4.com', '11944444444', 'Loja 4', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Thiago Pereira', 'thiago.pereira@empresa4.com', '11999955555', 'Loja 4', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa4.com', '11966666666', 'Loja 4', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Maria Oliveira', 'maria.oliveira@empresa4.com', '11988888888', 'Loja 4', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa4.com', '11966666666', 'Loja 4', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa4.com', '11911111111', 'Loja 4', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Thiago Pereira', 'thiago.pereira@empresa4.com', '11999955555', 'Loja 4', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Maria Oliveira', 'maria.oliveira@empresa4.com', '11988888888', 'Loja 4', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Lucas Ferreira', 'lucas.ferreira@empresa4.com', '11933333333', 'Loja 4', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa4.com', '11911111111', 'Loja 4', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Julia Azevedo', 'julia.azevedo@empresa4.com', '11900000000', 'Loja 4', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa4.com', '11966666666', 'Loja 4', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Maria Oliveira', 'maria.oliveira@empresa4.com', '11988888888', 'Loja 4', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa4.com', '11911111111', 'Loja 4', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Lucas Ferreira', 'lucas.ferreira@empresa5.com', '11933333333', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Julia Azevedo', 'julia.azevedo@empresa5.com', '11900000000', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa5.com', '11911111111', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Paula Mendes', 'paula.mendes@empresa5.com', '11999922222', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Pedro Gomes', 'pedro.gomes@empresa5.com', '11944444444', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Laura Rocha', 'laura.rocha@empresa5.com', '11922222222', 'Loja 5', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Fernanda Silva', 'fernanda.silva@empresa5.com', '11955555555', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa5.com', '11911111111', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Pedro Gomes', 'pedro.gomes@empresa5.com', '11944444444', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Lucas Ferreira', 'lucas.ferreira@empresa5.com', '11933333333', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('João Silva', 'joao.silva@empresa5.com', '11999999999', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rodrigo Oliveira', 'rodrigo.oliveira@empresa5.com', '11999933333', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa5.com', '11966666666', 'Loja 5', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa5.com', '11911111111', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Gabriel Santos', 'gabriel.santos@empresa5.com', '11999911111', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa5.com', '11966666666', 'Loja 5', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rodrigo Oliveira', 'rodrigo.oliveira@empresa5.com', '11999933333', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Pedro Gomes', 'pedro.gomes@empresa5.com', '11944444444', 'Loja 5', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa6.com', '11966666666', 'Loja 6', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Sofia Almeida', 'sofia.almeida@empresa6.com', '11999944444', 'Loja 6', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Gabriel Santos', 'gabriel.santos@empresa6.com', '11999911111', 'Loja 6', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Gabriel Santos', 'gabriel.santos@empresa6.com', '11999911111', 'Loja 6', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Thiago Pereira', 'thiago.pereira@empresa6.com', '11999955555', 'Loja 6', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa6.com', '11911111111', 'Loja 6', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Paula Mendes', 'paula.mendes@empresa6.com', '11999922222', 'Loja 6', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rodrigo Oliveira', 'rodrigo.oliveira@empresa6.com', '11999933333', 'Loja 6', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rodrigo Oliveira', 'rodrigo.oliveira@empresa6.com', '11999933333', 'Loja 6', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Carlos Souza', 'carlos.souza@empresa6.com', '11977777777', 'Loja 6', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('João Silva', 'joao.silva@empresa7.com', '11999999999', 'Loja 7', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Gabriel Santos', 'gabriel.santos@empresa7.com', '11999911111', 'Loja 7', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Lucas Ferreira', 'lucas.ferreira@empresa7.com', '11933333333', 'Loja 7', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Thiago Pereira', 'thiago.pereira@empresa7.com', '11999955555', 'Loja 7', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rodrigo Oliveira', 'rodrigo.oliveira@empresa7.com', '11999933333', 'Loja 7', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Julia Azevedo', 'julia.azevedo@empresa7.com', '11900000000', 'Loja 7', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('João Silva', 'joao.silva@empresa7.com', '11999999999', 'Loja 7', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa7.com', '11911111111', 'Loja 7', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Laura Rocha', 'laura.rocha@empresa7.com', '11922222222', 'Loja 7', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Pedro Gomes', 'pedro.gomes@empresa7.com', '11944444444', 'Loja 7', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Fernanda Silva', 'fernanda.silva@empresa7.com', '11955555555', 'Loja 7', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Carlos Souza', 'carlos.souza@empresa8.com', '11977777777', 'Loja 8', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Lucas Ferreira', 'lucas.ferreira@empresa8.com', '11933333333', 'Loja 8', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Fernanda Silva', 'fernanda.silva@empresa8.com', '11955555555', 'Loja 8', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa8.com', '11911111111', 'Loja 8', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Julia Azevedo', 'julia.azevedo@empresa8.com', '11900000000', 'Loja 8', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Paula Mendes', 'paula.mendes@empresa9.com', '11999922222', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Gabriel Santos', 'gabriel.santos@empresa9.com', '11999911111', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Gabriel Santos', 'gabriel.santos@empresa9.com', '11999911111', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Thiago Pereira', 'thiago.pereira@empresa9.com', '11999955555', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Fernanda Silva', 'fernanda.silva@empresa9.com', '11955555555', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa9.com', '11911111111', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Sofia Almeida', 'sofia.almeida@empresa9.com', '11999944444', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Gabriel Santos', 'gabriel.santos@empresa9.com', '11999911111', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Carlos Souza', 'carlos.souza@empresa9.com', '11977777777', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Fernanda Silva', 'fernanda.silva@empresa9.com', '11955555555', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa9.com', '11966666666', 'Loja 9', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Fernanda Silva', 'fernanda.silva@empresa9.com', '11955555555', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Pedro Gomes', 'pedro.gomes@empresa9.com', '11944444444', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Carlos Souza', 'carlos.souza@empresa9.com', '11977777777', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Thiago Pereira', 'thiago.pereira@empresa9.com', '11999955555', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa9.com', '11911111111', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Carlos Souza', 'carlos.souza@empresa9.com', '11977777777', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa9.com', '11911111111', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('João Silva', 'joao.silva@empresa9.com', '11999999999', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Carlos Souza', 'carlos.souza@empresa9.com', '11977777777', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Thiago Pereira', 'thiago.pereira@empresa9.com', '11999955555', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Carlos Souza', 'carlos.souza@empresa9.com', '11977777777', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Sofia Almeida', 'sofia.almeida@empresa9.com', '11999944444', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Lucas Ferreira', 'lucas.ferreira@empresa9.com', '11933333333', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa9.com', '11911111111', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Sofia Almeida', 'sofia.almeida@empresa9.com', '11999944444', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Sofia Almeida', 'sofia.almeida@empresa9.com', '11999944444', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Fernanda Silva', 'fernanda.silva@empresa9.com', '11955555555', 'Loja 9', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Pedro Gomes', 'pedro.gomes@empresa10.com', '11944444444', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rafael Lima', 'rafael.lima@empresa10.com', '11911111111', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Paula Mendes', 'paula.mendes@empresa10.com', '11999922222', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Pedro Gomes', 'pedro.gomes@empresa10.com', '11944444444', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('João Silva', 'joao.silva@empresa10.com', '11999999999', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Sofia Almeida', 'sofia.almeida@empresa10.com', '11999944444', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('João Silva', 'joao.silva@empresa10.com', '11999999999', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Maria Oliveira', 'maria.oliveira@empresa10.com', '11988888888', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Carlos Souza', 'carlos.souza@empresa10.com', '11977777777', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa10.com', '11966666666', 'Loja 10', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Thiago Pereira', 'thiago.pereira@empresa10.com', '11999955555', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa10.com', '11966666666', 'Loja 10', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Sofia Almeida', 'sofia.almeida@empresa10.com', '11999944444', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa10.com', '11966666666', 'Loja 10', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Rodrigo Oliveira', 'rodrigo.oliveira@empresa10.com', '11999933333', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa10.com', '11966666666', 'Loja 10', 'INATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Carlos Souza', 'carlos.souza@empresa10.com', '11977777777', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Lucas Ferreira', 'lucas.ferreira@empresa10.com', '11933333333', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('João Silva', 'joao.silva@empresa10.com', '11999999999', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Pedro Gomes', 'pedro.gomes@empresa10.com', '11944444444', 'Loja 10', 'ATIVO');
INSERT INTO solicitacoes (nome, email, telefone, empresa, estado) VALUES ('Ana Costa', 'ana.costa@empresa10.com', '11966666666', 'Loja 10', 'INATIVO');