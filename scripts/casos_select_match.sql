--usando select

-- el nombre de todos los profesores que enseñan una materia
select name, out('teach') from `Professor`

-- el nombre del profesor y de todas las materias que enseña y tiene estudiantes
select name, out('teach').in('study') from `Professor`

-- el nombre del profesor y los alumnos que estan en sus materias
select name, out('teach').in('study') as alumno from `Professor`

-- el nombre del profesor y el nombre de los alumnos que estan en sus materias
select name, out('teach').in('study').name as alumno from `Professor`

--usando match
match {class:Professor, as: professor} return $elements

match {class:Professor, as: professor, where: (name='Mike')} return $elements

match {class:Professor, as: professor, where: (name='Merlin')}.out('teach'){as: course} return $elements

match {class:Professor, as: professor, where: (name='Merlin')}.out('teach').in('study'){as: student} return $elements

--ahora agregamos $elements
match {class:Professor, as: professor, where: (name='Merlin')}.out('teach').in('study'){as: student} return $elements

--ahora agregamos $pathelements
match {class:Professor, as: professor, where: (name='Merlin')}.out('teach').in('study'){as: student} return $pathelements

-- las materias que dicta merlin, los alumnos inscriptos y ademas que otras materias cursa ese alumno
match {class:Professor, as: professor, where: (name='Merlin')}.out('teach').in('study'){as: student}.out('study') return $pathelements

-- Helga y Hans se conocen?
match {class:Student, as: student, where: (name='Helga Vykena')}.out('study').in('study'){as: friend, where: (name='Hans Kruger')} return $pathelements
