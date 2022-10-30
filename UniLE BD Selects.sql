create database Unilee;

use Unilee;

#Alunos: {Matricula, CPF_Aluno, Nome, Data_Nascimento, Email, Sexo, Numero_Contrato, CPF_Responsavel}
create table Alunos 
(
Matricula varchar(15)primary key,
CPF_Aluno char(11),
Nome_Aluno varchar(50),
Data_Nascimento varchar(10),
Email_Aluno varchar(50),
Sexo_Aluno varchar(10)
);

create table Telefone_Aluno   
(
DDD varchar(3),
Numero varchar(9),
Tipo varchar(22),
Matricula varchar(15),   
foreign key(Matricula) references Alunos(Matricula) 
);

create table Endereco_Aluno
(
#atributos do endereço
Numero varchar(20),
Rua varchar(20),
Municipio varchar(20),
CEP varchar(20),
UF varchar(20),
Complemento varchar(20),
Pais varchar(20),
Matricula varchar(15),
foreign key(Matricula) references Alunos(Matricula)
);

#Professores: {CPF_Professor, Nome, Data_Nascimento, Sexo} 
create table Professores
(
CPF_Professor char(11) primary key,
Nome_Professor varchar(50), 
Data_Nascimento varchar(10),
Sexo_Professor varchar(10)
);

create table Telefone_Professor 
(
DDD varchar(3),
Numero varchar(9),
Tipo varchar(22),
CPF_Professor char(11),   
foreign key(CPF_Professor) references Professores(CPF_Professor) 
);

create table Endereco_Professor
(
#atributos do endereço
Numero varchar(20),
Rua varchar(20),
Municipio varchar(20),
CEP varchar(20),
UF varchar(20),
Complemento varchar(20),
Pais varchar(20),
CPF_Professor Char(11),
foreign key(CPF_Professor) references Professores(CPF_Professor)
);

#Disciplinas: {Código_Disciplina, Nome_Disciplina, Carga_Horária}
create table Disciplinas 
(
Cod_Disciplina varchar(15) primary key,
Nome_Disciplina varchar(50),
Carga_Horaria varchar(10)
);

#AlunoXDisciplina: {Matricula, Código_Disciplina}
Create table AlunoXDisciplina
(
Matricula varchar(15),
foreign key (Matricula) references Alunos(Matricula), 
Cod_Disciplina varchar(15),
foreign key (Cod_Disciplina) references Disciplinas(Cod_Disciplina)
);

#ProfessorXDisciplina: {CPF_Professor,Código_Disciplina}
create table ProfessorXDisciplina
(
CPF_Professor char(11),
foreign key (CPF_Professor) references Professores(CPF_Professor), 
Cod_Disciplina varchar(15),
foreign key (Cod_Disciplina) references Disciplinas(Cod_Disciplina)
);

#Notas: {Matricula, Código_Disciplina, CPF_Professor}
create table Notas
(
Matricula varchar(15),
foreign key (Matricula) references Alunos(Matricula), 
Cod_Disciplina varchar(15),
foreign key (Cod_Disciplina) references Disciplinas(Cod_Disciplina),
CPF_Professor char(11),
foreign key (CPF_Professor) references Professores(CPF_Professor),
Nota Varchar(5)
);


###############
####INSERTS####
###############

#1.1.alunos cadastrados
insert into Alunos values ('11111','11111111111','Joao de Almeida','11/11/2000','joaoA@gmail.conn','Masculino');
insert into Alunos values ('22222','22222222222','Joao de Lara','01/10/1999','joaoL@gmail.conm','Masculino');
insert into Alunos values ('33333','33333333333','Maria de Almeida','25/09/1999','MariaAa@gmail.connm','Feminino');
insert into Alunos values ('44444','44444444444','Maria de Lara','11/05/2001','mariaLaraa@gmail.conn','Feminino');
insert into Alunos values ('55555','55555555555','Ana Bethi','19/07/1987','AnaBi@gmail.conmm','Feminino');

#1.2.professores cadastrados
insert into Professores values ('12121212121','Mariu Pontis','16/09/1980','Masculino');
insert into Professores values ('13131313131','Maria Souza','23/07/1981','Feminino');
insert into Professores values ('14141414141','Mariano Leau','01/02/1977','Masculino');
insert into Professores values ('15151515151','Marcio Brank','01/02/1975','Masculino');

#1.3.disciplinas cadastradas
insert into Disciplinas values ('D1','Gestao de Projetos','80 horas');
insert into Disciplinas values ('D2','Algoritmos de Programacao','120 horas');
insert into Disciplinas values ('D3','Sistemas Operacionais','70 horas');
insert into Disciplinas values ('D4','Desenvolvimento em Java','90 horas');
insert into Disciplinas values ('D5','Desenvolvimento em PHP','70 horas'); #disciplina extra para testes

