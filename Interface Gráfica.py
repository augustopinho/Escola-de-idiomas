import PySimpleGUI as sg
import psycopg2

def cad_alunos():

    def limpar():
        window['-NUMERO MATRICULA-'].update('')
        window['-NOME-'].update('')
        window['-EMAIL-'].update('')
        window['-RESIDENCIAL-'].update(False)
        window['-CELULAR-'].update(False)
        window['-COMERCIAL-'].update(False)
        window['-NUMERO TELEFONE-'].update('')
        window['-CPF-'].update('')
        window['-DATA NASCIMENTO-'].update('')
        window['-M-'].update(False)
        window['-F-'].update(False)

    con = psycopg2.connect(host="localhost", database="BD_PI", user="postgres", password="Bruno1997legal")

    with con:
        with con.cursor() as cursor:
            cursor.execute("""CREATE TABLE IF NOT EXISTS alunos(
            Num_matricula SERIAL PRIMARY KEY,
            Nome_alunos VARCHAR(40) NOT NULL,
            Email_alunos VARCHAR(50) NOT NULL,
            Tipo_telefone_alunos VARCHAR(20) NOT NULL CHECK (Tipo_telefone_alunos IN ('RESIDENCIAL','CELULAR', 'COMERCIAL')),
            Telefone_alunos NUMERIC(11) NOT NULL,
            CPF_alunos NUMERIC(11) NOT NULL UNIQUE,
            Dt_nascimento_alunos DATE NOT NULL,
            Sexo_alunos CHAR(1) NOT NULL CHECK(Sexo_alunos IN( 'M', 'F' )),
            Id_endereco INTEGER NOT NULL,
            FOREIGN KEY(Id_endereco) REFERENCES endereco(Id_endereco) ON DELETE CASCADE ON UPDATE CASCADE);""")

    layout = [

    [
    sg.Text("N° Matrícula:", size = (10,1)),
    sg.Input(size= (6,1), key = "-NUMERO MATRICULA-"),
    sg.Text("(Só para fins de consulta)", size = (23,1))    
    ],
    
    
    [
    sg.Text("Digite aqui os dados da pessoa que está sendo cadastrada:", size=(45,1))
    ],

    [
    sg.Text("Nome:", size=(5,1)), 
    sg.Input(size=(50,1), key="-NOME-")
    ],

    [
    sg.Text("Email:", size=(5,1)), 
    sg.Input(size=(50,1), key="-EMAIL-")
    ],

    [
    sg.Text("Tipo de telefone:", size = (13,1)), 
    sg.Checkbox("Residencial", default=False, key="-RESIDENCIAL-"), 
    sg.Checkbox("Celular", default=False, key ="-CELULAR-"), 
    sg.Checkbox("Comercial", default=False, key="-COMERCIAL-")
    ],

    [
    sg.Text("Numero de telefone:", size=(16,1)), 
    sg.Input(size=(37,1), key="-NUMERO TELEFONE-")
    ],

    [
    sg.Text("CPF:", size=(3,1)),
    sg.Input(size=(52,1), key = "-CPF-")
    ],

    [
    sg.Text("Data nascimento:", size=(14,1)), 
    sg.Input(size=(39,1), key= "-DATA NASCIMENTO-")
    ],

    [
    sg.Text("Sexo:", size=(4,1)),
    sg.Checkbox("Masculino", default=False, key="-M-"), 
    sg.Checkbox("Feminino", default=False, key="-F-")
    ],
                
    [
    sg.Button("Inserir", size=(8, 1), key = "-INSERIR-"),
    sg.Button("Limpar", size=(8, 1), key = "-LIMPAR-"),
    sg.Button("Consulta", size = (8,1), key ="-CONSULTA-"),
    sg.Button("Excluir", size=(8, 1), key = "-EXCLUIR-"),
    sg.Button("Atualizar", size =(8,1), key = "-ATUALIZAR-")
    ],

    [
    sg.Button("Finalizar Cadastro!", size=(16,1), key = "-FINALIZAR-")    
    ]
    ]

    window = sg.Window("Cadastro de Alunos", layout, use_default_focus = False)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break

        elif event == "-LIMPAR-":
            limpar()

        elif event == "-INSERIR-":
            with con:
                with con.cursor() as cursor:
                    cursor.execute("INSERT INTO alunos (Nome_alunos, Email_alunos, Tipo_telefone_alunos, Telefone_alunos, CPF_alunos, Dt_nascimento_alunos, Sexo_alunos, Id_endereco) VALUES (%s, %s, %s, %s, %s, %s, %s, (SELECT Id_endereco FROM endereco ORDER BY Id_endereco DESC LIMIT 1));",
                    (values['-NOME-'], values['-EMAIL-'], ('RESIDENCIAL' if values['-RESIDENCIAL-'] else 'COMERCIAL' if values['-COMERCIAL-'] else 'CELULAR'), values["-NUMERO TELEFONE-"], values['-CPF-'], values['-DATA NASCIMENTO-'], ('M' if values['-M-'] else 'F')))
            limpar()
        
        elif event == "-FINALIZAR-":
            window.close()
            main()

    window.close()

    con.commit()

    cursor.close()
    con.close()

