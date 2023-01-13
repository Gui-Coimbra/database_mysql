create database PraticaJogador;

use PraticaJogador;

-- Criação das tabelas
create table timeF (
idTimeF int primary key auto_increment,
nomeTimeF varchar(40) not null,
nomeTecnico varchar(40) not null,
dataCriacao date
)auto_increment = 101;

alter table TimeF 

create table jogador (
idJogador int primary key auto_increment,
nomeJogador varchar(40) not null,
posicao varchar (20) not null,
salario decimal(7,2) not null,
fkTimeF INT,
foreign key (fkTimeF) references timeF (idTimeF),
fkNovato int,
foreign key (fkNovato) references jogador (idJogador)
) auto_increment 1001;

create table seguidor (
idSeguidor int primary key auto_increment,
fkJogador int,
foreign key (fkJogador) references jogador (idJogador),
nomeSeguidor varchar(40) not null,
nickname varchar(45) unique,
sexo char(1) check(sexo='m' or sexo='f' or sexo='n')
) auto_increment 11;

-- Inserindo valores

insert into timeF values (null, 'Chelsea', 'Tutzel', '1978-05-13'),
                         (null, 'Santos', 'Dunga', '1965-08-25'),
                         (null, 'Real Madrid', 'Zidane', '1975-06-27'),
                         (null, 'São Paulo', 'Rogério', '1980-07-20'),
                         (null, 'Roma', 'Mitchellini', '1982-09-28');

                         select * from timeF;

insert into jogador values 
                           (null, 'Mbappe', 'Atacante', '9000.00', '102', null),
                           (null, 'Neymar', 'Atacante', '45000.00', '102', '1001'),
                           (null, 'Rodrigo', 'Meio-campo', '5000.00', '103', null),
                           (null, 'Casemiro', 'Meio-Campo', '30000.00', '103', '1003'),
                           (null, 'Danilo', 'Lateral', '5000.00', '101', null),
                           (null, 'Thiago Silva', 'Zagueiro', '30000.00', '101', '1005');
                           
                           select * from jogador;

insert into seguidor values
						   (null, '1001', 'Amadeu', 'Silva', 'm'),
                           (null, '1002', 'Jhony', 'Amaral', 'm'),
                           (null, '1002', 'Dayane', 'Santos', 'f'),
                           (null, '1003', 'Graziela', 'Oliveira', 'f'),
                           (null, '1003', 'Leandro', 'Soares', 'n'),
                           (null, '1004', 'Diego', 'Bezerra', 'm');
                           
                           select * from seguidor;
                           
                           -- exibir nome do time e do tecnico dos times que começam com S
                           select nomeTimef, nomeTecnico from timeF where nomeTimeF like 'S%'; 
                           
                           -- exibir dados dos jogadores em ordem decrescente de acordo com suas posições
                           select * from jogador order by posicao desc;
                           
                           select * from jogador where posicao = 'atacante';
                           
                           select * from timeF where nomeTecnico like '%a__';
                           
                           select * from timeF order by nomeTecnico;
                           
                           select * from timeF order by dataCriacao desc;
                           
                           update jogador set posicao = 'lateral' where idJogador = '5';
                           
                           select * from jogador, timeF where fkTimeF = idTimeF;
                           
                           select * from timeF where nomeTimeF = 'Real Madrid';
                           
                           -- erro
                           select * from jogador where fkNovato = idJogador;
                           
                           -- erro
                           select * from jogador, timeF where fkNovato = idJogador and fkTimef = idTimeF;
                           
                           -- erro
                           select * from jogador, timeF where nomeJogador = 'Neymar' and fkTimeF = idTimef and fkNovato = idJogador;
                           
                           select * from jogador, seguidor where fkJogador = idJogador;
                           
                           select * from jogador, seguidor where nomeJogador = 'Mbappe' and fkJogador = idJogador;
                           
                           delete from jogador where idJogador = '1006';
                           
                           drop table timeF, jogador, seguidor;