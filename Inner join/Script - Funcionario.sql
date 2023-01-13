create database exemplo_tipo_relacionamento;
use exemplo_tipo_relacionamento;

-- Criação da tab Funcionario, já com a fkSupervisor
-- Configuração do relacionamento recursivo
create table Funcionario (
  idFuncionario int primary key auto_increment,
  nomeFuncionario varchar(45),
  salario decimal(7,2) check (salario > 0),
  sexo char(1) check (sexo = 'm' or sexo = 'f' or sexo = 'n'),
     -- em versões do MySQL Server anteriores a 8.0.16, utilize:
     -- sexo enum('m','f','n')
  fkSupervisor int,
  foreign key(fkSupervisor) references Funcionario(idFuncionario)
) auto_increment = 1000;

-- Criação da tabela Dependente e configuração dela como uma
-- entidade fraca
create table Dependente(
  fkFuncionario int,
  foreign key(fkFuncionario) references Funcionario(idFuncionario),
  idDependente int,  -- NÃO CONFIGURAR AQUI QUE É PK, NEM AUTO_INCREMENT
  primary key(fkFuncionario, idDependente),  -- configuração da chave primária composta
  nomeDependente varchar(45),
  dataNascimento date,
  tipo varchar(45)
);

-- Inserção de dados dos funcionários
insert into Funcionario values
     (null, 'João Nunes', 30000, 'm', null),
     (null, 'Cláudio Sousa', 20000, 'm', 1000),
     (null, 'Ana Teixeira', 18000, 'f', 1000),
     (null, 'Paulo Silva', 10000, 'm', 1001),
     (null, 'Carol Rangel', 8000, 'f', 1002);
     
-- Exibir dados da tabela Funcionario     
select * from Funcionario;

-- Inserir dados dos dependentes
-- O 2o campo é o idDependente e seu valor inicia em 1 para cada fkFuncionario diferente
insert into Dependente values
     (1000, 1, 'Joana Nunes', '1990-03-04', 'conjuge'),
     (1000, 2, 'Joaquim Nunes', '2020-07-01', 'filho'),
     (1001, 1, 'Cláudia Sousa', '1997-08-10', 'conjuge'),
     (1001, 2, 'Claudete Sousa', '2015-10-09', 'filha'),
     (1002, 1, 'José Teixeira', '2000-05-03', 'conjuge');
     
-- Exibir os dados dos dependentes     
select * from Dependente;

-- Exibir os dados dos funcionários e dos seus dependentes
select * from Funcionario,Dependente where fkFuncionario = idFuncionario;

-- Exibir os dados dos funcionários e dos seus dependentes, mas somente de um funcionario
select * from Funcionario,Dependente where fkFuncionario = idFuncionario
        and nomeFuncionario = 'João Nunes';
        
-- Exibir os dados dos funcionários e dos seus supervisores        
SELECT * FROM Funcionario AS funcionario, Funcionario AS supervisor  
	WHERE funcionario.fkSupervisor = supervisor.idFuncionario;
    
-- Exibir os dados dos funcionários e dos seus supervisores, mas somente de um supervisor       
SELECT * FROM Funcionario AS funcionario, Funcionario AS supervisor  
	WHERE funcionario.fkSupervisor = supervisor.idFuncionario and supervisor.nomeFuncionario = 'João Nunes';

-- Exibir os dados dos funcionários, dos seus supervisores e dos dependentes dos funcionários    
SELECT * FROM FUNCIONARIO AS FUNCIONARIO, 
              FUNCIONARIO AS SUPERVISOR,
              DEPENDENTE  
	WHERE FUNCIONARIO.FKSUPERVISOR = SUPERVISOR.IDFUNCIONARIO
    AND FKFUNCIONARIO= FUNCIONARIO.IDFUNCIONARIO;

-- Exibir os dados dos funcionários, dos seus supervisores e dos dependentes dos supervisores    
SELECT * FROM FUNCIONARIO AS FUNCIONARIO, 
              FUNCIONARIO AS SUPERVISOR,
              DEPENDENTE  
	WHERE FUNCIONARIO.FKSUPERVISOR = SUPERVISOR.IDFUNCIONARIO
    AND FKFUNCIONARIO= SUPERVISOR.IDFUNCIONARIO;

-- Exibir os dados dos funcionários e dos seus supervisores (usando apenas uma letra para apelidar as tabelas)
SELECT * FROM FUNCIONARIO AS F, FUNCIONARIO AS S  
	WHERE F.FKSUPERVISOR = S.IDFUNCIONARIO;
    
-- parque nova (com join) - 13/05

-- exibir os dados dos funcionários e dos seus dependentes
select * from funcionario join dependente on fkFuncionario = idFuncionario;

-- exibir os dados dos funcionários e dos seus dependentes
-- de forma que apareça também os funcionários que não tem dependentes
select * from funcionario left join dependente on fkFuncionario = idFuncionario;

-- exibir os dados dos seus funcionarios e dos seus supervisores
SELECT * FROM Funcionario AS funcionario join Funcionario AS supervisor  
	on funcionario.fkSupervisor = supervisor.idFuncionario;

-- exibir os dados dos seus funcionarios e dos seus supervisores
-- mesmo os funcionarios que não tem supervisores
SELECT * FROM Funcionario AS funcionario left join Funcionario AS supervisor  
	on funcionario.fkSupervisor = supervisor.idFuncionario;
    
    SELECT * FROM Funcionario AS funcionario right join Funcionario AS supervisor  
	on funcionario.fkSupervisor = supervisor.idFuncionario;
    
    -- exibir os dados dos funcionarios, dos seus supervisores e dos seus dependentes
    SELECT * FROM Funcionario AS funcionario join Funcionario AS supervisor  
	on funcionario.fkSupervisor = supervisor.idFuncionario
    join dependente on dependente.fkFuncionario = funcionario.idFuncionario;
    
    SELECT * FROM Funcionario AS funcionario join Funcionario AS supervisor  
	on funcionario.fkSupervisor = supervisor.idFuncionario
    left join dependente on dependente.fkFuncionario = funcionario.idFuncionario;
    
    SELECT * FROM Funcionario AS funcionario left join Funcionario AS supervisor  
	on funcionario.fkSupervisor = supervisor.idFuncionario
    left join dependente on dependente.fkFuncionario = funcionario.idFuncionario;