def cad_professor():

    def limpar():
        window['-ID PROFESSOR-'].update('')
        window['-NOME-'].update('')
        window['-EMAIL-'].update('')
        window['-RESIDENCIAL-'].update(False)
        window['-CELULAR-'].update(False)
        window['-COMERCIAL-'].update(False)
        window['-NUMERO TELEFONE-'].update('')
        window['-CPF-'].update('')
        window['-DATA NASCIMENTO-'].update('')
        window['-M-'].update(False)
        window['-F-'].update(False)
        window['-FORMACAO-'].update('')

    con = psycopg2.connect(host="localhost", database="BD_PI", user="postgres", password="Bruno1997legal")

    with con:
        with con.cursor() as cursor:
            cursor.execute("""CREATE TABLE IF NOT EXISTS professor(
            Id_professor SERIAL PRIMARY KEY,
            Nome_professor VARCHAR(40) NOT NULL,
            Email_professor VARCHAR(50) NOT NULL,
            Tipo_telefone_professor VARCHAR(20) NOT NULL CHECK (Tipo_telefone_professor IN ('RESIDENCIAL','CELULAR', 'COMERCIAL')),
            Telefone_professor NUMERIC(11) NOT NULL,
            CPF_professor NUMERIC(11) NOT NULL UNIQUE,
            Dt_nascimento_professor DATE NOT NULL,
            Sexo_professor CHAR(1) NOT NULL CHECK(Sexo_professor IN( 'M', 'F' )),
            Formacao_professor VARCHAR(60),
            Id_endereco INTEGER NOT NULL,
            FOREIGN KEY(Id_endereco) REFERENCES endereco(Id_endereco) ON DELETE CASCADE ON UPDATE CASCADE);""")

    layout = [

    [
    sg.Text("ID Professor:", size = (10,1)),
    sg.Input(size= (6,1), key = "-ID PROFESSOR-"),
    sg.Text("(Só para fins de consulta)", size = (23,1))    
    ],

    [
    sg.Text("Digite aqui os dados da pessoa que está sendo cadastrada:", size=(45,1))
    ],

    [
    sg.Text("Nome:", size=(5,1)), 
    sg.Input(size=(47,1), key="-NOME-")
    ],

    [
    sg.Text("Email:", size=(5,1)), 
    sg.Input(size=(47,1), key="-EMAIL-")
    ],

    [
    sg.Text("Tipo de telefone:", size = (13,1)), 
    sg.Checkbox("Residencial", default=False, key="-RESIDENCIAL-"), 
    sg.Checkbox("Celular", default=False, key ="-CELULAR-"), 
    sg.Checkbox("Comercial", default=False, key="-COMERCIAL-")
    ],

    [
    sg.Text("Numero de telefone:", size=(16,1)), 
    sg.Input(size=(34,1), key="-NUMERO TELEFONE-")
    ],

    [
    sg.Text("CPF:", size=(3,1)),
    sg.Input(size=(49,1), key = "-CPF-")
    ],

    [
    sg.Text("Data nascimento:", size=(14,1)), 
    sg.Input(size=(36,1), key= "-DATA NASCIMENTO-")
    ],

    [
    sg.Text("Sexo:", size=(4,1)),
    sg.Checkbox("Masculino", default=False, key="-M-"), 
    sg.Checkbox("Feminino", default=False, key="-F-")
    ],

    [
    sg.Text("Formação:", size=(8,1)),
    sg.Input(size=(43,1), key = "-FORMACAO-")    
    ],

    [
    sg.Button("Inserir", size=(8, 1), key = "-INSERIR-"),
    sg.Button("Limpar", size=(8, 1), key = "-LIMPAR-"),
    sg.Button("Consulta", size = (8,1), key ="-CONSULTA-"),
    sg.Button("Excluir", size=(8, 1), key = "-EXCLUIR-"),
    sg.Button("Atualizar", size =(8,1), key = "-ATUALIZAR-")
    ],

    [
    sg.Button("Finalizar Cadastro!", size=(16,1), key = "-FINALIZAR-")    
    ]
    ]

    window = sg.Window("Cadastro de Professor", layout, use_default_focus = False)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break

        elif event == "-LIMPAR-":
            limpar()

        elif event == "-INSERIR-":
            with con:
                with con.cursor() as cursor:
                    cursor.execute("INSERT INTO professor (Nome_professor, Email_professor, Tipo_telefone_professor, Telefone_professor, CPF_professor, Dt_nascimento_professor, Sexo_professor, Formacao_professor, Id_endereco) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, (SELECT Id_endereco FROM endereco ORDER BY Id_endereco DESC LIMIT 1));",
                    (values['-NOME-'], values['-EMAIL-'], ('RESIDENCIAL' if values['-RESIDENCIAL-'] else 'COMERCIAL' if values['-COMERCIAL-'] else 'CELULAR'), values["-NUMERO TELEFONE-"], values['-CPF-'], values['-DATA NASCIMENTO-'], ('M' if values['-M-'] else 'F'), values('-FORMACAO-')))
            limpar()

        elif event == "-FINALIZAR-":
            window.close()
            main()

    window.close()

    con.commit()

    cursor.close()
    con.close()

