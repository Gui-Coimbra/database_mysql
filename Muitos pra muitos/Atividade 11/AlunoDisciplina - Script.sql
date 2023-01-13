create database AlunoDisciplina;
use AlunoDisciplina;

create table Aluno (
ra INT PRIMARY KEY AUTO_INCREMENT,
nomeAluno VARCHAR(45),
bairro VARCHAR(45)
) auto_increment = 10;

create table Disciplina (
idDisciplina int primary key auto_increment,
nomeDisciplina VARCHAR(45)
);

create table AlunoDisciplina (
fkAluno int,
foreign key (fkAluno) references Aluno(ra),
fkDisciplina int,
foreign key (fkDisciplina) references Disciplina(idDisciplina),
dataInicio DATE,
primary key (fkAluno, fkDisciplina, dataInicio),
media DECIMAL(4,2) check (media >= 0 and media <= 10),
faltas INT
);

insert into Aluno values (null, 'Guilherme', 'São Luis'),
						 (null, 'Ivan', 'Vila Andrade');
                         
insert into Disciplina values (null, 'CCO'),
							  (null, 'ADS');
                              
insert into AlunoDisciplina values (10, 1, '2015-02-01', 9.0, 3),
							       (10, 2, '2017-02-01', 7.0, 2),
                                   (11, 1, '2019-02-01', 7.0, 5),
                                   (11, 2, '2020-02-01', 8.5, 4);
                                   
-- Exibir os dados de cada tabela separadamente.
select * from Aluno;
select * from Disciplina;
select * from AlunoDisciplina;   

-- Exibir os dados dos alunos e das disciplinas correspondentes.
select * from Aluno, Disciplina, AlunoDisciplina
where fkAluno = ra and fkDisciplina = idDisciplina;   

-- Exibir os dados dos alunos e das suas disciplinas, mas somente de uma disciplina.
select * from Aluno, Disciplina, AlunoDisciplina
where fkAluno = ra and fkDisciplina = idDisciplina and idDisciplina = 1;

-- Exibir os dados de um aluno e os dados das disciplinas desse aluno.
select * from Aluno, Disciplina, AlunoDisciplina
where fkAluno = ra and fkDisciplina = idDisciplina and ra = 10;

-- Exibir a soma das médias e a soma das quantidades de faltas.
select sum(media) as 'Soma das médias', sum(faltas) as 'soma de faltas' 
from AlunoDisciplina;

-- Exibir a média das médias e a média das quantidades de faltas.
select truncate(avg(media),1) as 'Média das médias', truncate(avg(faltas),1)
as 'Média das quantidades de faltas' from AlunoDisciplina;

-- Exibir a maior e a menor média.
select truncate(max(media),1) as 'Maior média', truncate(min(media),1)
as 'Menor média' from AlunoDisciplina;

-- Exibir a maior e a menor quantidade de faltas.
select max(faltas) as 'Maior quantidade de faltas', min(faltas)
as 'Menor quantidade de faltas' from AlunoDisciplina;

-- Exibir a contagem de quantidades de faltas acima de 3.
select count(faltas) as 'quantidades de faltas acima de 3'
from AlunoDisciplina where faltas > 3;

-- Exibir a maior e a menor média agrupado por disciplina.
select nomeDisciplina as 'Nome da Disciplina', truncate(max(media),1) as 'Maior média', truncate(min(media),1)
as 'Menor média' from Disciplina, AlunoDisciplina where fkDisciplina = idDisciplina group by nomeDisciplina;

-- Exibir a maior e a menor média agrupado por aluno.
select nomeAluno as 'Nome do aluno', truncate(max(media),1) as 'Maior média', truncate(min(media),1)
as 'Menor média' from Aluno, AlunoDisciplina where fkAluno = ra group by nomeAluno;

-- Exibir a maior e a menor quantidade de faltas agrupado por disciplina.
select nomeDisciplina as 'Nome da Disciplina', max(faltas) as 'Maior quantidade de faltas', min(faltas)
as 'Menor quantidade de faltas' from Disciplina, AlunoDisciplina where fkDisciplina = idDisciplina group by nomeDisciplina;

-- Exibir a maior e a menor quantidade de faltas agrupado por aluno.
select nomeAluno as 'Nome do aluno', max(faltas) as 'Maior quantidade de faltas', min(faltas)
as 'Menor quantidade de faltas' from Aluno, AlunoDisciplina where fkAluno = ra group by nomeAluno;

-- Exibir apenas as médias da tabela AlunoDisciplina.
select media from AlunoDisciplina;

-- Exibir as médias distintas da tabela AlunoDisciplina.
select distinct media from AlunoDisciplina;

-- Exibir a quantidade de médias da tabela AlunoDisciplina.
select count(media) from AlunoDisciplina;

-- Exibir a quantidade de médias distintas da tabela AlunoDisciplina.
select count(distinct media) from AlunoDisciplina;