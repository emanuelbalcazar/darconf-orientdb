--***********************************************************
--conectarse a base de datos
--***********************************************************
connect remote:localhost/demodb root root;
script sql
begin;

--insertando profesores
-- aplicando    select sequence('idseq').next()
--
insert into Professor set id =sequence('idseq').next(), name="Merlin";
insert into Professor set id =sequence('idseq').next(), name="Vandel";
insert into Professor set id =sequence('idseq').next(), name="Mike";


--para insertar alumnos nos conviene usar json
INSERT	INTO Student CONTENT {
        "name": "Hans Kruger", 
        "address": {
            "address":  "Chucuito 333",
            "country": "Venezuela"
            }
    };

INSERT INTO Student CONTENT {
        "name": "Helga Vykena", 
        "address": {
            "address":  "Karlin 222",
            "country": "Tailandia"
            }
    };

--insertar curso
insert into Course (name) values ("Programación 1");
insert into Course (name) values ("Energías renovables");
insert into Course (name) values ("Base de datos");

--crear relaciones entre profesores y cursos
CREATE EDGE teach FROM 
(SELECT FROM Professor WHERE name = 'Merlin') 
TO	
(SELECT FROM Course WHERE name = 'Base de datos');

CREATE EDGE teach FROM 
(SELECT FROM Professor WHERE name = 'Mike') 
TO	
(SELECT FROM Course WHERE name = 'Programación 1');

CREATE EDGE teach FROM 
(SELECT FROM Professor WHERE name = 'Vandel') 
TO	
(SELECT FROM Course WHERE name = 'Energías renovables');

--relacionar alumnos y cursos

CREATE EDGE study FROM 
(SELECT FROM Student WHERE name = 'Helga Vykena') 
TO	
(SELECT FROM Course);

CREATE EDGE study FROM 
(SELECT FROM Student WHERE name = 'Hans Kruger') 
TO	
(SELECT FROM Course where name ='Base de datos');

commit;
end
