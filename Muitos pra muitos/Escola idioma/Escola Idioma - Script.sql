create database Escola_Idioma;
use Escola_idioma;

-- Criação de tableas 
create table Aluno (
ra INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60),
bairro VARCHAR(45)
) auto_increment = 1000;

create table Curso (
idCurso INT PRIMARY KEY AUTO_INCREMENT,
nomeCurso VARCHAR(45),
coordenador VARCHAR(45)
);

-- Criação da tabela associativa
create table AlunoCurso (
fkRa INT,
foreign key (fkRa) references Aluno(ra),
fkCurso INT,
foreign key (fkCurso) references Curso(idCurso),
dataInicio DATE,
primary key(fkRa, fkCurso, dataInicio),
nivel CHAR(2),
media DECIMAL(4,2) check (media >= 0 and media <= 10)
);

-- inserindo valores
insert into Aluno values (null, 'Maria', 'Saúde'),
						 (null, 'João', 'Consolação');
                         
insert into Curso values (null, 'Espanhol', 'Juan'),
                         (null, 'Inglês', 'Beth');
					
insert into AlunoCurso values (1000, 1, '2015-02-01', 'A1', 9.0),
							  (1000, 2, '2017-02-01', 'I3', 7.0),
                              (1001, 1, '2020-02-01', 'B1', 7.0),
                              (1001, 2, '2019-02-01', 'I2', 8.5);
                              
-- exibir dados das tabelas separadamente
select * from Aluno;
select * from Curso;
select * from AlunoCurso;

-- - Exibir os dados dos alunos e dos cursos correspondentes
select * from Aluno, Curso, AlunoCurso where fkRa = ra and fkCurso = idCurso;

-- Exibir os dados dos alunos, mas somente de um curso.
select * from Aluno, Curso, AlunoCurso where fkRa = ra and fkCurso = idCurso and idCurso = 1;

-- Exibir os dados de um aluno e os dados dos cursos desse aluno.
select * from Aluno, Curso, AlunoCurso where fkRa = ra and fkCurso = idCurso and ra = 1001;

-- Exibir a soma das médias.
select sum(media) from AlunoCurso;  
select sum(media) as SomaMedia from AlunoCurso;  
select sum(media) as 'Soma das Medias' from AlunoCurso;  

-- Exibir a média das médias.
select avg(media) as 'Média das Médias' from AlunoCurso;

-- Como fazer para a média ficar com menos casas decimais
-- existem as funções round (p/ cima) e truncate (p/ baixo)
select round(avg(media), 2) as 'Média das Médias' from AlunoCurso;
select round(avg(media), 1) as 'Média das Médias' from AlunoCurso;
select round(avg(media)) as 'Média das Médias' from AlunoCurso;

select truncate(avg(media), 2) as 'Média das Médias' from AlunoCurso;
select truncate(avg(media), 1) as 'Média das Médias' from AlunoCurso;
select truncate(avg(media), 0) as 'Média das Médias' from AlunoCurso;

-- -- Exibir a soma das médias e a média das médias.
select sum(media) as 'Soma das Médias', round(avg(media),2) as 'Média das médias' from AlunoCurso;

-- Exibir a maior e a menor média.
select max(media) as 'Maior média', min(media) as 'Menor média' from AlunoCurso;

-- Exibir a quantidade de médias acima de 8,0
select count(media) as 'Quantidade de médias acima de 8' from AlunoCurso where media > 8;

-- Exibir apenas as médias da tabela AlunoCurso.
select media from AlunoCurso;

-- Exibir as médias distintas(não repetidas) da tabela AlunoCurso.
select distinct media from AlunoCurso;

-- Exibir a quantidade de médias da tabela AlunoCurso.
select count(media) as 'Quantidade de médias' from AlunoCurso;

-- Exibir a quantidade de médias distintas da tabela AlunoCurso.
select count(distinct media) as 'Quantidade de médias' from AlunoCurso;

-- exibir a tabela AlunoCurso e uma coluna com a media mais fkCurso
select *, media + fkCurso from AlunoCurso;

-- Exibir a maior e a menor média agrupado por curso.
select fkCurso as idCurso, max(media) as 'Maior média', min(media) as 'Menor média' from AlunoCurso group by fkCurso;

-- Exibir a maior e a menor média agrupado por curso exibindo o nome do curso.
select nomeCurso as 'Nome do Curso', max(media) as 'Maior média', min(media) as 'Menor média' from Curso, AlunoCurso 
where fkCurso = idCurso group by nomeCurso;

-- Exibir a maior e a menor média agrupado por aluno.
select nome as 'Nome do Aluno', max(media) as 'Maior média', min(media) as 'Menor média' from Aluno, AlunoCurso 
where fkRa = ra group by nome;