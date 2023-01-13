create database Musica;
use Musica;
create table tableMusica (
idMusica int primary key auto_increment,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);

insert into tableMusica values (null, 'Fear of the dark', 'Iron Maden', 'Rock'),
								(null, 'Wish you were here', 'Pink Floyd', 'Rock'),
                                (null, 'Shine on you crazy diamond', 'Pink Floyd', 'Rock'),
                                (null, 'Não existe amor em SP', 'Criolo', 'Rap'),
                                (null, 'Formula mágica da paz', 'Racionais MCs', 'Rap'),
                                (null, 'Chão de giz', 'Zé Ramalho', 'MPB'),
                                (null, 'Se', 'Djavan', 'MPB'); 
                                
select * from tableMusica;

select titulo, artista from tableMusica;

select genero, artista from tableMusica;

select * from tableMusica where genero = 'MPB';

select * from  tableMusica where artista = 'Pink floyd';

select titulo from tableMusica where genero = 'rap';

select titulo, genero from tableMusica where artista = 'zé ramalho';

select * from tableMusica where idMusica between 2 and 6;

select * from tableMusica where idMusica <= 4;

select * from tableMusica where idMusica > 3;

select * from tableMusica where idMusica <> 4 and idMusica <> 5;

select * from tableMusica order by titulo;

select * from tableMusica order by artista desc;

select * from tableMusica where titulo like 'F%';

select * from tableMusica where artista like '%o';

select * from tableMusica where genero like '_a%';

select * from tableMusica where titulo like '%i_';

update tableMusica set genero = 'MPB' where idMusica = 4;

update tableMusica set artista = 'Criolo Doido', genero = 'Rap' where idMusica = 4;

delete from tableMusica where idMusica = 6;

drop table tableMusica;