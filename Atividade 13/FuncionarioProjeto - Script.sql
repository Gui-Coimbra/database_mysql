create database Exercicio13;
use Exercicio13;
drop database Exercicio13;

create table Departamento (
idDepto int primary key,
nomeDepto VARCHAR(45),
fkGerente int,
dataInicioGer DATE
);

create table Funcionario (
idFunc int primary key,
nomeFunc VARCHAR(30),
salario decimal (7,2),
sexo char(1) check (sexo='m' or sexo='f' or sexo='n'),
fkSupervisor int,
dataNasc DATE,
fkDepto int,
foreign key (fkDepto) references Departamento(idDepto)
);

create table Projeto (
idProj int primary key,
nomeProj VARCHAR(30),
localProj VARCHAR(30),
fkDepto int,
foreign key (fkDepto) references Departamento(idDepto)
);

create table FuncProj (
fkFunc int,
foreign key (fkFunc) references Funcionario(idFunc),
fkProj int,
foreign key (fkProj) references Projeto(idProj),
horas decimal(3,1),
primary key (fkFunc, fkProj)
);

-- inserindo dados
insert into Departamento values 
(105, 'Pesquisa', 2, '2008-05-22'),
(104, 'Administração', 7, '2015-01-01'),
(101, 'Matriz', 8, '2001-06-19');

insert into Funcionario values
(1, 'Joao Silva', '3500', 'm', 2, '1985-01-09', 105),
(2, 'Fernando Wong', '4500', 'm', 8, '1975-12-08', 105),
(3, 'Alice Sousa', '2500', 'f', 7, '1988-01-19', 104),
(4, 'Janice Morais', '4300', 'f', 8, '1970-06-20', 104),
(5, 'Ronaldo Lima', '3800', 'm', 1, '1982-09-15', 105),
(6, 'Joice Leite', '2500', 'f', 1, '1992-07-31', 105),
(7, 'Antonio Pereira', '2500', 'm', 4, '1989-03-29', 104),
(8, 'Juliano Brito', '5500', 'm', NULL, '1957-11-10', 101);

insert into Projeto values 
							(1, 'Produto X', 'Santo André', 105),
							(2, 'Produto Y', 'Itu', 105),
							(3, 'Produto Z', 'São Paulo', 105),
							(10, 'Informatização', 'Mauá', 104),
							(20, 'Reorganização', 'São Paulo', 101),
							(30, 'Benefícios', 'Mauá', 104);

insert into FuncProj values (1, 1, 32.5),
							(1, 2, 7.5),
							(5, 3, 40.0),
							(6, 1, 20.0),
							(6, 2, 20.0),
							(2, 2, 10.0),
							(2, 3, 10.0),
							(2, 10, 10.0),
							(2, 20, 10.0),
							(3, 30, 30.0),
							(3, 10, 10.0),
							(7, 10, 35.0),
							(7, 30, 5.0),
							(4, 30, 20.0),
							(4, 20, 15.0),
							(8, 20, null);
                            
-- inserindo chaves estrangeiras restantes
alter table Departamento add foreign key (fkGerente)
references Funcionario (idFunc);

desc Departamento;

alter table Funcionario add foreign key (fkSupervisor)
references Funcionario (idFunc);

desc Funcionario;
                            
-- exibindo dados das tabelas                           
SELECT * FROM Departamento;
SELECT * FROM Funcionario;
SELECT * FROM Projeto;
SELECT * FROM FuncProj;

-- inserindo novos dados						
insert into Funcionario value (null, 'Cecília Ribeiro', '2800', 'f', null, '1980-04-05', 104);
insert into Funcionario value (3, 'Alice Sousa', '2800', 'f', 4, '1980-04-05', 104);
insert into Funcionario value (9, 'ecília Ribeiro', 2800, 'f', 4, '1980-04-05', 107);
insert into Funcionario value (9, 'Cecília Ribeiro', '2800', 'f', 4, '1980-04-05', 104);

-- deletando funcionarios
delete from FuncProj where fkFunc = 3 and fkProj = 10;
delete from Funcionario where idFunc = 4;
delete from Funcionario where idFunc = 2;

-- alterando dados
update Funcionario set salario = '2800' where idFunc = 3;
update Funcionario set fkDepto = 101 where idFunc= 3;
update Funcionario set fkDepto = 107 where idFunc= 3;
 
 -- exibindo informações
select dataNasc, salario from Funcionario where nomeFunc = 'Joao Silva';
select salario from Funcionario;
select distinct salario from Funcionario;
select * from Funcionario order by nomeFunc;
select * from Funcionario order by salario desc;
select * from Funcionario where salario > '2000' and salario < '4000';
select nomeFunc, salario from Funcionario where nomeFunc like 'J%';
select nomeFunc, salario from Funcionario where nomeFunc like '%a';
select nomeFunc from Funcionario where nomeFunc like '__n%';
select nomeFunc, dataNasc from Funcionario where nomeFunc like '%s____';
select * from Funcionario where fkDepto = 105;
select * from Funcionario where fkDepto = 105 and salario > '3500';
select * from Funcionario where fkDepto = 105 and nomeFunc like 'j%';
select funcionario.idFunc as 'ID do funcionario', funcionario.nomeFunc,
supervisor.idFunc as 'ID do supervisor', supervisor.nomeFunc
from Funcionario as funcionario join Funcionario as supervisor
	on funcionario.fkSupervisor = supervisor.idFunc;
select idProj, projeto.fkDepto, fkGerente, dataNasc from Projeto, departamento join funcionario
on fkGerente = idFunc where projeto.localProj = 'São Paulo';
-- ou
select idProj, projeto.fkDepto, fkGerente, dataNasc 
from Projeto join departamento on localProj = 'São Paulo' 
join funcionario on fkGerente = idFunc;

select idFunc, nomeFunc, idProj, nomeProj, horas 
from FuncProj join funcionario
on fkFunc = idFunc join projeto on idProj = fkProj;

select nomeFunc as 'Nome do funcionario' from funcionario where dataNasc > '1980-00-00';
select distinct salario from funcionario;
select distinct localProj as 'Nome dos locais distindos' from projeto;
select avg(salario) as 'Media salarial', 
sum(salario) as 'Soma dos salarios' from funcionario;
select min(salario) as 'Menor salário', max(salario)
as 'Maior salario' from funcionario;

select idDepto, nomeDepto as 'Nome do departamento', truncate(avg(salario),2) as 'Salario médio',
sum(salario) as 'Soma dos salarios' from departamento join funcionario
on fkDepto = idDepto group by nomeDepto;

select idDepto, nomeDepto as 'Nome do departamento', min(salario) as 'Menor salario ',
max(salario) as 'Maior salario' from departamento join funcionario
on fkDepto = idDepto group by nomeDepto;

insert into funcionario values
(10, 'José da Silva', '1800', 'm', 3, '2000-10-12', null),
(11, 'Benedito Almeida', '1200', 'm', 5, '2001-09-01', null);
select * from funcionario;

insert into departamento value
(110, 'RH', 3, '2018-11-10');
select * from departamento;

select nomeFunc as 'Nome do funcionario', nomeDepto as 'Nome do departamento'
from funcionario left join departamento
on fkDepto = idDepto;
select nomeFunc as 'Nome do funcionario', nomeDepto as 'Nome do departamento'
from funcionario right join departamento
on fkDepto = idDepto;