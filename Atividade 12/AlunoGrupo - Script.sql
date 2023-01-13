create database AlunoGrupo;
use ALunoGrupo;
drop database AlunoGrupo;

create table Grupo (
idGrupo int primary key auto_increment,
nomeGrupo VARCHAR(45),
descProjeto VARCHAR(45)
) auto_increment = 1;

create table Aluno (
ra int primary key,
nomeAluno VARCHAR(45),
email VARCHAR(45),
fkGrupo int,
foreign key (fkGrupo) references Grupo(idGrupo) 
);

Create table Professor (
idProfessor int primary key auto_increment,
nomeProfessor VARCHAR(45),
disciplina VARCHAR(45)
) auto_increment = 100;

create table ProfessorGrupo (
fkProfessor int,
foreign key (fkProfessor) references Professor(idProfessor),
fkGrupo int,
foreign key (fkGrupo) references Grupo(idGrupo),
dataApresentacao DATE,
primary key (fkProfessor, fkGrupo, dataApresentacao),
horarioInicio VARCHAR(45),
nota DECIMAL (2,1)
);

insert into Grupo values (null, 'Lux', 'Monitoramento de luz em shoppings'),
						 (null, 'Greentec', 'Estufas inteligentes para tomate');
                         
insert into Aluno values (1000, 'Guilherme', 'guilherme@email.com', 1), 
						 (1001, 'Ivan', 'ivan@email.com', 2), 
                         (1002, 'Maria', 'maria@email.com', 2), 
                         (1003, 'Pamela', 'pamela@email.com', 1);
                         
insert into Professor values (null, 'Brandao', 'Pesquisa e inovação'),
							 (null, 'Celia', 'Banco de dados');
                             
insert into ProfessorGrupo values (100, 1, '2022-04-25', '9:30AM', '7.5'),
								  (101, 2, '2022-04-24', '9:00AM', '8'), 
                                  (100, 2, '2022-04-25', '9:30AM', '7');
                                  
select * from Grupo;
select * from Aluno;
select * from Professor;
select * from ProfessorGrupo;

select * from Grupo, Aluno where fkGrupo = idGrupo;

select * from Grupo, Aluno where fkGrupo = idGrupo and idGrupo = 1;

select truncate(avg(nota),1) as 'Média das notas' from ProfessorGrupo;

select max(nota) as 'Maior nota', min(nota) as 'Menor nota' from ProfessorGrupo;

select sum(nota) as 'Soma das notas' from ProfessorGrupo;

-- 10. Exibir os dados dos professores que avaliaram cada grupo, os dados dos grupos, a data e o horário da apresentação. 
select * from professor, grupo, professorgrupo where fkGrupo = idGrupo and fkProfessor = idProfessor;     

-- 11. Exibir os dados dos professores que avaliaram um determinado grupo, os dados do grupo, a data e o horário da apresentação.
select * from professor, grupo, professorgrupo
where fkGrupo = idGrupo and fkProfessor = idProfessor and idGrupo = 2;

-- 12. Exibir os nomes dos grupos que foram avaliados por um determinado professor.
select nomeGrupo as 'Nome do grupo', nomeProfessor as 'Nome do professor' from Grupo, Professor, ProfessorGrupo
where fkGrupo = idGrupo and fkProfessor = idProfessor and idProfessor = 100 group by nomeGrupo, nomeProfessor;

-- 13. Exibir os dados dos grupos, os dados dos alunos correspondentes, os dados dos 
-- professores que avaliaram, a data e o horário da apresentação.
select * from Grupo, Aluno, Professor, ProfessorGrupo where Aluno.fkGrupo = idGrupo and
ProfessorGrupo.fkGrupo = idGrupo and fkProfessor = idProfessor;

select count(distinct nota) as 'Quantidade de notas distintas' from ProfessorGrupo;                   

-- 15. Exibir a identificação do professor (pode ser o fk ou o nome), a média das notas e a soma 
-- das notas atribuídas, agrupadas por professor.
select nomeProfessor as 'Nome do professor', truncate(avg(nota),1) as 'Média das notas',
sum(nota) as 'Soma das notas' from professor, professorgrupo where fkProfessor = idProfessor 
and idProfessor = 101 group by nomeProfessor;

-- 16. Exibir a identificação do grupo (pode ser o fk ou o nome), a média das notas e a soma das 
-- notas atribuídas, agrupadas por grupo.
select nomeGrupo as 'Nome do grupo', truncate(avg(nota),1) as 'Média das notas',
sum(nota) as 'Soma das notas' from Grupo, professorgrupo where fkGrupo = idGrupo
and idGrupo = 1 group by nomeGrupo;

-- 17. Exibir a identificação do professor (pode ser o fk ou o nome), a menor nota e a maior nota 
-- atribuída, agrupada por professor.
select nomeProfessor as 'Nome do professor', max(nota) as 'Maior nota',
min(nota) as 'Menor nota' from professor, professorgrupo where fkProfessor = idProfessor 
and idProfessor = 100 group by nomeProfessor;

-- 18. Exibir a identificação do grupo (pode ser o fk ou o nome), a menor nota e a maior nota 
-- atribuída, agrupada por grupo.
select nomeGrupo as 'Nome do grupo', max(nota) as 'Maior nota',
min(nota) as 'Menor nota' from Grupo, professorgrupo where fkGrupo = idGrupo
and idGrupo = 2 group by nomeGrupo;