create database exempo_check;
use exemplo_check;

-- no SQL, existem 5 restrições ou contraints:
-- 1. NOT NULL
-- 2. PRIMARY KEY
-- 3. FOREIGN KEY
-- 4. check 
-- 5. UNIQUE

CREATE TABLE FUNCIONARIO (
idFuncionario int primary key auto_increment,
nome varchar(45) not null,
cpf char(14) unique,
sexo char(1) check (sexo ='m' or sexo ='f' or sexo ='n'),
salario decimal(7,2) check (salario > 0),
-- decimal é o tipo usado para valores com casas decimais
-- no tipo acima (7,2), o 7 significa 7 digitos no total
-- e o 2 são 2 digitos após a vírgula (usamos ponto no lugar da vírgula)
-- (7,2) permitirá valores até 99999,99
avaliacao decimal(4,2) check (avaliacao >= 0 and avaliacao <= 10)
);
drop table FUNCIONARIO;
INSERT INTO FUNCIONARIO VALUES
(null, 'Ana Silva', '123.456.789-00', 'm', 1500, 8);
INSERT INTO FUNCIONARIO VALUES
(null, 'Ana Silva', '123.456.789-00', 'f', 0, 8);
INSERT INTO FUNCIONARIO VALUES
(null, 'Ana Silva', '123.456.789-00', 'f', 1500, 20);
INSERT INTO FUNCIONARIO VALUES
(null, 'Ana Silva', '123.456.789-00', 'f', 1500, 8);
INSERT INTO FUNCIONARIO VALUES
(null, 'Paulo Souza', '987.654.321-00', 'm', 3000, 8);