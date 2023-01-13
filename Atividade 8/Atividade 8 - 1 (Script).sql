create database AlunoProjeto;

use AlunoProjeto;

-- Criação das tabelas

create table projetos(
idProjeto int primary key not null auto_increment,
nomeProjeto varchar(30),
descricao varchar(60)
)auto_increment 101;

alter table aluno modify column celular char(14);

create table aluno(
ra int primary key auto_increment,
nome varchar(40),
celular char(11),
fkProjetos int,
foreign key (fkProjetos) references projetos(idProjeto),
fkRepresentante int,
  foreign key(fkRepresentante) references aluno(ra)
) auto_increment 1001;

CREATE TABLE acompanhantes (
    fkAluno INT,
    FOREIGN KEY (fKAluno) REFERENCES aluno (ra),
    idAcompanhante INT,
    PRIMARY KEY (fkAluno, idAcompanhante),
    nome VARCHAR(40),
    relacao VARCHAR(20)
);



insert into projetos values (null, 'Muvi', 'Sensor de Movimentos em Shopping'),
                            (null, 'Greentech', 'Estufa Inteligente'),
                            (null, 'Stroogle', 'Aumentar perfomance em nadadores olimpicos'),
                            (null, 'Pseudo', 'Sensor de umidade oral para Dentistas'),
                            (null, 'Farmatec', 'Sensor de temperatura em aviçoes biologógicos');
                            
                            
                            -- Exibir tabelas
                            select * from projetos;
                            
insert into aluno values (null, 'Guilherme Coimbra carneiro de Brito', '(11)94515-9462', 101, null),
						 (null, 'Amanda Oliveira Vieira', '(11)96854-6565', 101, 1001),
						 (null, 'Analice Soares Silva', '(11)95649-6595', 102, 1002),
						 (null, 'Carol Oliveira Arruda', '(11)95612-3259', 102, 1001),
						 (null, 'Gabriela Souza Santos', '(35)91384-6597', 103, 1001),
						 (null, 'Maria Andrade Luz', '(11)99564-2648', 103, 1002),
						 (null, 'Geovana Romero', '(92)97462-6298', 104, 1003),
						 (null, 'Leonardo Santiago', '(11)96138-9568', 104, 1002),
						 (null, 'Jhonatan Melo Rodrigues', '(11)98462-5629', 105, 1003),
						 (null, 'Fernando Alves Teixeira', '(11)96264-6594', 105, 1004);
                         
                         select * from aluno;
                         
insert into acompanhantes values (1001, 1, 'Carol Romero Brito', 'irmão'),
								 (1001, 2, 'Ingrid Ferrira', 'amiga'),
								 (1004, 3, 'Richard Santino', 'irmão'),
								 (1006, 4, 'Pedro Barros', 'pai'),
								 (1007, 5, 'Rodrigo Meloso', 'amigo'),
								 (1008, 6, 'Andressa Adeliane', 'prima'),
								 (1009, 7, 'João Alves', 'pai'),
								 (1002, 8, 'Paulo Henrique', 'pai'),
								 (1003, 9, 'Thiago Rodolfo', 'amigo');
                                 
						 select * from acompanhantes;
                         
                         -- exibir dados aluno e projetos						
                         select * from aluno, projetos where fkProjetos = idProjeto;
                         
                         -- exibir dados de alunos e seus acompanhantes
                         select * from aluno, acompanhantes where fkAluno = ra;
                         
                         -- exibir dados de alunos e seus representantes (erro)
                         select * from aluno where fkRepresentante = ra;
                         
                         -- exibir dados de alunos e seus projetos, somente de um projeto
                         select * from aluno, projetos where fkProjetos = idProjeto and nomeProjeto = 'Greentech';
                         
                         -- exibir dados de alunos, acompanhantes e projetos
                          select * from aluno, projetos, acompanhantes where fkProjetos = idProjeto and fkAluno = ra;