#1.4.professor que leciona disciplinas
insert into ProfessorXDisciplina values ('12121212121','D2'); #disciplina 2 -> prof1
insert into ProfessorXDisciplina values ('12121212121','D3'); #disciplina 3 -> prof1
insert into ProfessorXDisciplina values ('13131313131','D1'); #disciplina 1 -> prof2
insert into ProfessorXDisciplina values ('15151515151','D4'); #disciplina 4 -> prof4

#1.5.alunos que cursam disciplinas
insert into AlunoXDisciplina values ('11111','D1'); #aluno1 -> disciplina 1
insert into AlunoXDisciplina values ('11111','D2'); #aluno1 -> disciplina 2
insert into AlunoXDisciplina values ('11111','D3'); #aluno1 -> disciplina 3
insert into AlunoXDisciplina values ('11111','D4'); #aluno1 -> disciplina 4
insert into AlunoXDisciplina values ('11111','D5'); #aluno1 -> disciplina 5
insert into AlunoXDisciplina values ('44444','D2'); #aluno2 -> disciplina 2
insert into AlunoXDisciplina values ('44444','D4'); #aluno2 -> disciplina 4

#1.6.notas dos alunos
insert into Notas values ('11111','D2','12121212121','9.0'); #aluno1 -> nota/disc2
insert into Notas values ('11111','D3','12121212121','10.0'); #aluno1 -> nota/disc3
insert into Notas values ('11111','D4','15151515151','8.0');  #aluno1 -> nota/disc1
insert into Notas values ('44444','D2','12121212121','9.0');  #aluno2 -> nota/disc2
insert into Notas values ('44444','D4','15151515151','7.0');  #aluno3 -> nota/disc4

###############
####SELECTS####
###############

#2. Elabore um script (select) que retorne a lista de disciplinas lecionadas por professor, ordenando por professor e por disciplina
select*from ProfessorXDisciplina 
order by CPF_Professor, Cod_Disciplina;

#3.select que apresenta as disciplinas e os alunos matriculados em cada uma
select
	Alunos.Matricula,
	Alunos.Nome_Aluno,
    Disciplinas.Cod_Disciplina,
    Disciplinas.Nome_Disciplina
	from Alunos 
    inner join AlunoXDisciplina on AlunoXDisciplina.Matricula = Alunos.Matricula
    inner join Disciplinas on AlunoXDisciplina.Cod_Disciplina = Disciplinas.Cod_Disciplina
    
    order by Alunos.Matricula;

#4.select que apresenta as notas dos alunos em suas disciplinas matriculada
select
	Alunos.Matricula,
    Alunos.Nome_Aluno,
    Disciplinas.Cod_Disciplina,
    Disciplinas.Nome_Disciplina,
    Notas.Nota
	from Alunos
    inner join Notas on Notas.Matricula = Alunos.Matricula
    inner join Disciplinas on Notas.Cod_Disciplina = Disciplinas.Cod_Disciplina;

#5.Elabore um relatório que retorne os dados dos alunos que não estão matriculados (não tem disciplina associada)
select
	Alunos.Matricula,
	Alunos.Nome_Aluno
	from Alunos 
    left join AlunoXDisciplina on AlunoXDisciplina.Matricula = Alunos.Matricula
    where AlunoXDisciplina.Matricula is NULL;

#6. Elabore um relatório de disciplinas que não possuem professor associado
select
	Professores.CPF_Professor as CPF,
    Professores.Nome_Professor as Professor,
    Professores.Data_Nascimento,
    Professores.Sexo_Professor as Sexo
	from Professores
    left join ProfessorXDisciplina on ProfessorXDisciplina.CPF_Professor = Professores.CPF_Professor
    where ProfessorXDisciplina.CPF_Professor is NULL;

#7. Elabore um relatório com as médias nas disciplinas para cada aluno
select
		Alunos.Matricula,
		Alunos.Nome_Aluno as Aluno,
        Disciplinas.Cod_Disciplina,
        Disciplinas.Nome_Disciplina as Disciplina,
		avg(Notas.Nota) as Media_Geral
		from Notas
        inner join Alunos on Notas.Matricula = Alunos.Matricula
        inner join Disciplinas on Notas.Cod_Disciplina = Disciplinas.Cod_Disciplina
        inner join professores on Notas.CPF_Professor = Professores.CPF_Professor
        
        group by
		Alunos.Matricula,
		Alunos.Nome_Aluno,
        Disciplinas.Cod_Disciplina,
        Disciplinas.Nome_Disciplina
		order by Alunos.Matricula, Disciplinas.Cod_Disciplina;
		
#8. Elabore um relatório que demonstre quais disciplinas ainda não tem nota lançada
#por aluno (atenção, leve em conta a associação entre aluno e disciplina)
select 
	Disciplinas.Cod_Disciplina,
	Disciplinas.Nome_Disciplina
	from Notas
	left join AlunosXDisciplina on Notas.Matricula = Alunos.Matricula
	left join Disciplinas on Notas.Cod_Disciplina = Disciplinas.Cod_Disciplina 
	left join professorXDisciplina on disciplinas.Cod_Disciplina = disciplinas.Cod_Disciplina 
	
    where Notas.Nota is NULL;