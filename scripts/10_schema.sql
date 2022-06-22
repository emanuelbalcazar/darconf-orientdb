--***********************************************************
--conectarse a base de datos
--***********************************************************
connect remote:localhost/borrar root root;

--secuencia
CREATE SEQUENCE idseq TYPE ORDERED;

--clases simples
create class Home;
create property Home.address  STRING;
create property Home.country   STRING;

--clases vertex
create class Professor extends V;
create property Professor.id    LONG;
create property Professor.name  STRING;

create class Student extends V;
create property Student.name    STRING;
create property Student.address  embedded Home;

create class Course extends V;
create property Course.name  STRING;

--clases edge
create class Study extends E;
create property Study.out LINK Student;
create property Study.in  LINK Course;

create class Teach extends E;
create property Teach.out LINK Professor;
create property Teach.in  LINK Course;