def cad_endereco():

    def limpar():
        window['-ID ENDERECO-'].update('')
        window['-TIPO_LOUGRADOURO-'].update(False)
        window['-ENDERECO-'].update('')
        window['-NUMERO-'].update('')
        window['-COMPLEMENTO-'].update('')
        window['-BAIRRO-'].update('')
        window['-CIDADE-'].update('')
        window['-UF-'].update('')
        window['-CEP-'].update('')

    con = psycopg2.connect(host="localhost", database="BD_PI", user="postgres", password="Bruno1997legal")

    with con:
        with con.cursor() as cursor:
            cursor.execute("""CREATE TABLE IF NOT EXISTS endereco(
            Id_endereco SERIAL NOT NULL,
            Tipo_lougradouro VARCHAR(40) NOT NULL,
            Lougradouro VARCHAR(40) NOT NULL CHECK (Lougradouro IN ('Rua','Avenida','Travessa','Praça','Viela')),
            Numero NUMERIC(3),
            Complemento VARCHAR(40),
            Bairro VARCHAR(40) NOT NULL,
            Cidade VARCHAR(40) NOT NULL,
            UF VARCHAR(2) NOT NULL,
            CEP NUMERIC(8) NOT NULL,
            PRIMARY KEY(Id_endereco));""")

    layout = [
    #[
    #sg.Text("Id_endereco", size=(10,1)),
    #sg.Input(size=(41,1), key = "-ID_ENDERECO-")
    #],

    [
    sg.Text("ID Endereço:", size = (10,1)),
    sg.Input(size= (6,1), key = "-ID ENDERECO-"),
    sg.Text("(Só para fins de consulta)", size = (23,1))    
    ],
    
    [
    sg.Text("Digite aqui o endereço da pessoa que está sendo cadastrada:", size=(45,1))
    ],

    [
    sg.Text("Tipo Lougradouro:", size=(13,1)),
    sg.Combo(['Rua','Avenida','Travessa','Praça','Viela'], default_value='Rua',key='-TIPO_LOUGRADOURO-')
    ],

    [
    sg.Text("Lougradouro:", size=(9,1)), 
    sg.Input(size=(38,1), key="-ENDERECO-")
    ],

    [
    sg.Text("Número:", size=(7,1)), 
    sg.Input(size=(42,1), key="-NUMERO-")
    ],

    [
    sg.Text("Complemento:", size=(10,1)), 
    sg.Input(size=(38,1), key="-COMPLEMENTO-")
    ],

    [
    sg.Text("Bairro:", size=(5,1)), 
    sg.Input(size=(44,1), key="-BAIRRO-")
    ],

    [
    sg.Text("Cidade:", size=(5,1)), 
    sg.Input(size=(44,1), key="-CIDADE-")
    ],

    [
    sg.Text("UF:", size=(5,1)), 
    sg.Input(size=(44,1), key="-UF-")
    ],

    [
    sg.Text("CEP:", size=(5,1)), 
    sg.Input(size=(44,1), key="-CEP-")
    ],
            
    [
    sg.Button("Inserir", size=(7, 1), key = "-INSERIR-"),
    sg.Button("Limpar", size=(7, 1), key = "-LIMPAR-"),
    sg.Button("Consulta", size = (7,1), key ="-CONSULTA-"),
    sg.Button("Excluir", size=(7, 1), key = "-EXCLUIR-"),
    sg.Button("Atualizar", size =(8,1), key = "-ATUALIZAR-")
    ],

    [
    sg.Button("Voltar", size=(8, 1), key = "-VOLTAR-"),
    sg.Button("Cadastrar Aluno", size=(16, 1), key = "-CAD_ALUNOS-"),
    sg.Button("Cadastrar Professor", size=(16, 1), key = "-CAD_PROFESSOR-"),
    ]
    ]

    window = sg.Window("Cadastro de Endereço", layout, use_default_focus = False)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break

        elif event == "-LIMPAR-":
            limpar()

        elif event == "-INSERIR-":
            with con:
                with con.cursor() as cursor:
                    cursor.execute("INSERT INTO endereco (Tipo_lougradouro, Lougradouro, Numero, Complemento, Bairro, Cidade, UF, CEP) VALUES (%s, %s, %s, %s, %s, %s, %s, %s);",
                    (values['-TIPO_LOUGRADOURO-'], values['-ENDERECO-'], values["-NUMERO-"], values['-COMPLEMENTO-'], values['-BAIRRO-'], values['-CIDADE-'], values['-UF-'], values['-CEP-'] ))
            limpar()

        elif event == "-VOLTAR-":
            window.close()
            main()

        elif event == "-CAD_ALUNOS-":
            window.close()
            cad_alunos()

        elif event == "-CAD_PROFESSOR-":
            window.close()
            cad_professor()

    window.close()

    con.commit()

    cursor.close()
    con.close()

