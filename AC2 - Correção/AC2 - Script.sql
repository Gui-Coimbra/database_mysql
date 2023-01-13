create database Editora;
use Editora;
drop database Editora;

create table Editora (
idEditora int primary key auto_increment,
nomeEditora VARCHAR(45),
dataCriacao date,
pais VARCHAR(45),
fkEditoraFilha int,
foreign key (fkEditoraFilha) references Editora(idEditora)
) auto_increment = 10;

create table Escritor (
idEscritor int primary key auto_increment,
nomeEscritor VARCHAR(45),
sexo CHAR(1) check(sexo='m' or sexo='f' or sexo='n'),
telefone1 CHAR(11),
telefone2 CHAR(11),
rua VARCHAR(45),
bairro VARCHAR(45),
fkEditora int,
foreign key (fkEditora) references Editora(idEditora)
) auto_increment = 100; 

create table Livro (
idLivro int primary key,
nomeLivro VARCHAR(45),
valor DECIMAL(4,2),
fkEscritor int,
fkEditora int,
foreign key (fkEscritor) references Escritor(idEscritor),
foreign key (fkEditora) references Editora(idEditora)
);

insert into Editora values (null, 'Martin Fontes', '1980-02-23', 'Inglaterra', null),
						   (null, 'L&PM', '1982-05-15', 'Inglaterra', 10),
                           (null, 'Companhia das Letras', '1970-03-25', 'Brasil', null),
                           (null, 'Pinguim', '1960-05-27', 'Brasil', 12),
                           (null, 'Zahar', '1995-08-23', 'Estados Unidos', 11);
                           
insert into Escritor values (null, 'J. R. Tolkien', 'm', '11954621565', '11964826452', 'Rua Inglesa', 'Stone', 10), 
						    (null, 'Machado de Assis', 'm', '11956426516', '11956482354', 'Rua Ronaldo', 'Pedreira', 12),
                            (null, 'Guimarães Rosa', 'm', '11946823597', '11945263985', 'Rua Figueira', 'Rosas', 13),
                            (null, 'J. K. Rowling', 'f', '11946875426', '11965234587', 'Rua da Magia', 'Trouxas', 14),
                            (null, 'Agatha Cristie', 'f', '11956483269', '11976485264', 'Rua do Mistério', 'Susto', 11);
                            
insert into Livro values ('1000', 'Senhor dos Anéis', '50.99', '100', '10'),
						 ('1001', 'Brás Cubas', '45.99', '101', '12'),
                         ('1002', 'Campo Geral', '30.00', '102', '13'),
                         ('1003', 'Harry Potter', '70.00', '103', '14'),
                         ('1004', 'Vale do Escuro', '50.00', '104', '11');
                         
alter table Escritor modify rua VARCHAR(40);

select * from Editora;
select * from Escritor;
select * from Livro;

update Editora set nomeEditora = 'L&PM Pocket' where idEditora = 11;

select * from Escritor, livro where fkEscritor = idEscritor;

select * from Escritor, Livro where fkEscritor = idEscritor and nomeEscritor like '%w%';

select nomeEditora, nomeEscritor, pais from Escritor, Editora where fkEditora = idEditora;

select * from Editora, Escritor where fkEditora = idEditora and sexo = 'f';	

select * from Editora, Escritor, livro where fkEscritor = idEscritor and Escritor.fkEditora = idEditora;	

select * from Editora, Escritor, livro where fkEscritor = idEscritor and Escritor.fkEditora = idEditora
and NomeEditora like '%a%';

-- 13- Exibir os dados do relacionamento recursivo, de forma correspondente.
select * from Editora as Editora, Editora as EditoraFilha
where Editora.fkEditoraFilha = EditoraFilha.idEditora;

-- 14- Exibir os dados do relacionamento recursivo, de forma correspondente, com uma condição.
select * from Editora as Editora, Editora as EditoraFilha
where Editora.fkEditoraFilha = EditoraFilha.idEditora and Editora.nomeEditora like '%a%';

-- 15- Exibir os dados de 2 tabelas e os dados do relacionamento recursivo, de forma correspondente.
select * from Escritor, Editora as Editora, Editora as EditoraFilha
where Editora.fkEditoraFilha = EditoraFilha.idEditora and Escritor.fkEditora = Editora.idEditora;

-- 16- Exibir os dados de 2 tabelas e os dados do relacionamento recursivo, de forma correspondente, com uma condição.
select * from Escritor, Editora as Editora, Editora as EditoraFilha
where Editora.fkEditoraFilha = EditoraFilha.idEditora and
Escritor.fkEditora = Editora.idEditora and nomeEscritor like 'j%';

delete from Livro where idLivro = 1004;
select * from Livro;