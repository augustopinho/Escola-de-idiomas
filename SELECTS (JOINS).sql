SELECT alunos.num_matricula AS IdAluno,
alunos.nome_alunos AS NomeAluno,
avaliacao.nota_final AS Notas,
frequencia.presença AS Frequência,
professor.nome_professor AS NomeProfessor,
turma.nome_turma AS Turma
FROM alunos JOIN avaliacao ON (alunos.num_matricula = avaliacao.num_matricula)
            JOIN frequencia ON (avaliacao.num_matricula = frequencia.num_matricula)
			JOIN professor ON (frequencia.id_professor = professor.id_professor)
			JOIN turma ON (professor.id_professor = turma.id_turma);
			 
SELECT professor.nome_professor AS NomeProfessor,
turma.nome_turma AS Turma,
AVG(avaliacao.nota_final) AS Media
FROM professor JOIN turma ON (professor.id_professor = turma.id_professor)
	           JOIN avaliacao ON (turma.id_professor = avaliacao.id_professor);

SELECT UPPER(curso.tipo_idioma ||' '|| curso.nivel_curso) AS Curso,
COUNT(avaliacao.num_matricula) AS TotalAlunos
FROM curso JOIN avaliacao ON (curso.id_curso = avaliacao.id_curso)
GROUP BY curso.tipo_idioma, curso.nivel_curso;

SELECT professor.nome_professor AS Professor,
turma.nome_turma AS Turma,
aula.horario_aula AS Horario
FROM professor JOIN turma ON (professor.id_professor = turma.id_professor)
	           JOIN aula ON (turma.id_professor = aula.id_professor);