def cad_curso():

    def limpar():
        window['-ID_CURSO-'].update('')
        window['-TIPO_IDIOMA-'].update(False)
        window['-NIVEL-'].update(False)
        window['-REQUISITO-'].update('')
        window['-PRECO-'].update('')
        window['-TEMPO_CURSO-'].update('')

    con = psycopg2.connect(host="localhost", database="BD_PI", user="postgres", password="Bruno1997legal")

    with con:
        with con.cursor() as cursor:
            cursor.execute("""CREATE TABLE IF NOT EXISTS curso(
            Id_curso SERIAL NOT NULL PRIMARY KEY,
            Tipo_idioma VARCHAR(10) CHECK(Tipo_idioma IN ('INGLÊS', 'FRANCÊS', 'ESPANHOL')) NOT NULL,
            Nivel_curso VARCHAR(20) NOT NULL, CHECK (Nivel_curso IN ('Básico', 'Intermediario', 'Avançado')),
            Requisito VARCHAR(60) NOT NULL, 
            Preco NUMERIC(6,2) NOT NULL, 
            Tempo_de_curso VARCHAR(10) NOT NULL);""")

    layout = [

    [
    sg.Text("ID Curso:", size = (7,1)),
    sg.Input(size= (4,1), key = "-ID_CURSO-"),
    sg.Text("(Só para fins de consulta)", size = (23,1))    
    ],
    
    [
    sg.Text("Insira aqui os dados do curso que está sendo cadastrada:", size=(45,1))
    ],

    [
    sg.Text("Tipo Idioma:", size=(11,1)),
    sg.Combo(['INGLÊS','FRANCÊS','ESPANHOL'], default_value='INGLÊS',key='-TIPO_IDIOMA-')
    ],

    [
    sg.Text("Nível do curso:", size=(11,1)),
    sg.Combo(['Básico','Intermediario','Avançado'], default_value='Básico',key='-NIVEL-')
    ],

    [
    sg.Text("Requisito:", size=(7,1)), 
    sg.Input(size=(42,1), key="-REQUISITO-")
    ],

    [
    sg.Text("Preço:", size=(5,1)), 
    sg.Input(size=(44,1), key="-PRECO-")
    ],

    [
    sg.Text("Tempo de curso:", size=(12,1)), 
    sg.Input(size=(36,1), key="-TEMPO_CURSO-")
    ],
            
    [
    sg.Button("Inserir", size=(7, 1), key = "-INSERIR-"),
    sg.Button("Limpar", size=(7, 1), key = "-LIMPAR-"),
    sg.Button("Consulta", size = (7,1), key ="-CONSULTA-"),
    sg.Button("Excluir", size=(7, 1), key = "-EXCLUIR-"),
    sg.Button("Atualizar", size =(8,1), key = "-ATUALIZAR-")
    ],

    [
    sg.Button("Voltar", size=(8, 1), key = "-VOLTAR-"),
    sg.Button("Cadastrar turma", size=(16,1), key = "-CAD_TURMA-")    
    ]
    ]

    window = sg.Window("Cadastro de Curso", layout, use_default_focus = False)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break

        elif event == "-LIMPAR-":
            limpar()

        elif event == "-INSERIR-":
            with con:
                with con.cursor() as cursor:
                    cursor.execute("INSERT INTO curso (Tipo_idioma, Nivel_curso, Requisito, Preco, Tempo_de_curso) VALUES (%s, %s, %s, %s, %s);",
                    (values['-TIPO_IDIOMA-'], values['-NIVEL-'], values["-REQUISITO-"], values['-PRECO-'], values['-TEMPO_CURSO-']))
            limpar()

        elif event == "-VOLTAR-":
            window.close()
            main()
        
        elif event == "-CAD_TURMA-":
            window.close()
            cad_turma()

    window.close()

    con.commit()

    cursor.close()
    con.close()

