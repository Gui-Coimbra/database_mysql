create database sptech;
use sptech;

-- vamos criar a tabela Curso primeiro
-- pq a tabela Aluno vai referenciar a tab Curso
create table Curso (
   idCurso int primary key auto_increment,
   nome char(3),
   coordenador varchar(30)
) auto_increment = 100;

-- vamos criar a tabela Aluno, já configurando a coluna
-- de chave estrangeira dentro do create table
create table Aluno (
   ra int primary key auto_increment,
   nome varchar(40),
   bairro varchar (30),
   fkCurso int,
   foreign key(fkCurso) references Curso(idCurso)
) auto_increment=50000;

-- vamos primeiro inserir os dados dos Cursos
insert into Curso values (null, 'ADS', 'Gerson'),
					     (null, 'CCO', 'Marise'),
                         (null, 'SIS', 'Alex');

-- Exibe a tabela Curso
select * from Curso;

-- Agora vamos inserir os dados dos alunos
-- MUITO IMPORTANTE: OS VALORES INSERIDOS NA ÚLTIMA COLUNA DA TAB ALUNO
-- SÃO OS VALORES DE FKCURSO.
-- SÓ PODEMOS COLOCAR VALORES QUE JÁ EXISTEM NO IDCURSO DA TAB CURSO
insert into Aluno values (null, 'Maria', 'Tatuapé',101),
                         (null, 'João', 'Saúde', 101),
                         (null, 'Pedro', 'Paraíso', 102),
                         (null, 'Davi', 'Consolação', 100);

-- Exibe a tabela Aluno
select * from Aluno;
-- Exemplo de um insert ERRADO
-- porque não existe Curso com idCurso = 105

insert into Aluno values (null, 'Mickey', 'Disney', 105);

-- Vamos exibir os dados das 2 tabelas
-- JEITO ERRADO DE FAZER
select * from Aluno, Curso;

-- JEITO CERTO DE FAZER
-- Exibir os dados dos alunos e dos seus cursos correspondentes
select * from Aluno, Curso where fkCurso = idCurso;
 
-- Exibir os dados dos alunos e dos cursos correspondente
-- mas somente do curso de CCO
-- Na instrução abaixo, se não colocarmos Curso. antes do nome, dá um erro de ambiguidade
-- pois existe a coluna nome na tabela Aluno e existe a coluna nome na tabela Curso
-- Então precisamos dizer qual coluna queremos, colocando o nome da tabela antes e um pontinho
select * from Aluno, Curso where fkCurso = idCurso and Curso.nome = 'CCO';
                             
-- Como faz para não repetir a informação do fkCurso e idCurso?
-- Podemos nomear todas as colunas a serem exibidas, menos o fkCurso
select ra, Aluno.nome, bairro, idCurso,
       Curso.nome, coordenador from Aluno, Curso
                               where fkCurso = idCurso;
                               
-- Ou podemos pedir para exibir Aluno.* (todas as colunas da tabela Aluno)                               
select Aluno.*, Curso.nome, coordenador from Aluno, Curso
                               where fkCurso = idCurso; 
                               
-- vamos criar uma tabela Professor sem configurar a chave
-- estrangeira no create table
create table Professor (
  idProf int primary key auto_increment,
  nomeProf varchar(40),
  disciplina varchar(20)
) auto_increment = 1000;

-- Inserindo valores de professor
insert into Professor values (null, 'Marise', 'ArqComp'),
							 (null, 'Frizza', 'Algoritmos'),
                             (null, 'Yoshi', 'Algoritmos'),
                             (null, 'Vivian', 'BD');

-- Exibe os dados de Professor
select * from Professor;

-- Acrescentando a coluna fkCurso na tab Professor
alter table Professor add fkCurso int;

-- Configurando a coluna fkCurso para ser uma chave estrangeira
alter table Professor add foreign key(fkCurso) references Curso(idCurso);

-- Alterando os valores null da coluna fkCurso da tabela Professor
update Professor set fkCurso = 101 where idProf in (1000, 1001);       
update Professor set fkCurso = 102 where idProf =1002;       
update Professor set fkCurso = 100 where idProf =1003;
       
-- Exibe os dados dos professores e dos cursos correspondentes
select * from Professor, Curso where fkCurso = idCurso;

-- Exibe os dados dos alunos, cursos e professores
select * from Aluno, Curso, Professor where Aluno.fkCurso = idCurso and Professor.fkCurso = idCurso;

-- Parte nova 13/05
-- Uso do Join

-- exibir dados dos alunos e dos cursos correspondentes
select * from Aluno join curso on fkCurso = idCurso;

-- exibir os dados das tres tabelas de forma correspondente
select * from aluno join curso on aluno.fkCurso = idCurso
join professor on professor.fkCurso = idCurso;

-- evitar fazer isso, pois aumenta o risco de se perder no "on":
select * from aluno join Curso join Professor on aluno.fkCurso = idCurso
and professor.fkCurso = idCurso;

-- exibir dados dos alunos e dos cursos correspondentes mas comente um aluno
select * from Aluno join curso on fkCurso = idCurso where aluno.nome = 'Maria';  

-- exibir dados dos alunos e dos cursos correspondentes mas comente um curso
select * from Aluno join curso on fkCurso = idCurso where curso.nome = 'CCO';

-- inserção de um aluno não matriculado
insert into Aluno values (null, 'Mickey', 'Disney', null);

-- inserção de um curso sem aluno matriculado 
insert into Curso values (null, 'RDS', 'Paulo');

-- exibindo dados dos aluno, inclusive os não matriculados
select * from aluno left join curso on fkCurso = idCurso;

-- exibindo dados dos cursos, inclusive os que não possuem alunos matriculados
select * from aluno right join curso on fkCurso = idCurso;                    