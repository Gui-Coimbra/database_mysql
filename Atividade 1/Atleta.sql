create database atleta;
use atleta;
create table tableAtleta (
idAtleta int primary key auto_increment,
nome varchar (40),
modalidade varchar (40),
qtdMedalha int
);
insert into tableAtleta values (null,'Michael Phelps', 'natação', 28),
							   (null, 'Neymar', 'futebol', 40),
                               (null, 'Messi', 'futebol', 50),
                               (null, 'Dayane dos Santos', 'ginástica', 40),
                               (null, 'Michael Jordan', 'basquete', 50);
-- exibir dados 
select * from tableAtleta;

-- exibir nome e qtd de medalhas
select nome, qtdMedalha from tableAtleta;
						
-- exibir modalidade e nome                        
select modalidade, nome from tableAtleta;

-- exibir dados dos atletas de futebol
select * from tableAtleta where modalidade = 'futebol';

-- exibir dados dos atletas que possuem mais de 40 medalhas
select * from tableAtleta where qtdMedalha > 40;

-- exibir dados dos atletas cujos IDs sejam menor ou igual a 3
select * from tableAtleta where idAtleta <= 3;

-- exibir nome dos atletas da modalidade futebol
select nome from tableAtleta where modalidade = 'futebol';

-- exibir nomes dos atletas cujos IDs sejam entre 2 e 4
select nome from tableAtleta where idAtleta between 2 and 4;

-- exibir dados dos atletas cujos IDs sejam diferentes de 3
select * from tableAtleta where idAtleta <> 3;

-- exibir dados de acordo com ordem de modalidade
select * from tableAtleta order by modalidade;

-- exibir dados de acordo com quantidade de medalhas em decrescente
select * from tableAtleta order by qtdMedalha desc;

-- exibir dados dos atletas cujos nomes começam com 'M'
select * from tableAtleta where nome like 'M%';

-- exibir dados dos atletas cujos nomes terminam com a letra R
select * from tableAtleta where nome like '%r';

-- exibir dados dos atletas cujos nomes possuem a letra S como penúltima
select * from tableAtleta where nome like '%s_';

-- alterar quantidade de medalhas de um atleta
update tableAtleta set qtdMedalha = 40 where idAtleta = 5;

-- alterando nome e medalhas de um alteta
update tableAtleta set nome = 'Lionel Messi', qtdMedalha = 40 where idAtleta = 3;

-- excluindo um atleta
delete from tableatleta where idAtleta = 1;

-- excluindo tabela
drop table tableAtleta;


