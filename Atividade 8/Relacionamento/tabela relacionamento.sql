create database exempo_tipo_relacionamento;
use exempo_tipo_relacionamento;

create table funcionario (
idFuncionario int primary key auto_increment,
nomeFuncionario varchar(45),
salario decimal(7,2) check (salario > 0),
sexo char(1) check (sexo = 'm' or sexo = 'f' or sexo = 'n'),
-- sexo enum ('m', 'f', 'n')
fkSupervisor int,
foreign key(fkSupervisor) references Funcionario(idFuncionario)
) auto_increment = 1000;

drop database exempo_tipo_relacionamento;

-- Criação da tabela dependente e configuração dela como entidade fraca

create table Dependente(
fkFuncionario int,
foreign key(fkFuncionario) references Funcionario(idFuncionario),
idDependente int, -- não configurar aqui que é pk, nem auto_increment
primary key(fkFuncionario, idDependente),
nomeDependente varchar(45),
dataNascimento date,
tipo varchar(45)
);
 
 
 -- Inserção de dados dos funcionários
 insert into Funcionario values
       (null, 'João Nunes', 30000, 'm', null),
       (null, 'Cláudio Sousa', 20000, 'm', 1000),
       (null, 'Ana Teixeira', 18000, 'f', 1000),
       (null, 'Paulo Silva', 10000, 'm', 1001),
       (null, 'Carol Rangel', 8000, 'f', 1002);
select * from Funcionario;
insert into Dependente values
       (1000, 1, 'Joana Nunes', '1990-03-04', 'conjuge'),
       (1000, 2, 'Joaquim Nunes', '2020-07-01', 'filho'),
       (1001, 1, 'Claudia Souza', '1997-07-10', 'conjuge'),
       (1001, 2, 'Claudinha Sousa', '2015-10-09', 'filha'),
       (1002, 1, 'José Teixeira', '2000-05-03', 'conjuge');
       
       select * from Dependente;
       -- exibir dados dos funcionários e seus dependentes
       select * from Funcionario, Dependente where fkFuncionario = idFuncionario;
       
       select * from Funcionario, Dependente where fkFuncionario = idFuncionario and nomeFuncionario = 'João Nunes';
       select * from funcionario as funcionario, funcionario as supervisor where funcionario.fksupervisor = supervisor.idfuncionario;
       
       select * from funcionario as funcionario, funcionario as supervisor;