def cad_turma():
    
    def limpar():
        window['-ID_TURMA-'].update('')
        window['-TURMA-'].update(False)
        window['-QUANTIDADE_ALUNOS-'].update(False)
        window['-DATA_INICIO-'].update('')
        window['-DATA_FINAL-'].update('')

    con = psycopg2.connect(host="localhost", database="BD_PI", user="postgres", password="Bruno1997legal")

    with con:
        with con.cursor() as cursor:
            cursor.execute("""CREATE TABLE IF NOT EXISTS turma(
            Id_turma SERIAL PRIMARY KEY,
            Nome_turma VARCHAR(60) NOT NULL,
            Quant_alunos NUMERIC(6,0) NOT NULL, 
            Id_curso INTEGER NOT NULL, 
            FOREIGN KEY (Id_curso) REFERENCES curso(Id_curso) ON DELETE CASCADE ON UPDATE CASCADE,
            Dt_inicio_turma DATE NOT NULL, 
            Dt_final_turma DATE,
            CHECK(Dt_inicio_turma < Dt_final_turma));""")

    layout = [
    
    [
    sg.Text("ID Turma:", size = (7,1)),
    sg.Input(size= (4,1), key = "-ID_TURMA-"),
    sg.Text("(Só para fins de consulta)", size = (23,1))    
    ],
    
    [
    sg.Text("Insira aqui os dados do turma que está sendo cadastrada:", size=(45,1))
    ],

    [
    sg.Text("Nome da turma:", size=(12,1)), 
    sg.Input(size=(36,1), key="-TURMA-")
    ],

    [
    sg.Text("Quantidade de alunos:", size=(16,1)),
    sg.Input(size=(31,1), key="-QUANTIDADE_ALUNOS-")
    ],

    [
    sg.Text("Data de inicio:", size=(10,1)), 
    sg.Input(size=(38,1), key="-DATA_INICIO-")
    ],

    [
    sg.Text("Data final:", size=(7,1)), 
    sg.Input(size=(41,1), key="-DATA_FINAL-")
    ],
            
    [
    sg.Button("Inserir", size=(7, 1), key = "-INSERIR-"),
    sg.Button("Limpar", size=(7, 1), key = "-LIMPAR-"),
    sg.Button("Consulta", size = (7,1), key ="-CONSULTA-"),
    sg.Button("Excluir", size=(7, 1), key = "-EXCLUIR-"),
    sg.Button("Atualizar", size =(8,1), key = "-ATUALIZAR-")
    ],

    [
    sg.Button("Finalizar Cadastro!", size=(16,1), key = "-FINALIZAR-")    
    ]
    ]

    window = sg.Window("Cadastro de Turma", layout, use_default_focus = False)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break

        elif event == "-LIMPAR-":
            limpar()

        elif event == "-INSERIR-":
            with con:
                with con.cursor() as cursor:
                    cursor.execute("INSERT INTO turma (Nome_turma, Quant_alunos, Id_curso, Dt_inicio_turma, Dt_final_turma) VALUES (%s, %s, (SELECT Id_endereco FROM endereco ORDER BY Id_endereco DESC LIMIT 1), %s, %s);",
                    (values['-TURMA-'], values['-QUANTIDADE_ALUNOS-'], values['-DATA_INICIO-'], values['-DATA_FINAL-']))
            limpar()

        elif event == "-FINALIZAR-":
            window.close()
            main()


    window.close()

    con.commit()

    cursor.close()
    con.close()

def cad_disciplina():

    def limpar():
        window['-TIPO_DISCIPLINA-'].update('')

    con = psycopg2.connect(host="localhost", database="BD_PI", user="postgres", password="Bruno1997legal")

    with con:
        with con.cursor() as cursor:
            cursor.execute("""CREATE TABLE IF NOT EXISTS disciplina(
            Id_disciplina SERIAL PRIMARY KEY,
            Id_curso INTEGER,
            Tipo_disciplina VARCHAR(10) NOT NULL CHECK(Tipo_disciplina IN ('LEITURA', 'GRAMATICA', 'VERBAL')),
            Id_professor INTEGER NOT NULL, 
            FOREIGN KEY (Id_professor) REFERENCES professor(Id_professor) ON DELETE CASCADE ON UPDATE CASCADE, 
            FOREIGN KEY (Id_curso) REFERENCES curso(Id_curso) ON DELETE CASCADE ON UPDATE CASCADE);""")

    layout = [

    [
    sg.Text("ID Disciplina:", size = (7,1)),
    sg.Input(size= (4,1), key = "-ID_DISCIPLINA-"),
    sg.Text("(Só para fins de consulta)", size = (23,1))    
    ],
    
    [
    sg.Text("Insira aqui os dados do disiciplina que está sendo cadastrada:", size=(45,1))
    ],

    [
    sg.Text("Tipo Idioma:", size=(11,1)),
    sg.Combo(['LEITURA','GRAMATICA','VERBAL'], default_value='LEITURA',key='-TIPO_DISCIPLINA-')
    ],
            
    [
    sg.Button("Inserir", size=(7, 1), key = "-INSERIR-"),
    sg.Button("Limpar", size=(7, 1), key = "-LIMPAR-"),
    sg.Button("Consulta", size = (7,1), key ="-CONSULTA-"),
    sg.Button("Excluir", size=(7, 1), key = "-EXCLUIR-"),
    sg.Button("Atualizar", size =(8,1), key = "-ATUALIZAR-")
    ],

    [
    sg.Button("Voltar", size=(8, 1), key = "-VOLTAR-")  
    ]
    ]

    window = sg.Window("Cadastro de Disciplina", layout, use_default_focus = False)

    while True:
        event, values = window.read()
        if event == sg.WIN_CLOSED:
            break

        elif event == "-LIMPAR-":
            limpar()
        elif event == "-VOLTAR-":
            window.close()
            main()
        
    window.close()

    con.commit()

    cursor.close()
    con.close()

def main():

    layout = [
    [
    sg.Text("Bem - Vindo", size=(38, 1), justification='center', font=("Helvetica", 16), relief=sg.RELIEF_RIDGE, key='-TEXT HEADING-', enable_events=True)
    ],
    
    [
    sg.Text("Cadastros:", size=(8,1))    
    ],
    
    [
    sg.Button("Pessoas", size=(8, 1), key = "-PESSOAS-"),
    sg.Button("Curso", size=(8, 1), key = "-CURSO-"),
    sg.Button("Disciplina", size=(8,1), key="-DISCIPLINA-") 
    ]
    ]

    window = sg.Window("Menu Principal", layout, use_default_focus = False)

    while True:
            event, values = window.read()
            if event == sg.WIN_CLOSED:
                break

            elif event == "-PESSOAS-":
                window.close()
                cad_endereco()

            elif event == "-CURSO-":
                window.close()
                cad_curso()

            elif event == "-DISCIPLINA-":
                window.close()
                cad_disciplina()

    window.close()

main()

