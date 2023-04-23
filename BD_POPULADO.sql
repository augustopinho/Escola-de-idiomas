/*Esquema de relação:

Entidades e complementos:

Alunos (entidade): 
(Num_matricula (PK), Nome_alunos (NN), Email_alunos (NN), Tipo_telefone_alunos (NN), Telefone_alunos (NN) , CPF_alunos (NN) (Unique), Data de nascimento (NN), Sexo_alunos (NN), Id_endereco_alunos (NN))

Endereco_alunos (Complemento de Alunos):
(Num_matricula (FK) (PK Composto), Id_endereco_alunos (PK Composto) (FK), Tipo_lougradouro_alunos (NN) , Lougradouro_alunos (NN), Numero_alunos (NN), Complemento_alunos, Bairro_alunos (NN), Cidade_alunos (NN), UF_alunos (NN), CEP_alunos (NN))

Professor (entidade)
(Id_professor (PK) , Nome_professor (NN), Email (NN), CPF_professor (NN) (Unique), Tipo_telefone_professor (NN), Telefone_professor (NN), Formacao_professor (NN), Endereco_professor (FK) (NN))

Id_endereco_professor (Complemento de Professor):
(Id_professor (FK) (PK Composto), Id_endereco_professor (PK Composto), Tipo_lougradouro_professor (NN) , Lougradouro_professor (NN), Numero_professor (NN), Complemento_professor, Bairro_professor (NN), Cidade_professor (NN), UF_professor (NN), CEP_professor (NN))

Curso (entidade):
(Id_curso (PK), Requisito (NN), Preco (NN), Tipo_Idioma (NN) (Check {Inglês, Francês, Espanhol}, Tempo de curso (NN))

Turma (entidade):
(Id_turma (PK), Quant_alunos (NN), Nível (NN), Id_curso (FK) (NN), Dt_inicio_turma, Dt_final_turma)

Disciplina (entidade):
(Id_disciplina (PK), Tipo_disciplina (NN) (Check {Leitura, Gramatica, Fala}, Id_professor (FK) (NN))

Aula (entidade):
(Id_aula (PK), Dt_Hora_aula (NN), Perio_aula (NN), Sala (NN), Id_disciplina (FK))


Relacionamentos:

Está Matriculado (Relacionamento {Aluno e Curso}):
(Id_curso (FK) (PK Composto), N_matricula (FK) (PK Composto), Dt_inicio_matricula (NN), Dt_final_matricula)

Integra (Relacionamento {Turma e Aluno}):
(Id_turma (FK) (PK Composto), Num_matricula (FK) (PK Composto)) 

Engloba (Relacionamento {Turma e Disciplina}):
(Id_disciplina (FK) (PK Composto), Id_turma (FK) (PK Composto))

Leciona (Relacionamento {Curso e Professor}):
(Id_curso (FK) (PK Composto), Id_professor (FK) (PK Composto))

Participa (Relacionamento {Aluno e Aula}):
(Num_matricula (FK) (PK Composto), Id_aula (FK) (PK Composto), presença (NN) (Check {Presença, Falta})

Avaliado (Relacionamento {Aluno e Disciplina}):
(Num_matricula (FK) (PK Composto) , Id_disciplina (FK) (PK Composto), Nota_parcial_1 (NN), Nota_parcial_2 (NN), Nota_final (NN) (automatico???), Nota_participacao (NN), Situacao (NN) (Check {Aprovado, Cursando, Reprovado, Trancado}))*/

--Setando o estilo de data
SET DATESTYLE TO POSTGRES, DMY;

--CREATE TABLE endereco
DROP TABLE IF EXISTS endereco CASCADE;
CREATE TABLE endereco (
Id_endereco SERIAL NOT NULL,
Tipo_lougradouro VARCHAR(40) NOT NULL, 
Lougradouro VARCHAR(40) NOT NULL, 
Numero NUMERIC(3), 
Complemento VARCHAR(40), 
Bairro VARCHAR(40) NOT NULL, 
Cidade VARCHAR(40) NOT NULL, 
UF VARCHAR(2) NOT NULL, 
CEP NUMERIC(8) NOT NULL,
PRIMARY KEY(Id_endereco));
--POPULANDO TABLE endereco

INSERT INTO endereco VALUES(default, ' Rua' , ' Miguel Iunez' , '400' , '' , ' Pedreira' , ' São Paulo' , 'SP' , '3333000');
INSERT INTO endereco VALUES(default, ' Rua' , ' Alberto Iunez' , '551' , '' , ' Pedreira' , ' São Paulo' , 'SP' , '3344000');
INSERT INTO endereco VALUES(default, ' Rua' , ' Oito ' , '331' , ' fundos' , ' Ipiranga' , ' São Paulo' , 'SP' , '3246001');
INSERT INTO endereco VALUES(default, ' Avenida' , ' Nove ' , '894' , '' , ' Alto ipiranga' , ' São Bernado' , 'SP' , '3246221');
INSERT INTO endereco VALUES(default, ' Avenida' , ' Medeiroz ' , '292' , '' , ' Rios brancos' , ' São Bernado' , 'SP' , '45614');
INSERT INTO endereco VALUES(default, ' Avenida' , ' Vanconselos ' , '992' , '' , ' Campos grandes' , ' São Paulo' , 'SP' , '2145614');
INSERT INTO endereco VALUES(default, ' Rua' , ' Bernado Almeida ' , '262' , '' , ' Cidade Dutra' , ' São Paulo' , 'SP' , '2145714');
INSERT INTO endereco VALUES(default, ' Rua' , ' Alizon Almeida ' , '242' , '' , ' Cidade Dutra' , ' São Paulo' , 'SP' , '2155715');
INSERT INTO endereco VALUES(default, ' Viela' , ' Sete anjos ' , '111' , ' fundos' , ' Interlagos' , ' São Paulo' , 'SP' , '11111111');
INSERT INTO endereco VALUES(default, ' Viela' , ' Dois Rios ' , '888' , ' fundos' , ' Lapa' , ' São Paulo' , 'SP' , '2222222');
INSERT INTO endereco VALUES(default, ' Rua' , ' Villa nova' , '421' , '' , ' Conseição' , ' São Paulo' , 'SP' , '3333222');
INSERT INTO endereco VALUES(default, ' Rua' , ' São Jose' , '581' , '' , ' Ibirapuera' , ' São Paulo' , 'SP' , '3344666');
INSERT INTO endereco VALUES(default, ' Rua' , ' Oito prado ' , '131' , ' fundos' , ' Butatãn' , ' São Paulo' , 'SP' , '324333');
INSERT INTO endereco VALUES(default, ' Avenida' , ' Nove moças' , '994' , '' , ' Alto ipiranga' , ' São Bernado' , 'SP' , '3293911');
INSERT INTO endereco VALUES(default, ' Avenida' , ' Medeiroz verdes' , '598' , '' , ' Brás' , ' São Bernado' , 'SP' , '98945614');
INSERT INTO endereco VALUES(default, ' Avenida' , ' Vanconselos novas' , '192' , '' , ' Penha' , ' São Paulo' , 'SP' , '92149414');
INSERT INTO endereco VALUES(default, ' Rua' , ' Ronoel Almeida ' , '333' , '' , ' Jardim Helena' , ' São Paulo' , 'SP' , '4132194');
INSERT INTO endereco VALUES(default, ' Rua' , ' Demilson Almeida ' , '444' , '' , ' Tucuruvi' , ' São Paulo' , 'SP' , '2151295');
INSERT INTO endereco VALUES(default, ' Viela' , ' Sete anjos ' , '111' , ' fundos' , ' Pernizes' , ' São Paulo' , 'SP' , '19313529');
INSERT INTO endereco VALUES(default, ' Viela' , ' São Francisco ' , '666' , ' fundos' , ' Alto de Pinheiros' , ' São Paulo' , 'SP' , '12391791');
INSERT INTO endereco VALUES(default, 'Praça' , ' Juvenal Medeiros' , '860' , '' , 'Vila Frugoli' , 'São Paulo' , 'SP' , '03674110');
INSERT INTO endereco VALUES(default, 'Rua' , ' Alfredo Garcia Aquiline' , '929' , '' , 'Brasilândia' , 'São Paulo' , 'SP' , '02844070');
INSERT INTO endereco VALUES(default, 'Travessa' , ' Gylson Rodrigues Vidigal' , '111' , '' , 'Vila Cachoeira' , 'São Paulo' , 'SP' , '02311000');
INSERT INTO endereco VALUES(default, ' Rua' , ' Oscar Freire' , '400' , '' , ' Jardins' , ' São Paulo' , 'SP' , '31313131');
INSERT INTO endereco VALUES(default, ' Rua' , ' 9 de julho' , '551' , '' , ' Praça da Bandeira' , ' São Paulo' , 'SP' , '22222333');
INSERT INTO endereco VALUES(default, ' Rua' , ' Avanhadava ' , '331' , ' fundos' , ' Baixa Augusta' , ' São Paulo' , 'SP' , '92929292');
INSERT INTO endereco VALUES(default, ' Rua' , 'Acará-Bandeira' , '489' , '' , 'Jardim São Francisco (Zona Leste)' , ' São Paulo' , 'SP' , '03718000');
INSERT INTO endereco VALUES(default, ' Rua' , 'Macabu' , '508' , '' , 'Jardim São Carlos (Zona Leste)' , ' São Paulo' , 'SP' , '08411470');
INSERT INTO endereco VALUES(default, ' Rua' , 'Guaravira' , '556' , '' , 'Parque Paulistano' , ' São Paulo' , 'SP' , '08080710');
INSERT INTO endereco VALUES(default, ' Viela' , ' Dois Rios ' , '888' , ' fundos' , ' Lapa' , ' São Paulo' , 'SP' , '2222222');
INSERT INTO endereco VALUES(default, 'Travessa' , 'Vitória Silva Santos' , '360' , '' , 'Parque Paineiras' , 'São Paulo' , 'SP' , '03694220');
INSERT INTO endereco VALUES(default, 'Rua' , 'Iaptus' , '168' , '' , 'Cidade Satélite Santa Bárbara' , 'São Paulo' , 'SP' , '08330500');
INSERT INTO endereco VALUES(default, 'Rua' , 'Baltazar Veloso da Silva' , '465' , '' , 'Parque Regina' , 'São Paulo' , 'SP' , '05775150');
INSERT INTO endereco VALUES(default, 'Rua' , 'Antônio José Bentes' , '626' , '' , 'Jardim Irapiranga' , 'São Paulo' , 'SP' , '05891160');
INSERT INTO endereco VALUES(default, 'Travessa' , 'Catuné' , '968' , '' , 'Cidade São Mateus' , 'São Paulo' , 'SP' , '03945110');
INSERT INTO endereco VALUES(default, 'Rua' , 'Antonino Cintra' , '384' , '' , 'Jardim Peri Peri' , 'São Paulo' , 'SP' , '05537150');
INSERT INTO endereco VALUES(default, 'Rua' , 'Frederico Mesmer' , '641' , '' , 'Jardim Germânia' , 'São Paulo' , 'SP' , '05848060');
INSERT INTO endereco VALUES(default, 'Viela' , 'Viela da Amizade' , '198' , '' , 'Vila Gil' , 'São Paulo' , 'SP' , '08370532');
INSERT INTO endereco VALUES(default, 'Travessa' , 'Luca Marenzio' , '301' , '' , 'Jardim Vaz de Lima' , 'São Paulo' , 'SP' , '05833190');
INSERT INTO endereco VALUES(default, 'Travessa' , 'Fernando Aldana' , '799' , '' , 'Chora Menino' , 'São Paulo' , 'SP' , '02462130');
INSERT INTO endereco VALUES(default, 'Avenida' , 'do Estado 777 Entrada Portaria B' , '268' , '' , 'Bom Retiro' , 'São Paulo' , 'SP' , '01107902');
INSERT INTO endereco VALUES(default, 'Avenida' , 'Professor José Maria Alkmin' , '119' , '' , 'Jardim Ester' , 'São Paulo' , 'SP' , '05366000');
INSERT INTO endereco VALUES(default, 'Rua' , 'Armando Vieira' , '309' , '' , 'Jardim Quarto Centenário' , 'São Paulo' , 'SP' , '04816000');
INSERT INTO endereco VALUES(default, 'Rua' , 'René Falconetti' , '593' , '' , 'Parque América' , 'São Paulo' , 'SP' , '04822360');
INSERT INTO endereco VALUES(default, 'Rua' , 'Tomekichi Inouye' , '523' , '' , 'Colônia (Zona Sul)' , 'São Paulo' , 'SP' , '04875030');
INSERT INTO endereco VALUES(default, 'Rua' , 'Tuiuti 2114' , '566' , '' , 'Tatuapé' , 'São Paulo' , 'SP' , '03307970');
INSERT INTO endereco VALUES(default, 'Rua' , 'Miguel Sutil' , '943' , '' , 'Vila Cordeiro' , 'São Paulo' , 'SP' , '04583050');
INSERT INTO endereco VALUES(default, 'Rua' , 'Frederico Carlos de Andrade' , '928' , '' , 'Vila Carolina' , 'São Paulo' , 'SP' , '02724010');
INSERT INTO endereco VALUES(default, 'Rua' , 'Leandro Cardoso' , '933' , '' , 'Vila Ponte Rasa' , 'São Paulo' , 'SP' , '03882010');
INSERT INTO endereco VALUES(default, 'Travessa' , 'Chico Science' , '919' , '' , 'Sumarezinho' , 'São Paulo' , 'SP' , '05442035');
INSERT INTO endereco VALUES(default, 'Rua' , 'Vitório Rambelli' , '316' , '' , 'Jardim Arizona' , 'São Paulo' , 'SP' , '03735260');
INSERT INTO endereco VALUES(default, 'Rua' , 'Briosa' , '724' , '' , 'Cidade Antônio Estevão de Carvalho' , 'São Paulo' , 'SP' , '08223366');
INSERT INTO endereco VALUES(default, 'Rua' , 'Clineu Braga de Magalhães' , '305' , '' , 'Jardim Nosso Lar' , 'São Paulo' , 'SP' , '04401060');
INSERT INTO endereco VALUES(default, 'Avinida' , 'General Asdrúbal da Cunha 1344' , '878' , '' , 'Jardim Arpoador' , 'São Paulo' , 'SP' , '05565900');
INSERT INTO endereco VALUES(default, 'Rua' , 'Amadeu Narciso Pieroni' , '444' , '' , 'Jardim Leonor Mendes de Barros' , 'São Paulo' , 'SP' , '02346040');
INSERT INTO endereco VALUES(default, 'Rua' , 'Mezon' , '628' , '' , 'Jardim Petrópolis' , 'São Paulo' , 'SP' , '04637100');
INSERT INTO endereco VALUES(default, 'Rua' , 'dos Navegantes' , '326' , '' , 'Cantinho do Céu' , 'São Paulo' , 'SP' , '04849505');
INSERT INTO endereco VALUES(default, 'Rua' , 'Elias Martin' , '241' , '' , 'Vila Dalva' , 'São Paulo' , 'SP' , '05386250');
INSERT INTO endereco VALUES(default, 'Rua' , 'Paulo Bourroul' , '745' , '' , 'Real Parque' , 'São Paulo' , 'SP' , '05686050');
INSERT INTO endereco VALUES(default, 'Rua' , 'Alberto Arruda Fontes' , '517' , '' , 'Jardim Monte Belo (Raposo Tavares)' , 'São Paulo' , 'SP' , '05546200');
INSERT INTO endereco VALUES(default, 'Rua' , ' Bacanga' , '610' , '' , 'Vila Antonina' , 'São Paulo' , 'SP' , '03412090');
INSERT INTO endereco VALUES(default, 'Rua' , ' Doutor Constâncio Teani' , '694' , '' , 'Vila Aurora (Zona Norte)' , 'São Paulo' , 'SP' , '02410140');
INSERT INTO endereco VALUES(default, 'Rua' , ' Ricardo' , '380' , '' , 'Balneário Dom Carlos' , 'São Paulo' , 'SP' , '04956060');
INSERT INTO endereco VALUES(default, 'Rua' , ' Particular Nélia' , '672' , '' , 'Jardim Nélia' , 'São Paulo' , 'SP' , '08142850');
INSERT INTO endereco VALUES(default, 'Travessa' , ' Alfio Schievano' , '858' , '' , 'Saúde' , 'São Paulo' , 'SP' , '04144010');
INSERT INTO endereco VALUES(default, 'Rua' , ' Palmeira do Piauí' , '431' , '' , 'Vila Jacuí' , 'São Paulo' , 'SP' , '08050165');
INSERT INTO endereco VALUES(default, 'Rua' , ' Jacopo Torriti' , '394' , '' , 'Jardim Icaraí' , 'São Paulo' , 'SP' , '04837180');
INSERT INTO endereco VALUES(default, 'Rua' , ' Alcides Teodoro Santos' , '763' , '' , 'Parque Ipê' , 'São Paulo' , 'SP' , '05762010');
INSERT INTO endereco VALUES(default, 'Rua' , ' Ademar Borges Nunes' , '994' , '' , 'Jardim Peri' , 'São Paulo' , 'SP' , '02650120');
INSERT INTO endereco VALUES(default, 'Rua' , ' dos Rodrigues' , '821' , '' , 'Vila Carrão' , 'São Paulo' , 'SP' , '03435070');
INSERT INTO endereco VALUES(default, 'Rua' , ' Argote' , '905' , '' , 'Cidade Tiradentes' , 'São Paulo' , 'SP' , '08470290');
INSERT INTO endereco VALUES(default, 'Rua' , ' Cleide' , '806' , '' , 'Campo Belo' , 'São Paulo' , 'SP' , '04616010');
INSERT INTO endereco VALUES(default, 'Travessa' , ' José Ravelo' , '890' , '' , 'Americanópolis' , 'São Paulo' , 'SP' , '04429180');
INSERT INTO endereco VALUES(default, 'Rua' , ' Conde D" "Eu' , '532' , '' , 'Santo Amaro' , 'São Paulo' , 'SP' , '04738010');
INSERT INTO endereco VALUES(default, 'Rua' , ' Martinho de Sousa' , '964' , '' , 'Vila Paranaguá' , 'São Paulo' , 'SP' , '03807290');
INSERT INTO endereco VALUES(default, 'Praça' , ' Natal Antônio da Cunha' , '708' , '' , 'Cangaíba' , 'São Paulo' , 'SP' , '03820320');
INSERT INTO endereco VALUES(default, 'Rua' , ' Padre Lindolfo Esteves' , '564' , '' , 'Parque do Lago' , 'São Paulo' , 'SP' , '04945210');
INSERT INTO endereco VALUES(default, 'Rua' , ' Maparajuba' , '426' , '' , 'Jardim São Manoel' , 'São Paulo' , 'SP' , '05871320');
INSERT INTO endereco VALUES(default, 'Rua' , ' Maria Augusta Thomaz' , '672' , '' , 'Parque da Lapa' , 'São Paulo' , 'SP' , '05301090');
INSERT INTO endereco VALUES(default, 'Rua' , ' Luiza Campanella Giordano' , '250' , '' , 'Parque das Paineiras' , 'São Paulo' , 'SP' , '03694180');
INSERT INTO endereco VALUES(default, 'Avenida' , ' Eusébio Matoso 1375' , '572' , '' , 'Butantã' , ' São Paulo' , 'SP' , '05423905');
INSERT INTO endereco VALUES(default, 'Rua' , ' Alfredo Garcia Aquiline' , '929' , '' , 'Brasilândia' , 'São Paulo' , 'SP' , '02844070');
INSERT INTO endereco VALUES(default, 'Travessa' , ' Gylson Rodrigues Vidigal' , '111' , '' , 'Vila Cachoeira' , 'São Paulo' , 'SP' , '02311000');
INSERT INTO endereco VALUES(default, ' Rua' , ' Oscar Freire' , '400' , '' , ' Jardins' , ' São Paulo' , 'SP' , '31313131');
INSERT INTO endereco VALUES(default, ' Rua' , ' 9 de julho' , '551' , '' , ' Praça da Bandeira' , ' São Paulo' , 'SP' , '22222333');
INSERT INTO endereco VALUES(default, ' Rua' , ' Avanhadava ' , '331' , ' fundos' , ' Baixa Augusta' , ' São Paulo' , 'SP' , '92929292');
INSERT INTO endereco VALUES(default, ' Rua' , 'Acará-Bandeira' , '489' , '' , 'Jardim São Francisco (Zona Leste)' , ' São Paulo' , 'SP' , '03718000');
INSERT INTO endereco VALUES(default, ' Rua' , 'Macabu' , '508' , '' , 'Jardim São Carlos (Zona Leste)' , ' São Paulo' , 'SP' , '08411470');
INSERT INTO endereco VALUES(default, ' Rua' , 'Guaravira' , '556' , '' , 'Parque Paulistano' , ' São Paulo' , 'SP' , '08080710');
INSERT INTO endereco VALUES(default, ' Rua' , 'Peirópolis' , '811' , '' , 'Vila Guilhermina' , ' São Paulo' , 'SP' , '03543140');
INSERT INTO endereco VALUES(default, ' Rua' , 'Carmontelle' , '424' , '' , 'Vila Olímpia' , ' São Paulo' , 'SP' , '04550070');

--VIZUALIZANDO TABLE endereco

SELECT * FROM endereco ;

--CREATE TABLE alunos
DROP TABLE IF EXISTS alunos CASCADE;
CREATE TABLE alunos(
Num_matricula SERIAL PRIMARY KEY,
Nome_alunos VARCHAR(40) NOT NULL,
Email_alunos VARCHAR(50) NOT NULL,
Tipo_telefone_alunos VARCHAR(20) NOT NULL CHECK (Tipo_telefone_alunos IN ('RESIDENCIAL',  'CELULAR',  'COMERCIAL')),
Telefone_alunos NUMERIC(11) NOT NULL,
CPF_alunos NUMERIC(11) NOT NULL UNIQUE,
Dt_nascimento_alunos DATE NOT NULL,
Sexo_alunos CHAR(1) NOT NULL CHECK(Sexo_alunos IN( 'M', 'F' )),
Id_endereco INTEGER NOT NULL,
FOREIGN KEY(Id_endereco) REFERENCES endereco(Id_endereco) ON DELETE CASCADE ON UPDATE CASCADE);

--POPULANDO TABLE alunos

INSERT INTO alunos VALUES(default, ' Roberto Rodrigo Silva' , 'robertorodrigo@outlook.com' , 'CELULAR' , '11959905632' , '52832804730' , '06/05/2003' , 'M' , '1');
INSERT INTO alunos VALUES(default, ' Rodrigo James Pereira' , 'rodrigopereira@outlook.com' , 'CELULAR' , '11955905732' , '52826804730' , '07/04/2001' , 'M' , '2');
INSERT INTO alunos VALUES(default, ' João Carlos Lima' , 'joãolima@outlook.com' , 'CELULAR' , '11955605732' , '52235804730' , '21/08/2005' , 'M' , '3');
INSERT INTO alunos VALUES(default, ' Isadora Oliveira' , 'isaoliveira@outlook.com' , 'CELULAR' , '11999999999' , '52800004730' , '22/05/2003' , 'F' , '4');
INSERT INTO alunos VALUES(default, ' Rafaela Andrade' , 'rafaelaandrade@outlook.com' , 'RESIDENCIAL' , '11959905632' , '52772804730' , '20/02/1997' , 'F' , '5');
INSERT INTO alunos VALUES(default, ' Isabella Aureliano' , 'isabellaaureliano@outlook.com' , 'COMERCIAL' , '11955605632' , '54442804730' , '06/02/1995' , 'F' , '6');
INSERT INTO alunos VALUES(default, ' Jacinto Zenildo' , 'Jacintozenildo@outlook.com' , 'CELULAR' , '11956605632' , '52832804766' , '02/08/1994' , 'M' , '7');
INSERT INTO alunos VALUES(default, ' Ronoel Alberto Paiva' , 'ronoelpaiva@outlook.com' , 'CELULAR' , '11952205632' , '52832807777' , '07/07/2007' , 'M' , '8');
INSERT INTO alunos VALUES(default, ' Debora Santos' , 'robertorodrigo@outlook.com' , 'CELULAR' , '11959941632' , '5282555730' , '08/10/1987' , 'M' , '9');
INSERT INTO alunos VALUES(default, ' Alberto Queiroz' , 'albertoqueiroz@outlook.com' , 'RESIDENCIAL' , '11954401632' , '11111111111' , '15/12/1984' , 'M' , '10');
INSERT INTO alunos VALUES(default, ' Clarisse Silva' , 'clarissesilva@outlook.com' , 'COMERCIAL' , '11111111111' , '22222222222' , '27/09/1985' , 'F' , '11');
INSERT INTO alunos VALUES(default, ' Sabrina Keblechr' , 'sabrinakeblechr@outlook.com' , 'RESIDENCIAL' , '22222222222' , '33333333333' , '14/01/1980' , 'F' , '12');
INSERT INTO alunos VALUES(default, ' Vitoria Okuma' , 'vitoriaokuma@outlook.com' , 'CELULAR' , '33333333333' , '44444444444' , '22/05/2003' , 'F' , '13');
INSERT INTO alunos VALUES(default, ' Cassio Menezes Grotolli' , 'cassiogrotolli@gmail.com' , 'CELULAR' , '44444444444' , '55555555555' , '14/01/2000' , 'M' , '14');
INSERT INTO alunos VALUES(default, ' Gleide Soarez' , 'gleidesoarez@gmail.com' , 'CELULAR' , '55555555555' , '66666666666' , '14/01/2000' , 'M' , '15');
INSERT INTO alunos VALUES(default, ' Demilson Cartola' , 'demilsoncartola@gmail.com' , 'CELULAR' , '66666666666' , '77777777777' , '22/03/1960' , 'M' , '16');
INSERT INTO alunos VALUES(default, ' Rogisvalda Vitora Nascimento' , 'rogisvaldanascimento@gmail.com' , 'CELULAR' , '77777777777' , '88888888888' , '16/04/2003' , 'F' , '17');
INSERT INTO alunos VALUES(default, ' Vanessa da mata' , 'vanessamata@gmail.com' , 'COMERCIAL' , '88888888888' , '99999999999' , '10/10/2002' , 'F' , '18');
INSERT INTO alunos VALUES(default, ' Giulianirson Fonseca' , 'giufonseca@gmail.com' , 'CELULAR' , '999999999' , '52255555555' , '14/01/2000' , 'F' , '19');
INSERT INTO alunos VALUES(default, ' Aline Ramos' , 'alineramos@gmail.com' , 'CELULAR' , '44422444444' , '53355555555' , '22/05/1992' , 'M' , '20');
INSERT INTO alunos VALUES(default, ' Janoario Vanes' , 'janoariovanes@gmail.com' , 'COMERCIAL' , '44422433444' , '55544555665' , '18/08/1993' , 'M' , '21');
INSERT INTO alunos VALUES(default, ' Alcervo Vanes Rodriguez' , 'alcervovanesrodriguez@gmail.com' , 'CELULAR' , '44422433444' , '55544355665' , '25/08/1991' , 'M' , '22');
INSERT INTO alunos VALUES(default, ' Diana Felipe Materll' , 'dianamartell@gmail.com' , 'CELULAR' , '44422433444' , '55544555662' , '22/04/1999' , 'F' , '23');
INSERT INTO alunos VALUES(default, ' Zivaldo Ronoel Varnis' , 'zivaldovarnis@gmail.com' , 'CELULAR' , '44422433364' , '52544555662' , '26/07/1987' , 'F' , '24');
INSERT INTO alunos VALUES(default, ' Linovaldo Pereira de Carmo' , 'linovinhocarmoso@gmail.com' , 'CELULAR' , '44422433364' , '52544765662' , '26/07/1988' , 'M' , '25');
INSERT INTO alunos VALUES(default, ' Marcela Campos' , 'marcelacampos@gmail.com' , 'CELULAR' , '44422431164' , '52544725762' , '11/06/1986' , 'F' , '26');
INSERT INTO alunos VALUES(default, ' Vanessa Gironzam' , 'vanessagirozam@gmail.com' , 'RESIDENCIAL' , '77772277337' , '88118822812' , '11/06/1984' , 'F' , '27');
INSERT INTO alunos VALUES(default, ' Historia Alesas' , 'historiaalesas@gmail.com' , 'CELULAR' , '71172246337' , '88113322863' , '18/12/1984' , 'F' , '28');
INSERT INTO alunos VALUES(default, ' Queiroz Vasconselos' , 'queirozvasconselos@outlook.com' , 'COMERCIAL' , '71172232337' , '88113328988' , '18/12/1985' , 'M' , '29');
INSERT INTO alunos VALUES(default, ' Rogerio Opala' , 'rogerioopala@outlook.com' , 'RESIDENCIAL' , '71172264337' , '88113327788' , '18/12/1990' , 'M' , '30');
INSERT INTO alunos VALUES(default, 'Sara Alana Mendes' , 'sara_mendes@prokopetz.com.br' , 'CELULAR' , '11981786842' , '17376652809' , '01/04/1973' , 'F' , '31');
INSERT INTO alunos VALUES(default, 'Fátima Heloise da Paz' , 'fatima_dapaz@ft.unicamp.br' , 'CELULAR' , '11987834807' , '17904561859' , '15/07/1955' , 'F' , '32');
INSERT INTO alunos VALUES(default, 'Rosa Marli da Mota' , 'rosa-damota98@fileno.com.br' , 'CELULAR' , '11992848871' , '91412135800' , '12/10/1976' , 'F' , '33');
INSERT INTO alunos VALUES(default, 'Osvaldo Filipe da Luz' , 'osvaldo_daluz@unitower.com.br' , 'CELULAR' , '11981345637' , '11674604807' , '02/04/2001' , 'M' , '34');
INSERT INTO alunos VALUES(default, 'Maria Marlene Sophia Costa' , 'mariamarlenecosta@diclace.com.br' , 'CELULAR' , '11987845972' , '81410823881' , '21/07/1972' , 'F' , '35');
INSERT INTO alunos VALUES(default, 'Fernando Diego Barbosa' , 'fernando_diego_barbosa@redex.com.br' , 'CELULAR' , '11991526101' , '25788775809' , '04/11/2002' , 'M' , '36');
INSERT INTO alunos VALUES(default, 'Rosângela Allana Sophie Cavalcanti' , 'rosangela.allana.cavalcanti@edwardmaluf.com.br' , 'CELULAR' , '11986059691' , '73330072865' , '09/09/1946' , 'F' , '37');
INSERT INTO alunos VALUES(default, 'Carla Milena Oliveira' , 'carlamilenaoliveira@trincheira.com.br' , 'CELULAR' , '11991523544' , '51137768827' , '26/07/1961' , 'F' , '38');
INSERT INTO alunos VALUES(default, 'Gael Vinicius da Cunha' , 'gael_vinicius_dacunha@gerj.com.br' , 'CELULAR' , '11992039213' , '03461491853' , '11/11/1959' , 'M' , '39');
INSERT INTO alunos VALUES(default, 'Benício Guilherme Ferreira' , 'benicioguilhermeferreira@jotace.eti.br' , 'CELULAR' , '11994652014' , '10972845810' , '03/11/1966' , 'M' , '40');
INSERT INTO alunos VALUES(default, 'Maitê Cláudia Débora da Conceição' , 'maite.claudia.daconceicao@candello.abv.br' , 'CELULAR' , '11995189635' , '81708282874' , '25/06/1956' , 'F' , '41');
INSERT INTO alunos VALUES(default, 'Mariana Elaine Antonella da Cruz' , 'mariana_dacruz@escritorioindaia.com.br' , 'CELULAR' , '11984649602' , '07539297832' , '09/11/1991' , 'F' , '42');
INSERT INTO alunos VALUES(default, 'Thomas Julio Erick Farias' , 'thomas_farias@policiamilitar.sp.gov.br' , 'CELULAR' , '11987862079' , '73853841880' , '02/02/1962' , 'M' , '43');
INSERT INTO alunos VALUES(default, 'Iago Henrique Marcos Melo' , 'iago.henrique.melo@hotmail.de' , 'CELULAR' , '11989096973' , '08204777884' , '10/11/1958' , 'M' , '44');
INSERT INTO alunos VALUES(default, 'Antonella Marli Hadassa Fernandes' , 'antonellamarlifernandes@htomail.com' , 'CELULAR' , '11985790853' , '89871887876' , '27/08/1998' , 'F' , '45');
INSERT INTO alunos VALUES(default, 'Emanuelly Joana Bruna Rocha' , 'emanuellyjoanarocha@inbox.com' , 'CELULAR' , '11995652918' , '45267115860' , '04/04/1999' , 'F' , '46');
INSERT INTO alunos VALUES(default, 'Filipe Osvaldo Heitor Moura' , 'filipe-moura95@marktechbr.com.br' , 'CELULAR' , '11984710294' , '82761410807' , '20/08/1985' , 'M' , '47');
INSERT INTO alunos VALUES(default, 'Matheus Leonardo Rodrigues' , 'matheus_rodrigues@iahoo.com' , 'CELULAR' , '11983451491' , '37934446861' , '23/08/1984' , 'M' , '48');
INSERT INTO alunos VALUES(default, 'Alessandra Vitória Maria Galvão' , 'alessandra_galvao@granadaimoveis.com.br' , 'CELULAR' , '11987792905' , '55109202893' , '16/02/1989' , 'F' , '49');
INSERT INTO alunos VALUES(default, 'Iago Calebe Corte Real' , 'iago_calebe_cortereal@drimenezes.com' , 'CELULAR' , '11997785067' , '38772244828' , '09/06/1955' , 'M' , '50');
INSERT INTO alunos VALUES(default, 'Hadassa Aline Sônia Aragão' , 'hadassa_aragao@goldenhotel.com.br' , 'CELULAR' , '11984878456' , '11783261870' , '08/07/1980' , 'F' , '51');
INSERT INTO alunos VALUES(default, 'Aline Yasmin Ribeiro' , 'alineyasminribeiro@hoatmail.com' , 'CELULAR' , '11985457455' , '92906110817' , '18/04/1963' , 'F' , '52');
INSERT INTO alunos VALUES(default, 'Lara Heloise Benedita Lopes' , 'lara_lopes@carolpessoa.com.br' , 'CELULAR' , '11999792076' , '90312419899' , '09/05/1995' , 'F' , '53');
INSERT INTO alunos VALUES(default, 'Igor Raimundo Drumond' , 'igor_drumond@impactatp.com.br' , 'CELULAR' , '11985718773' , '59813805862' , '21/06/1991' , 'M' , '54');
INSERT INTO alunos VALUES(default, 'Lívia Juliana da Rosa' , 'liviajulianadarosa@oas.com' , 'CELULAR' , '11983704459' , '64323266804' , '06/03/1944' , 'F' , '55');
INSERT INTO alunos VALUES(default, 'Felipe Felipe Moraes' , 'felipefelipemoraes@gsw.com.br' , 'CELULAR' , '11997906300' , '39443567806' , '15/08/1974' , 'M' , '56');
INSERT INTO alunos VALUES(default, 'Pietro Benício Castro' , 'pietrobeniciocastro@academiaconcerto.art.br' , 'CELULAR' , '11998166232' , '22483319831' , '21/02/1994' , 'M' , '57');
INSERT INTO alunos VALUES(default, 'Jéssica Aparecida Manuela Peixoto' , 'jessica.aparecida.peixoto@metroquali.com.br' , 'CELULAR' , '11994552278' , '70730141802' , '18/06/1970' , 'F' , '58');
INSERT INTO alunos VALUES(default, 'Rafael Sebastião Fogaça' , 'rafaelsebastiaofogaca@localiza.com' , 'CELULAR' , '11984874650' , '52158430826' , '19/01/1979' , 'M' , '59');
INSERT INTO alunos VALUES(default, 'Betina Maria Carolina Almada' , 'betina_almada@projetemovelaria.com.br' , 'CELULAR' , '11982938804' , '20051773856' , '18/06/1969' , 'F' , '60');
INSERT INTO alunos VALUES(default, 'Juliana Valentina Cardoso' , 'juliana_cardoso@statusseguros.com.br' , 'RESIDENCIAL' , '1127349570' , '50088967840' , '03/07/1980' , 'F' , '61');
INSERT INTO alunos VALUES(default, 'Ian Marcos Julio Moura' , 'ian_marcos_moura@gmnail.com' , 'RESIDENCIAL' , '1125960091' , '75699154884' , '25/05/2004' , 'M' , '62');
INSERT INTO alunos VALUES(default, 'Ester Rebeca Drumond' , 'esterrebecadrumond@babo.adv.br' , 'RESIDENCIAL' , '1129029260' , '54620435899' , '20/08/1950' , 'F' , '63');
INSERT INTO alunos VALUES(default, 'Antônia Julia Farias' , 'antoniajuliafarias@abdalathomaz.adv.br' , 'RESIDENCIAL' , '1139192376' , '43472654848' , '23/05/1959' , 'F' , '64');
INSERT INTO alunos VALUES(default, 'Sarah Ester Caldeira' , 'sarahestercaldeira@solucao.adm.br' , 'RESIDENCIAL' , '1135437450' , '26871414886' , '02/11/1987' , 'F' , '65');
INSERT INTO alunos VALUES(default, 'Arthur Bento Marcelo da Conceição' , 'arthur.bento.daconceicao@cheryamur.com.br' , 'RESIDENCIAL' , '1136478614' , '52388470846' , '11/03/1969' , 'M' , '66');
INSERT INTO alunos VALUES(default, 'Fernanda Nair Rocha' , 'fernanda.nair.rocha@igoralcantara.com.br' , 'RESIDENCIAL' , '1138705310' , '52491736837' , '10/01/1997' , 'F' , '67');
INSERT INTO alunos VALUES(default, 'Yuri Bryan Nunes' , 'yuri_bryan_nunes@iega.com.br' , 'RESIDENCIAL' , '1129114678' , '58296653877' , '24/01/1968' , 'M' , '68');
INSERT INTO alunos VALUES(default, 'Lara Cristiane Louise Galvão' , 'lara_cristiane_galvao@formulaweb.com.br' , 'RESIDENCIAL' , '1127884316' , '98761092860' , '13/11/1996' , 'F' , '69');
INSERT INTO alunos VALUES(default, 'Patrícia Luna Lima' , 'patricia.luna.lima@superig.com.br' , 'RESIDENCIAL' , '1126445414' , '53322714845' , '08/07/1999' , 'F' , '70');
INSERT INTO alunos VALUES(default, 'Felipe Kevin Marcos Vinicius Corte Real' , 'felipe_kevin_cortereal@terra.com' , 'RESIDENCIAL' , '1129695119' , '42918769800' , '03/06/1960' , 'M' , '71');
INSERT INTO alunos VALUES(default, 'Bruno Edson Murilo Viana' , 'bruno.edson.viana@tjam.jus.br' , 'RESIDENCIAL' , '1138114461' , '35987059801' , '26/04/1951' , 'M' , '72');
INSERT INTO alunos VALUES(default, 'Otávio Otávio Aparício' , 'otaviootavioaparicio@heineken.com.br' , 'RESIDENCIAL' , '1139750393' , '56840437809' , '16/04/1968' , 'M' , '73');
INSERT INTO alunos VALUES(default, 'Pietra Lúcia Carvalho' , 'pietra-carvalho79@mundivox.com.br' , 'RESIDENCIAL' , '1138576003' , '17578936875' , '13/06/2002' , 'F' , '74');
INSERT INTO alunos VALUES(default, 'Caleb Nelson José Nogueira' , 'caleb_nogueira@zipmail.com' , 'RESIDENCIAL' , '1129193603' , '17059936807' , '19/05/1970' , 'M' , '75');
INSERT INTO alunos VALUES(default, 'Benedito Theo Gomes' , 'benedito.theo.gomes@cntbrasil.com.br' , 'RESIDENCIAL' , '1127663596' , '05576852818' , '01/11/1946' , 'M' , '76');
INSERT INTO alunos VALUES(default, 'Maria Marcela da Luz' , 'mariamarceladaluz@galpaoestofados.com.br' , 'RESIDENCIAL' , '1138389259' , '68705482852' , '20/10/1950' , 'F' , '77');
INSERT INTO alunos VALUES(default, 'Anthony Francisco Martin Costa' , 'anthony.francisco.costa@yahoo.fr' , 'RESIDENCIAL' , '1129231014' , '86705812800' , '10/10/1992' , 'M' , '78');
INSERT INTO alunos VALUES(default, 'Maya Evelyn Silva' , 'maya_evelyn_silva@redacaofinal.com.br' , 'RESIDENCIAL' , '1126575210' , '81551414899' , '12/09/1967' , 'F' , '79');
INSERT INTO alunos VALUES(default, 'Rafaela Luciana dos Santos' , 'rafaelalucianadossantos@taclog.com.br' , 'RESIDENCIAL' , '1136557716' , '88537617849' , '05/05/2002' , 'F' , '80');
INSERT INTO alunos VALUES(default, 'Kauê Cauã Mário Fernandes' , 'kaue_caua_fernandes@findout.com.br' , 'RESIDENCIAL' , '1129560853' , '17665298877' , '19/01/1953' , 'M' , '81');

--VIZUALIZANDO TABLE alunos

SELECT * FROM alunos ;

--CREATE TABLE professor

DROP TABLE IF EXISTS professor CASCADE;
CREATE TABLE professor(
Id_professor SERIAL PRIMARY KEY,
Nome_professor VARCHAR(40) NOT NULL,
Email_professor VARCHAR(50) NOT NULL,
Tipo_telefone_professor VARCHAR(11) NOT NULL CHECK(Tipo_telefone_professor IN ('RESIDENCIAL', 'CELULAR', 'COMERCIAL')),
Telefone_professor NUMERIC(11) NOT NULL,
CPF_professor NUMERIC(11) NOT NULL UNIQUE,
Dt_nascimento_professor DATE NOT NULL,
Sexo_professor CHAR(1) NOT NULL CHECK(Sexo_professor IN('M', 'F' )),
Formacao_professor VARCHAR(60),
Id_endereco INTEGER NOT NULL,
FOREIGN KEY(Id_endereco) REFERENCES endereco(Id_endereco) ON DELETE CASCADE ON UPDATE CASCADE);

--POPULANDO TABLE professor

INSERT INTO professor VALUES(default, ' Joseli Sampaio' , ' josesampaio@outlook.com' , 'CELULAR' , '11924905632' , '52110804723' , '06/05/1986' , 'M' , ' Jonarlismo - USP ' , '84');
INSERT INTO professor VALUES(default, ' Ednei Lamber' , ' edneilamber@outlook.com' , 'CELULAR' , '11959976432' , '52830004700' , '06/05/1994' , 'M' , 'ADS - FATEC Ipiranga' , '85');
INSERT INTO professor VALUES(default, ' Silvana Mota' , ' silvanamota@outlook.com' , 'CELULAR' , '11946705632' , '52836204730' , '06/05/1977' , 'F' , 'Pedagogia - Unip ' , '86');
INSERT INTO professor VALUES(default, 'Pietro Caio Emanuel Jesus' , 'pietro-jesus78@marcofaria.com' , 'RESIDENCIAL' , '1128530694' , '61900584859' , '04/11/1943' , 'M' , 'ADM - Unip' , '87');
INSERT INTO professor VALUES(default, 'Silvana Fabiana Analu Souza' , 'silvana_fabiana_souza@bplan.com.br' , 'RESIDENCIAL' , '1125094172' , '26486234857' , '08/05/1957' , 'F' , 'Economia - Unifesp' , '88');
INSERT INTO professor VALUES(default, 'Juan Gustavo Fernando da Mota' , 'juan-damota96@xerocopiadora.com.br' , 'COMERCIAL' , '1137267786' , '28282732885' , '12/07/2001' , 'M' , 'Pedagogia - Usp' , '89');
INSERT INTO professor VALUES(default, 'Rafael João Márcio da Rosa' , 'rafaeljoaodarosa@doublemoore.com' , 'RESIDENCIAL' , '1127289187' , '07184010850' , '27/09/2000' , 'M' , 'Ciencias sociais - UFMG' , '90');
INSERT INTO professor VALUES(default, 'Lucca Martin Nicolas Mendes' , 'lucca.martin.mendes@cppcoder.com' , 'RESIDENCIAL' , '1139893208' , '03270997809' , '27/05/1972' , 'M' , 'Ciencia da Computação - Unicamp' , '91');
INSERT INTO professor VALUES(default, 'Sabrina Cristiane Freitas' , 'sabrina_cristiane_freitas@santosdumonthospital.com' , 'COMERCIAL' , '1129484326' , '36356213825' , '02/06/1953' , 'F' , 'Pedagogia - UFABC' , '83');

--VIZUALIZANDO TABLE professor

SELECT * FROM professor ;

--CREATE TABLE curso

DROP TABLE IF EXISTS curso CASCADE;
CREATE TABLE curso(
Id_curso SERIAL PRIMARY KEY,
Tipo_idioma VARCHAR(10) CHECK(Tipo_idioma IN ('INGLÊS', 'FRANCÊS', 'ESPANHOL')) NOT NULL,
Nivel_curso VARCHAR(20) NOT NULL, CHECK (Nivel_curso IN ('Básico', 'Intermediario', 'Avançado')),
Requisito VARCHAR(60) NOT NULL, 
Preco NUMERIC(6,2) NOT NULL,  
Tempo_de_curso VARCHAR(10) NOT NULL);

--POPULANDO TABLE curso

INSERT INTO curso VALUES(default, 'INGLÊS' , 'Básico' , 'Nenhum' , '1500' , '1 ano');
INSERT INTO curso VALUES(default, 'INGLÊS' , 'Intermediario' , 'Inglês Básico' , '1500' , '1 ano');
INSERT INTO curso VALUES(default, 'INGLÊS' , 'Avançado' , 'Inglês Intermediário' , '1000' , '1 ano');
INSERT INTO curso VALUES(default, 'ESPANHOL' , 'Básico' , 'Nenhum' , '1000' , '1 ano');
INSERT INTO curso VALUES(default, 'ESPANHOL' , 'Intermediario' , 'Espanhol Básico' , '1000' , '1 ano');
INSERT INTO curso VALUES(default, 'ESPANHOL' , 'Avançado' , 'Espanhol Intermediário' , '1200' , '1 ano');
INSERT INTO curso VALUES(default, 'FRANCÊS' , 'Básico' , 'Nenhum' , '1200' , '1 ano');
INSERT INTO curso VALUES(default, 'FRANCÊS' , 'Intermediario' , 'Francês Básico' , '1200' , '1 ano');
INSERT INTO curso VALUES(default, 'FRANCÊS' , 'Avançado' , 'Francês Intermediário' , '1200' , '1 ano');

--VIZUALIZANDO TABLE curso

SELECT * FROM curso ;

--CREATE TABLE turma
DROP TABLE IF EXISTS turma CASCADE;
CREATE TABLE turma(
Id_turma SERIAL PRIMARY KEY,
Nome_turma VARCHAR(60) NOT NULL,
Quant_alunos NUMERIC(6,0) NOT NULL,
Id_curso INTEGER NOT NULL, 
FOREIGN KEY (Id_curso) REFERENCES curso(Id_curso) ON DELETE CASCADE ON UPDATE CASCADE, 
Dt_inicio_turma DATE NOT NULL, 
Dt_final_turma DATE,
CHECK(Dt_inicio_turma < Dt_final_turma));

--POPULANDO TABLE turma

INSERT INTO turma VALUES(default, 'T1/2022 - Inglês Básico' , '9' , '1'  , '06/02/2020' , '30/11/2021');
INSERT INTO turma VALUES(default, 'T1/2022 - Inglês Intermediario' , '9' , '2'  , '06/02/2020' , '30/11/2021');
INSERT INTO turma VALUES(default, 'T1/2022 - Inglês Avançado' , '9' , '3'  , '06/02/2020' , '30/11/2021');
INSERT INTO turma VALUES(default, 'T1/2022 - Espanhol Básico' , '9' , '4'  , '06/02/2020' , '30/11/2021');
INSERT INTO turma VALUES(default, 'T1/2022 - Espanhol Intermediario' , '9' , '5'  , '06/02/2020' , '30/11/2021');
INSERT INTO turma VALUES(default, 'T1/2022 - Espanhol Avançado' , '9' , '6'  , '06/02/2020' , '30/11/2021');
INSERT INTO turma VALUES(default, 'T1/2022 - Frances Básico' , '9' , '7'  , '06/02/2020' , '30/11/2021');
INSERT INTO turma VALUES(default, 'T1/2022 - Frances Intermediario' , '9' , '8'  , '06/02/2020' , '30/11/2021');
INSERT INTO turma VALUES(default, 'T1/2022 - Frances Avançado' , '9' , '9'  , '06/02/2020' , '30/11/2021');

--VIZUALIZANDO TABLE turma

SELECT * FROM turma ;

--CREATE TABLE disciplina

DROP TABLE IF EXISTS disciplina CASCADE;
CREATE TABLE disciplina(
Id_disciplina SERIAL PRIMARY KEY,
Id_curso INTEGER,
Tipo_disciplina VARCHAR(10) NOT NULL CHECK(Tipo_disciplina IN ('LEITURA', 'GRAMATICA', 'VERBAL')), 
Id_professor INTEGER NOT NULL, 
FOREIGN KEY (Id_professor) REFERENCES professor(Id_professor) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Id_curso) REFERENCES curso(Id_curso) ON DELETE CASCADE ON UPDATE CASCADE);

--POPULANDO TABLE disciplina

INSERT INTO disciplina VALUES(default,'1' ,'LEITURA' , '1');
INSERT INTO disciplina VALUES(default,'1' ,'GRAMATICA' , '1');
INSERT INTO disciplina VALUES(default,'1' ,'VERBAL' , '1');
INSERT INTO disciplina VALUES(default,'2' ,'LEITURA' , '2');
INSERT INTO disciplina VALUES(default,'2' ,'GRAMATICA' , '2');
INSERT INTO disciplina VALUES(default,'2' ,'VERBAL' , '2');
INSERT INTO disciplina VALUES(default,'3' ,'LEITURA' , '3');
INSERT INTO disciplina VALUES(default,'3' ,'GRAMATICA' , '3');
INSERT INTO disciplina VALUES(default,'3' ,'VERBAL' , '3');
INSERT INTO disciplina VALUES(default,'4' ,'LEITURA' , '4');
INSERT INTO disciplina VALUES(default,'4' ,'GRAMATICA' , '4');
INSERT INTO disciplina VALUES(default,'4' ,'VERBAL' , '4');
INSERT INTO disciplina VALUES(default,'5' ,'LEITURA' , '5');
INSERT INTO disciplina VALUES(default,'5' ,'GRAMATICA' , '5');
INSERT INTO disciplina VALUES(default,'5' ,'VERBAL' , '5');
INSERT INTO disciplina VALUES(default,'6' ,'LEITURA' , '6');
INSERT INTO disciplina VALUES(default,'6' ,'GRAMATICA' , '6');
INSERT INTO disciplina VALUES(default,'6' ,'VERBAL' , '6');
INSERT INTO disciplina VALUES(default,'7' ,'LEITURA' , '7');
INSERT INTO disciplina VALUES(default,'7' ,'GRAMATICA' , '7');
INSERT INTO disciplina VALUES(default,'7' ,'VERBAL' , '7');
INSERT INTO disciplina VALUES(default,'8' ,'LEITURA' , '8');
INSERT INTO disciplina VALUES(default,'8' ,'GRAMATICA' , '8');
INSERT INTO disciplina VALUES(default,'8' ,'VERBAL' , '8');
INSERT INTO disciplina VALUES(default,'9' ,'LEITURA' , '9');
INSERT INTO disciplina VALUES(default,'9' ,'GRAMATICA' , '9');
INSERT INTO disciplina VALUES(default,'9' ,'VERBAL' , '9');

--VIZUALIZANDO TABLE disciplina

SELECT * FROM disciplina ;

--CREATE TABLE sala

DROP TABLE IF EXISTS sala CASCADE;
CREATE TABLE sala(
Id_sala SERIAL PRIMARY KEY, 
Nome_sala VARCHAR(10) NOT NULL, 
Capacidade_sala NUMERIC(2) NOT NULL);

--POPULANDO TABLE sala

INSERT INTO sala VALUES('1' , 'A1' , '15');
INSERT INTO sala VALUES('2' , 'A2' , '15');
INSERT INTO sala VALUES('3' , 'A3' , '15');
INSERT INTO sala VALUES('4' , 'A4' , '15');
INSERT INTO sala VALUES('5' , 'A5' , '15');
INSERT INTO sala VALUES('6' , 'B1' , '15');
INSERT INTO sala VALUES('7' , 'B2' , '15');
INSERT INTO sala VALUES('8' , 'B3' , '15');
INSERT INTO sala VALUES('9' , 'B4' , '15');
INSERT INTO sala VALUES('10' , 'B5' , '15');

--VIZUALIZANDO TABLE sala

SELECT * FROM sala ;

--CREATE TABLE aula

DROP TABLE IF EXISTS aula CASCADE;
CREATE TABLE aula(
Id_aula SERIAL PRIMARY KEY,
Dt_aula DATE NOT NULL,
Horario_aula VARCHAR (20) NOT NULL,
Id_sala INTEGER, 
Id_disciplina INTEGER NOT NULL,
Id_turma INTEGER NOT NULL,
FOREIGN KEY(Id_disciplina) REFERENCES disciplina (Id_disciplina),
FOREIGN KEY(Id_turma) REFERENCES turma (Id_turma),
FOREIGN KEY(Id_sala) REFERENCES sala (Id_sala));

--POPULANDO TABLE aula

INSERT INTO aula VALUES('1', '06/02/2021' , '08:00 a 09:00' , '1' , '1' , '1');
INSERT INTO aula VALUES('2', '06/02/2021' , '08:00 a 09:00' , '2' , '4' , '2');
INSERT INTO aula VALUES('3', '06/02/2021' , '08:00 a 09:00' , '3' , '7' , '3');
INSERT INTO aula VALUES('4', '06/02/2021' , '08:00 a 09:00' , '4' , '10' , '4');
INSERT INTO aula VALUES('5', '06/02/2021' , '08:00 a 09:00' , '5' , '13' , '5');
INSERT INTO aula VALUES('6', '06/02/2021' , '08:00 a 09:00' , '6' , '16' , '6');
INSERT INTO aula VALUES('7', '06/02/2021' , '08:00 a 09:00' , '7' , '19' , '7');
INSERT INTO aula VALUES('8', '06/02/2021' , '08:00 a 09:00' , '8' , '22' , '8');
INSERT INTO aula VALUES('9', '06/02/2021' , '08:00 a 09:00' , '9' , '25' , '9');
INSERT INTO aula VALUES('10', '13/02/2021' , '08:00 a 09:00' , '1' , '1' , '1');
INSERT INTO aula VALUES('11', '13/02/2021' , '08:00 a 09:00' , '2' , '4' , '2');
INSERT INTO aula VALUES('12', '13/02/2021' , '08:00 a 09:00' , '3' , '7' , '3');
INSERT INTO aula VALUES('13', '13/02/2021' , '08:00 a 09:00' , '4' , '10' , '4');
INSERT INTO aula VALUES('14', '13/02/2021' , '08:00 a 09:00' , '5' , '13' , '5');
INSERT INTO aula VALUES('15', '13/02/2021' , '08:00 a 09:00' , '6' , '16' , '6');
INSERT INTO aula VALUES('16', '13/02/2021' , '08:00 a 09:00' , '7' , '19' , '7');
INSERT INTO aula VALUES('17', '13/02/2021' , '08:00 a 09:00' , '8' , '22' , '8');
INSERT INTO aula VALUES('18', '13/02/2021' , '08:00 a 09:00' , '9' , '25' , '9');
INSERT INTO aula VALUES('19', '20/02/2021' , '08:00 a 09:00' , '1' , '1' , '1');
INSERT INTO aula VALUES('20', '20/02/2021' , '08:00 a 09:00' , '2' , '4' , '2');
INSERT INTO aula VALUES('21', '20/02/2021' , '08:00 a 09:00' , '3' , '7' , '3');
INSERT INTO aula VALUES('22', '20/02/2021' , '08:00 a 09:00' , '4' , '10' , '4');
INSERT INTO aula VALUES('23', '20/02/2021' , '08:00 a 09:00' , '5' , '13' , '5');
INSERT INTO aula VALUES('24', '20/02/2021' , '08:00 a 09:00' , '6' , '16' , '6');
INSERT INTO aula VALUES('25', '20/02/2021' , '08:00 a 09:00' , '7' , '19' , '7');
INSERT INTO aula VALUES('26', '20/02/2021' , '08:00 a 09:00' , '8' , '22' , '8');
INSERT INTO aula VALUES('27', '20/02/2021' , '08:00 a 09:00' , '9' , '25' , '9');
INSERT INTO aula VALUES('28', '27/02/2021' , '08:00 a 09:00' , '1' , '1' , '1');
INSERT INTO aula VALUES('29', '27/02/2021' , '08:00 a 09:00' , '2' , '4' , '2');
INSERT INTO aula VALUES('30', '27/02/2021' , '08:00 a 09:00' , '3' , '7' , '3');
INSERT INTO aula VALUES('31', '27/02/2021' , '08:00 a 09:00' , '4' , '10' , '4');
INSERT INTO aula VALUES('32', '27/02/2021' , '08:00 a 09:00' , '5' , '13' , '5');
INSERT INTO aula VALUES('33', '27/02/2021' , '08:00 a 09:00' , '6' , '16' , '6');
INSERT INTO aula VALUES('34', '27/02/2021' , '08:00 a 09:00' , '7' , '19' , '7');
INSERT INTO aula VALUES('35', '27/02/2021' , '08:00 a 09:00' , '8' , '22' , '8');
INSERT INTO aula VALUES('36', '27/02/2021' , '08:00 a 09:00' , '9' , '25' , '9');
INSERT INTO aula VALUES('37', '06/03/2021' , '08:00 a 09:00' , '1' , '1' , '1');
INSERT INTO aula VALUES('38', '06/03/2021' , '08:00 a 09:00' , '2' , '4' , '2');
INSERT INTO aula VALUES('39', '06/03/2021' , '08:00 a 09:00' , '3' , '7' , '3');
INSERT INTO aula VALUES('40', '06/03/2021' , '08:00 a 09:00' , '4' , '10' , '4');
INSERT INTO aula VALUES('41', '06/03/2021' , '08:00 a 09:00' , '5' , '13' , '5');
INSERT INTO aula VALUES('42', '06/03/2021' , '08:00 a 09:00' , '6' , '16' , '6');
INSERT INTO aula VALUES('43', '06/03/2021' , '08:00 a 09:00' , '7' , '19' , '7');
INSERT INTO aula VALUES('44', '06/03/2021' , '08:00 a 09:00' , '8' , '22' , '8');
INSERT INTO aula VALUES('45', '06/03/2021' , '08:00 a 09:00' , '9' , '25' , '9');
INSERT INTO aula VALUES('46', '13/03/2021' , '08:00 a 09:00' , '1' , '1' , '1');
INSERT INTO aula VALUES('47', '13/03/2021' , '08:00 a 09:00' , '2' , '4' , '2');
INSERT INTO aula VALUES('48', '13/03/2021' , '08:00 a 09:00' , '3' , '7' , '3');
INSERT INTO aula VALUES('49', '13/03/2021' , '08:00 a 09:00' , '4' , '10' , '4');
INSERT INTO aula VALUES('50', '13/03/2021' , '08:00 a 09:00' , '5' , '13' , '5');
INSERT INTO aula VALUES('51', '13/03/2021' , '08:00 a 09:00' , '6' , '16' , '6');
INSERT INTO aula VALUES('52', '13/03/2021' , '08:00 a 09:00' , '7' , '19' , '7');
INSERT INTO aula VALUES('53', '13/03/2021' , '08:00 a 09:00' , '8' , '22' , '8');
INSERT INTO aula VALUES('54', '13/03/2021' , '08:00 a 09:00' , '9' , '25' , '9');
INSERT INTO aula VALUES('55', '20/03/2021' , '08:00 a 09:00' , '1' , '1' , '1');
INSERT INTO aula VALUES('56', '20/03/2021' , '08:00 a 09:00' , '2' , '4' , '2');
INSERT INTO aula VALUES('57', '20/03/2021' , '08:00 a 09:00' , '3' , '7' , '3');
INSERT INTO aula VALUES('58', '20/03/2021' , '08:00 a 09:00' , '4' , '10' , '4');
INSERT INTO aula VALUES('59', '20/03/2021' , '08:00 a 09:00' , '5' , '13' , '5');
INSERT INTO aula VALUES('60', '20/03/2021' , '08:00 a 09:00' , '6' , '16' , '6');
INSERT INTO aula VALUES('61', '20/03/2021' , '08:00 a 09:00' , '7' , '19' , '7');
INSERT INTO aula VALUES('62', '20/03/2021' , '08:00 a 09:00' , '8' , '22' , '8');
INSERT INTO aula VALUES('63', '20/03/2021' , '08:00 a 09:00' , '9' , '25' , '9');
INSERT INTO aula VALUES('64', '27/03/2021' , '08:00 a 09:00' , '1' , '1' , '1');
INSERT INTO aula VALUES('65', '27/03/2021' , '08:00 a 09:00' , '2' , '4' , '2');
INSERT INTO aula VALUES('66', '27/03/2021' , '08:00 a 09:00' , '3' , '7' , '3');
INSERT INTO aula VALUES('67', '27/03/2021' , '08:00 a 09:00' , '4' , '10' , '4');
INSERT INTO aula VALUES('68', '27/03/2021' , '08:00 a 09:00' , '5' , '13' , '5');
INSERT INTO aula VALUES('69', '27/03/2021' , '08:00 a 09:00' , '6' , '16' , '6');
INSERT INTO aula VALUES('70', '27/03/2021' , '08:00 a 09:00' , '7' , '19' , '7');
INSERT INTO aula VALUES('71', '27/03/2021' , '08:00 a 09:00' , '8' , '22' , '8');
INSERT INTO aula VALUES('72', '27/03/2021' , '08:00 a 09:00' , '9' , '25' , '9');
INSERT INTO aula VALUES('73', '03/04/2021' , '08:00 a 09:00' , '1' , '1' , '1');
INSERT INTO aula VALUES('74', '03/04/2021' , '08:00 a 09:00' , '2' , '4' , '2');
INSERT INTO aula VALUES('75', '03/04/2021' , '08:00 a 09:00' , '3' , '7' , '3');
INSERT INTO aula VALUES('76', '03/04/2021' , '08:00 a 09:00' , '4' , '10' , '4');
INSERT INTO aula VALUES('77', '03/04/2021' , '08:00 a 09:00' , '5' , '13' , '5');
INSERT INTO aula VALUES('78', '03/04/2021' , '08:00 a 09:00' , '6' , '16' , '6');
INSERT INTO aula VALUES('79', '03/04/2021' , '08:00 a 09:00' , '7' , '19' , '7');
INSERT INTO aula VALUES('80', '03/04/2021' , '08:00 a 09:00' , '8' , '22' , '8');
INSERT INTO aula VALUES('81', '03/04/2021' , '08:00 a 09:00' , '9' , '25' , '9');
INSERT INTO aula VALUES('82', '10/04/2021' , '08:00 a 09:00' , '1' , '1' , '1');
INSERT INTO aula VALUES('83', '10/04/2021' , '08:00 a 09:00' , '2' , '4' , '2');
INSERT INTO aula VALUES('84', '10/04/2021' , '08:00 a 09:00' , '3' , '7' , '3');
INSERT INTO aula VALUES('85', '10/04/2021' , '08:00 a 09:00' , '4' , '10' , '4');
INSERT INTO aula VALUES('86', '10/04/2021' , '08:00 a 09:00' , '5' , '13' , '5');
INSERT INTO aula VALUES('87', '10/04/2021' , '08:00 a 09:00' , '6' , '16' , '6');
INSERT INTO aula VALUES('88', '10/04/2021' , '08:00 a 09:00' , '7' , '19' , '7');
INSERT INTO aula VALUES('89', '10/04/2021' , '08:00 a 09:00' , '8' , '22' , '8');
INSERT INTO aula VALUES('90', '10/04/2021' , '08:00 a 09:00' , '9' , '25' , '9');
INSERT INTO aula VALUES('91', '06/02/2021' , '09:00 a 10:00' , '1' , '2' , '1');
INSERT INTO aula VALUES('92', '06/02/2021' , '09:00 a 10:00' , '2' , '5' , '2');
INSERT INTO aula VALUES('93', '06/02/2021' , '09:00 a 10:00' , '3' , '8' , '3');
INSERT INTO aula VALUES('94', '06/02/2021' , '09:00 a 10:00' , '4' , '11' , '4');
INSERT INTO aula VALUES('95', '06/02/2021' , '09:00 a 10:00' , '5' , '14' , '5');
INSERT INTO aula VALUES('96', '06/02/2021' , '09:00 a 10:00' , '6' , '17' , '6');
INSERT INTO aula VALUES('97', '06/02/2021' , '09:00 a 10:00' , '7' , '20' , '7');
INSERT INTO aula VALUES('98', '06/02/2021' , '09:00 a 10:00' , '8' , '23' , '8');
INSERT INTO aula VALUES('99', '06/02/2021' , '09:00 a 10:00' , '9' , '26' , '9');
INSERT INTO aula VALUES('100', '13/02/2021' , '09:00 a 10:00' , '1' , '2' , '1');
INSERT INTO aula VALUES('101', '13/02/2021' , '09:00 a 10:00' , '2' , '5' , '2');
INSERT INTO aula VALUES('102', '13/02/2021' , '09:00 a 10:00' , '3' , '8' , '3');
INSERT INTO aula VALUES('103', '13/02/2021' , '09:00 a 10:00' , '4' , '11' , '4');
INSERT INTO aula VALUES('104', '13/02/2021' , '09:00 a 10:00' , '5' , '14' , '5');
INSERT INTO aula VALUES('105', '13/02/2021' , '09:00 a 10:00' , '6' , '17' , '6');
INSERT INTO aula VALUES('106', '13/02/2021' , '09:00 a 10:00' , '7' , '20' , '7');
INSERT INTO aula VALUES('107', '13/02/2021' , '09:00 a 10:00' , '8' , '23' , '8');
INSERT INTO aula VALUES('108', '13/02/2021' , '09:00 a 10:00' , '9' , '26' , '9');
INSERT INTO aula VALUES('109', '20/02/2021' , '09:00 a 10:00' , '1' , '2' , '1');
INSERT INTO aula VALUES('110', '20/02/2021' , '09:00 a 10:00' , '2' , '5' , '2');
INSERT INTO aula VALUES('111', '20/02/2021' , '09:00 a 10:00' , '3' , '8' , '3');
INSERT INTO aula VALUES('112', '20/02/2021' , '09:00 a 10:00' , '4' , '11' , '4');
INSERT INTO aula VALUES('113', '20/02/2021' , '09:00 a 10:00' , '5' , '14' , '5');
INSERT INTO aula VALUES('114', '20/02/2021' , '09:00 a 10:00' , '6' , '17' , '6');
INSERT INTO aula VALUES('115', '20/02/2021' , '09:00 a 10:00' , '7' , '20' , '7');
INSERT INTO aula VALUES('116', '20/02/2021' , '09:00 a 10:00' , '8' , '23' , '8');
INSERT INTO aula VALUES('117', '20/02/2021' , '09:00 a 10:00' , '9' , '26' , '9');
INSERT INTO aula VALUES('118', '27/02/2021' , '09:00 a 10:00' , '1' , '2' , '1');
INSERT INTO aula VALUES('119', '27/02/2021' , '09:00 a 10:00' , '2' , '5' , '2');
INSERT INTO aula VALUES('120', '27/02/2021' , '09:00 a 10:00' , '3' , '8' , '3');
INSERT INTO aula VALUES('121', '27/02/2021' , '09:00 a 10:00' , '4' , '11' , '4');
INSERT INTO aula VALUES('122', '27/02/2021' , '09:00 a 10:00' , '5' , '14' , '5');
INSERT INTO aula VALUES('123', '27/02/2021' , '09:00 a 10:00' , '6' , '17' , '6');
INSERT INTO aula VALUES('124', '27/02/2021' , '09:00 a 10:00' , '7' , '20' , '7');
INSERT INTO aula VALUES('125', '27/02/2021' , '09:00 a 10:00' , '8' , '23' , '8');
INSERT INTO aula VALUES('126', '27/02/2021' , '09:00 a 10:00' , '9' , '26' , '9');
INSERT INTO aula VALUES('127', '06/03/2021' , '09:00 a 10:00' , '1' , '2' , '1');
INSERT INTO aula VALUES('128', '06/03/2021' , '09:00 a 10:00' , '2' , '5' , '2');
INSERT INTO aula VALUES('129', '06/03/2021' , '09:00 a 10:00' , '3' , '8' , '3');
INSERT INTO aula VALUES('130', '06/03/2021' , '09:00 a 10:00' , '4' , '11' , '4');
INSERT INTO aula VALUES('131', '06/03/2021' , '09:00 a 10:00' , '5' , '14' , '5');
INSERT INTO aula VALUES('132', '06/03/2021' , '09:00 a 10:00' , '6' , '17' , '6');
INSERT INTO aula VALUES('133', '06/03/2021' , '09:00 a 10:00' , '7' , '20' , '7');
INSERT INTO aula VALUES('134', '06/03/2021' , '09:00 a 10:00' , '8' , '23' , '8');
INSERT INTO aula VALUES('135', '06/03/2021' , '09:00 a 10:00' , '9' , '26' , '9');
INSERT INTO aula VALUES('136', '13/03/2021' , '09:00 a 10:00' , '1' , '2' , '1');
INSERT INTO aula VALUES('137', '13/03/2021' , '09:00 a 10:00' , '2' , '5' , '2');
INSERT INTO aula VALUES('138', '13/03/2021' , '09:00 a 10:00' , '3' , '8' , '3');
INSERT INTO aula VALUES('139', '13/03/2021' , '09:00 a 10:00' , '4' , '11' , '4');
INSERT INTO aula VALUES('140', '13/03/2021' , '09:00 a 10:00' , '5' , '14' , '5');
INSERT INTO aula VALUES('141', '13/03/2021' , '09:00 a 10:00' , '6' , '17' , '6');
INSERT INTO aula VALUES('142', '13/03/2021' , '09:00 a 10:00' , '7' , '20' , '7');
INSERT INTO aula VALUES('143', '13/03/2021' , '09:00 a 10:00' , '8' , '23' , '8');
INSERT INTO aula VALUES('144', '13/03/2021' , '09:00 a 10:00' , '9' , '26' , '9');
INSERT INTO aula VALUES('145', '20/03/2021' , '09:00 a 10:00' , '1' , '2' , '1');
INSERT INTO aula VALUES('146', '20/03/2021' , '09:00 a 10:00' , '2' , '5' , '2');
INSERT INTO aula VALUES('147', '20/03/2021' , '09:00 a 10:00' , '3' , '8' , '3');
INSERT INTO aula VALUES('148', '20/03/2021' , '09:00 a 10:00' , '4' , '11' , '4');
INSERT INTO aula VALUES('149', '20/03/2021' , '09:00 a 10:00' , '5' , '14' , '5');
INSERT INTO aula VALUES('150', '20/03/2021' , '09:00 a 10:00' , '6' , '17' , '6');
INSERT INTO aula VALUES('151', '20/03/2021' , '09:00 a 10:00' , '7' , '20' , '7');
INSERT INTO aula VALUES('152', '20/03/2021' , '09:00 a 10:00' , '8' , '23' , '8');
INSERT INTO aula VALUES('153', '20/03/2021' , '09:00 a 10:00' , '9' , '26' , '9');
INSERT INTO aula VALUES('154', '27/03/2021' , '09:00 a 10:00' , '1' , '2' , '1');
INSERT INTO aula VALUES('155', '27/03/2021' , '09:00 a 10:00' , '2' , '5' , '2');
INSERT INTO aula VALUES('156', '27/03/2021' , '09:00 a 10:00' , '3' , '8' , '3');
INSERT INTO aula VALUES('157', '27/03/2021' , '09:00 a 10:00' , '4' , '11' , '4');
INSERT INTO aula VALUES('158', '27/03/2021' , '09:00 a 10:00' , '5' , '14' , '5');
INSERT INTO aula VALUES('159', '27/03/2021' , '09:00 a 10:00' , '6' , '17' , '6');
INSERT INTO aula VALUES('160', '27/03/2021' , '09:00 a 10:00' , '7' , '20' , '7');
INSERT INTO aula VALUES('161', '27/03/2021' , '09:00 a 10:00' , '8' , '23' , '8');
INSERT INTO aula VALUES('162', '27/03/2021' , '09:00 a 10:00' , '9' , '26' , '9');
INSERT INTO aula VALUES('163', '03/04/2021' , '09:00 a 10:00' , '1' , '2' , '1');
INSERT INTO aula VALUES('164', '03/04/2021' , '09:00 a 10:00' , '2' , '5' , '2');
INSERT INTO aula VALUES('165', '03/04/2021' , '09:00 a 10:00' , '3' , '8' , '3');
INSERT INTO aula VALUES('166', '03/04/2021' , '09:00 a 10:00' , '4' , '11' , '4');
INSERT INTO aula VALUES('167', '03/04/2021' , '09:00 a 10:00' , '5' , '14' , '5');
INSERT INTO aula VALUES('168', '03/04/2021' , '09:00 a 10:00' , '6' , '17' , '6');
INSERT INTO aula VALUES('169', '03/04/2021' , '09:00 a 10:00' , '7' , '20' , '7');
INSERT INTO aula VALUES('170', '03/04/2021' , '09:00 a 10:00' , '8' , '23' , '8');
INSERT INTO aula VALUES('171', '03/04/2021' , '09:00 a 10:00' , '9' , '26' , '9');
INSERT INTO aula VALUES('172', '10/04/2021' , '09:00 a 10:00' , '1' , '2' , '1');
INSERT INTO aula VALUES('173', '10/04/2021' , '09:00 a 10:00' , '2' , '5' , '2');
INSERT INTO aula VALUES('174', '10/04/2021' , '09:00 a 10:00' , '3' , '8' , '3');
INSERT INTO aula VALUES('175', '10/04/2021' , '09:00 a 10:00' , '4' , '11' , '4');
INSERT INTO aula VALUES('176', '10/04/2021' , '09:00 a 10:00' , '5' , '14' , '5');
INSERT INTO aula VALUES('177', '10/04/2021' , '09:00 a 10:00' , '6' , '17' , '6');
INSERT INTO aula VALUES('178', '10/04/2021' , '09:00 a 10:00' , '7' , '20' , '7');
INSERT INTO aula VALUES('179', '10/04/2021' , '09:00 a 10:00' , '8' , '23' , '8');
INSERT INTO aula VALUES('180', '10/04/2021' , '09:00 a 10:00' , '9' , '26' , '9');
INSERT INTO aula VALUES('181', '06/02/2021' , '10:00 a 11:00' , '1' , '3' , '1');
INSERT INTO aula VALUES('182', '06/02/2021' , '10:00 a 11:00' , '2' , '6' , '2');
INSERT INTO aula VALUES('183', '06/02/2021' , '10:00 a 11:00' , '3' , '9' , '3');
INSERT INTO aula VALUES('184', '06/02/2021' , '10:00 a 11:00' , '4' , '12' , '4');
INSERT INTO aula VALUES('185', '06/02/2021' , '10:00 a 11:00' , '5' , '15' , '5');
INSERT INTO aula VALUES('186', '06/02/2021' , '10:00 a 11:00' , '6' , '18' , '6');
INSERT INTO aula VALUES('187', '06/02/2021' , '10:00 a 11:00' , '7' , '21' , '7');
INSERT INTO aula VALUES('188', '06/02/2021' , '10:00 a 11:00' , '8' , '24' , '8');
INSERT INTO aula VALUES('189', '06/02/2021' , '10:00 a 11:00' , '9' , '27' , '9');
INSERT INTO aula VALUES('190', '13/02/2021' , '10:00 a 11:00' , '1' , '3' , '1');
INSERT INTO aula VALUES('191', '13/02/2021' , '10:00 a 11:00' , '2' , '6' , '2');
INSERT INTO aula VALUES('192', '13/02/2021' , '10:00 a 11:00' , '3' , '9' , '3');
INSERT INTO aula VALUES('193', '13/02/2021' , '10:00 a 11:00' , '4' , '12' , '4');
INSERT INTO aula VALUES('194', '13/02/2021' , '10:00 a 11:00' , '5' , '15' , '5');
INSERT INTO aula VALUES('195', '13/02/2021' , '10:00 a 11:00' , '6' , '18' , '6');
INSERT INTO aula VALUES('196', '13/02/2021' , '10:00 a 11:00' , '7' , '21' , '7');
INSERT INTO aula VALUES('197', '13/02/2021' , '10:00 a 11:00' , '8' , '24' , '8');
INSERT INTO aula VALUES('198', '13/02/2021' , '10:00 a 11:00' , '9' , '27' , '9');
INSERT INTO aula VALUES('199', '20/02/2021' , '10:00 a 11:00' , '1' , '3' , '1');
INSERT INTO aula VALUES('200', '20/02/2021' , '10:00 a 11:00' , '2' , '6' , '2');
INSERT INTO aula VALUES('201', '20/02/2021' , '10:00 a 11:00' , '3' , '9' , '3');
INSERT INTO aula VALUES('202', '20/02/2021' , '10:00 a 11:00' , '4' , '12' , '4');
INSERT INTO aula VALUES('203', '20/02/2021' , '10:00 a 11:00' , '5' , '15' , '5');
INSERT INTO aula VALUES('204', '20/02/2021' , '10:00 a 11:00' , '6' , '18' , '6');
INSERT INTO aula VALUES('205', '20/02/2021' , '10:00 a 11:00' , '7' , '21' , '7');
INSERT INTO aula VALUES('206', '20/02/2021' , '10:00 a 11:00' , '8' , '24' , '8');
INSERT INTO aula VALUES('207', '20/02/2021' , '10:00 a 11:00' , '9' , '27' , '9');
INSERT INTO aula VALUES('208', '27/02/2021' , '10:00 a 11:00' , '1' , '3' , '1');
INSERT INTO aula VALUES('209', '27/02/2021' , '10:00 a 11:00' , '2' , '6' , '2');
INSERT INTO aula VALUES('210', '27/02/2021' , '10:00 a 11:00' , '3' , '9' , '3');
INSERT INTO aula VALUES('211', '27/02/2021' , '10:00 a 11:00' , '4' , '12' , '4');
INSERT INTO aula VALUES('212', '27/02/2021' , '10:00 a 11:00' , '5' , '15' , '5');
INSERT INTO aula VALUES('213', '27/02/2021' , '10:00 a 11:00' , '6' , '18' , '6');
INSERT INTO aula VALUES('214', '27/02/2021' , '10:00 a 11:00' , '7' , '21' , '7');
INSERT INTO aula VALUES('215', '27/02/2021' , '10:00 a 11:00' , '8' , '24' , '8');
INSERT INTO aula VALUES('216', '27/02/2021' , '10:00 a 11:00' , '9' , '27' , '9');
INSERT INTO aula VALUES('217', '06/03/2021' , '10:00 a 11:00' , '1' , '3' , '1');
INSERT INTO aula VALUES('218', '06/03/2021' , '10:00 a 11:00' , '2' , '6' , '2');
INSERT INTO aula VALUES('219', '06/03/2021' , '10:00 a 11:00' , '3' , '9' , '3');
INSERT INTO aula VALUES('220', '06/03/2021' , '10:00 a 11:00' , '4' , '12' , '4');
INSERT INTO aula VALUES('221', '06/03/2021' , '10:00 a 11:00' , '5' , '15' , '5');
INSERT INTO aula VALUES('222', '06/03/2021' , '10:00 a 11:00' , '6' , '18' , '6');
INSERT INTO aula VALUES('223', '06/03/2021' , '10:00 a 11:00' , '7' , '21' , '7');
INSERT INTO aula VALUES('224', '06/03/2021' , '10:00 a 11:00' , '8' , '24' , '8');
INSERT INTO aula VALUES('225', '06/03/2021' , '10:00 a 11:00' , '9' , '27' , '9');
INSERT INTO aula VALUES('226', '13/03/2021' , '10:00 a 11:00' , '1' , '3' , '1');
INSERT INTO aula VALUES('227', '13/03/2021' , '10:00 a 11:00' , '2' , '6' , '2');
INSERT INTO aula VALUES('228', '13/03/2021' , '10:00 a 11:00' , '3' , '9' , '3');
INSERT INTO aula VALUES('229', '13/03/2021' , '10:00 a 11:00' , '4' , '12' , '4');
INSERT INTO aula VALUES('230', '13/03/2021' , '10:00 a 11:00' , '5' , '15' , '5');
INSERT INTO aula VALUES('231', '13/03/2021' , '10:00 a 11:00' , '6' , '18' , '6');
INSERT INTO aula VALUES('232', '13/03/2021' , '10:00 a 11:00' , '7' , '21' , '7');
INSERT INTO aula VALUES('233', '13/03/2021' , '10:00 a 11:00' , '8' , '24' , '8');
INSERT INTO aula VALUES('234', '13/03/2021' , '10:00 a 11:00' , '9' , '27' , '9');
INSERT INTO aula VALUES('235', '20/03/2021' , '10:00 a 11:00' , '1' , '3' , '1');
INSERT INTO aula VALUES('236', '20/03/2021' , '10:00 a 11:00' , '2' , '6' , '2');
INSERT INTO aula VALUES('237', '20/03/2021' , '10:00 a 11:00' , '3' , '9' , '3');
INSERT INTO aula VALUES('238', '20/03/2021' , '10:00 a 11:00' , '4' , '12' , '4');
INSERT INTO aula VALUES('239', '20/03/2021' , '10:00 a 11:00' , '5' , '15' , '5');
INSERT INTO aula VALUES('240', '20/03/2021' , '10:00 a 11:00' , '6' , '18' , '6');
INSERT INTO aula VALUES('241', '20/03/2021' , '10:00 a 11:00' , '7' , '21' , '7');
INSERT INTO aula VALUES('242', '20/03/2021' , '10:00 a 11:00' , '8' , '24' , '8');
INSERT INTO aula VALUES('243', '20/03/2021' , '10:00 a 11:00' , '9' , '27' , '9');
INSERT INTO aula VALUES('244', '27/03/2021' , '10:00 a 11:00' , '1' , '3' , '1');
INSERT INTO aula VALUES('245', '27/03/2021' , '10:00 a 11:00' , '2' , '6' , '2');
INSERT INTO aula VALUES('246', '27/03/2021' , '10:00 a 11:00' , '3' , '9' , '3');
INSERT INTO aula VALUES('247', '27/03/2021' , '10:00 a 11:00' , '4' , '12' , '4');
INSERT INTO aula VALUES('248', '27/03/2021' , '10:00 a 11:00' , '5' , '15' , '5');
INSERT INTO aula VALUES('249', '27/03/2021' , '10:00 a 11:00' , '6' , '18' , '6');
INSERT INTO aula VALUES('250', '27/03/2021' , '10:00 a 11:00' , '7' , '21' , '7');
INSERT INTO aula VALUES('251', '27/03/2021' , '10:00 a 11:00' , '8' , '24' , '8');
INSERT INTO aula VALUES('252', '27/03/2021' , '10:00 a 11:00' , '9' , '27' , '9');
INSERT INTO aula VALUES('253', '03/04/2021' , '10:00 a 11:00' , '1' , '3' , '1');
INSERT INTO aula VALUES('254', '03/04/2021' , '10:00 a 11:00' , '2' , '6' , '2');
INSERT INTO aula VALUES('255', '03/04/2021' , '10:00 a 11:00' , '3' , '9' , '3');
INSERT INTO aula VALUES('256', '03/04/2021' , '10:00 a 11:00' , '4' , '12' , '4');
INSERT INTO aula VALUES('257', '03/04/2021' , '10:00 a 11:00' , '5' , '15' , '5');
INSERT INTO aula VALUES('258', '03/04/2021' , '10:00 a 11:00' , '6' , '18' , '6');
INSERT INTO aula VALUES('259', '03/04/2021' , '10:00 a 11:00' , '7' , '21' , '7');
INSERT INTO aula VALUES('260', '03/04/2021' , '10:00 a 11:00' , '8' , '24' , '8');
INSERT INTO aula VALUES('261', '03/04/2021' , '10:00 a 11:00' , '9' , '27' , '9');
INSERT INTO aula VALUES('262', '10/04/2021' , '10:00 a 11:00' , '1' , '3' , '1');
INSERT INTO aula VALUES('263', '10/04/2021' , '10:00 a 11:00' , '2' , '6' , '2');
INSERT INTO aula VALUES('264', '10/04/2021' , '10:00 a 11:00' , '3' , '9' , '3');
INSERT INTO aula VALUES('265', '10/04/2021' , '10:00 a 11:00' , '4' , '12' , '4');
INSERT INTO aula VALUES('266', '10/04/2021' , '10:00 a 11:00' , '5' , '15' , '5');
INSERT INTO aula VALUES('267', '10/04/2021' , '10:00 a 11:00' , '6' , '18' , '6');
INSERT INTO aula VALUES('268', '10/04/2021' , '10:00 a 11:00' , '7' , '21' , '7');
INSERT INTO aula VALUES('269', '10/04/2021' , '10:00 a 11:00' , '8' , '24' , '8');
INSERT INTO aula VALUES('270', '10/04/2021' , '10:00 a 11:00' , '9' , '27' , '9');

--VIZUALIZANDO TABLE aula

SELECT * FROM aula ;

--CREATE TABLE matricula

DROP TABLE IF EXISTS matricula CASCADE;
CREATE TABLE matricula(
Id_curso INTEGER, 
Num_matricula INTEGER, 
Dt_inicio_matricula DATE NOT NULL, 
Dt_final_matricula DATE,
Status_matricula VARCHAR(20) NOT NULL CHECK (Status_matricula IN ('Em andamento', 'Formado', 'Trancado', 'Cancelado')),
FOREIGN KEY (Id_curso) REFERENCES curso(Id_curso) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Num_matricula) REFERENCES alunos(Num_matricula) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (Id_curso, Num_matricula),
CHECK(Dt_inicio_matricula < Dt_final_matricula));

--POPULANDO TABLE matricula

INSERT INTO matricula VALUES('1' , '1' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('1' , '2' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('1' , '3' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('1' , '4' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('1' , '5' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('1' , '6' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('1' , '7' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('1' , '8' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('1' , '9' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('2' , '10' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('2' , '11' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('2' , '12' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('2' , '13' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('2' , '14' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('2' , '15' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('2' , '16' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('2' , '17' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('2' , '18' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('3' , '19' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('3' , '20' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('3' , '21' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('3' , '22' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('3' , '23' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('3' , '24' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('3' , '25' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('3' , '26' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('3' , '27' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('4' , '28' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('4' , '29' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('4' , '30' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('4' , '31' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('4' , '32' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('4' , '33' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('4' , '34' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('4' , '35' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('4' , '36' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('5' , '37' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('5' , '38' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('5' , '39' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('5' , '40' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('5' , '41' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('5' , '42' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('5' , '43' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('5' , '44' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('5' , '45' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('6' , '46' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('6' , '47' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('6' , '48' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('6' , '49' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('6' , '50' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('6' , '51' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('6' , '52' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('6' , '53' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('6' , '54' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('7' , '55' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('7' , '56' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('7' , '57' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('7' , '58' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('7' , '59' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('7' , '60' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('7' , '61' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('7' , '62' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('7' , '63' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('8' , '64' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('8' , '65' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('8' , '66' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('8' , '67' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('8' , '68' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('8' , '69' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('8' , '70' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('8' , '71' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('8' , '72' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('9' , '73' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('9' , '74' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('9' , '75' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('9' , '76' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('9' , '77' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('9' , '78' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('9' , '79' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('9' , '80' , '30/11/2020' , '30/11/2021' , 'Formado');
INSERT INTO matricula VALUES('9' , '81' , '30/11/2020' , '30/11/2021' , 'Formado');

--VIZUALIZANDO TABLE matricula

SELECT * FROM matricula ;

--CREATE TABLE turma_aluno

DROP TABLE IF EXISTS turma_aluno CASCADE;
CREATE TABLE turma_aluno(
Id_turma INTEGER, 
Num_matricula INTEGER,
FOREIGN KEY (Id_turma) REFERENCES turma(Id_turma) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Num_matricula) REFERENCES alunos(Num_matricula) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (Id_turma, Num_matricula)); 

--POPULANDO TABLE turma_aluno

INSERT INTO turma_aluno VALUES('1' , '1');
INSERT INTO turma_aluno VALUES('1' , '2');
INSERT INTO turma_aluno VALUES('1' , '3');
INSERT INTO turma_aluno VALUES('1' , '4');
INSERT INTO turma_aluno VALUES('1' , '5');
INSERT INTO turma_aluno VALUES('1' , '6');
INSERT INTO turma_aluno VALUES('1' , '7');
INSERT INTO turma_aluno VALUES('1' , '8');
INSERT INTO turma_aluno VALUES('1' , '9');
INSERT INTO turma_aluno VALUES('2' , '10');
INSERT INTO turma_aluno VALUES('2' , '11');
INSERT INTO turma_aluno VALUES('2' , '12');
INSERT INTO turma_aluno VALUES('2' , '13');
INSERT INTO turma_aluno VALUES('2' , '14');
INSERT INTO turma_aluno VALUES('2' , '15');
INSERT INTO turma_aluno VALUES('2' , '16');
INSERT INTO turma_aluno VALUES('2' , '17');
INSERT INTO turma_aluno VALUES('2' , '18');
INSERT INTO turma_aluno VALUES('3' , '19');
INSERT INTO turma_aluno VALUES('3' , '20');
INSERT INTO turma_aluno VALUES('3' , '21');
INSERT INTO turma_aluno VALUES('3' , '22');
INSERT INTO turma_aluno VALUES('3' , '23');
INSERT INTO turma_aluno VALUES('3' , '24');
INSERT INTO turma_aluno VALUES('3' , '25');
INSERT INTO turma_aluno VALUES('3' , '26');
INSERT INTO turma_aluno VALUES('3' , '27');
INSERT INTO turma_aluno VALUES('4' , '28');
INSERT INTO turma_aluno VALUES('4' , '29');
INSERT INTO turma_aluno VALUES('4' , '30');
INSERT INTO turma_aluno VALUES('4' , '31');
INSERT INTO turma_aluno VALUES('4' , '32');
INSERT INTO turma_aluno VALUES('4' , '33');
INSERT INTO turma_aluno VALUES('4' , '34');
INSERT INTO turma_aluno VALUES('4' , '35');
INSERT INTO turma_aluno VALUES('4' , '36');
INSERT INTO turma_aluno VALUES('5' , '37');
INSERT INTO turma_aluno VALUES('5' , '38');
INSERT INTO turma_aluno VALUES('5' , '39');
INSERT INTO turma_aluno VALUES('5' , '40');
INSERT INTO turma_aluno VALUES('5' , '41');
INSERT INTO turma_aluno VALUES('5' , '42');
INSERT INTO turma_aluno VALUES('5' , '43');
INSERT INTO turma_aluno VALUES('5' , '44');
INSERT INTO turma_aluno VALUES('5' , '45');
INSERT INTO turma_aluno VALUES('6' , '46');
INSERT INTO turma_aluno VALUES('6' , '47');
INSERT INTO turma_aluno VALUES('6' , '48');
INSERT INTO turma_aluno VALUES('6' , '49');
INSERT INTO turma_aluno VALUES('6' , '50');
INSERT INTO turma_aluno VALUES('6' , '51');
INSERT INTO turma_aluno VALUES('6' , '52');
INSERT INTO turma_aluno VALUES('6' , '53');
INSERT INTO turma_aluno VALUES('6' , '54');
INSERT INTO turma_aluno VALUES('7' , '55');
INSERT INTO turma_aluno VALUES('7' , '56');
INSERT INTO turma_aluno VALUES('7' , '57');
INSERT INTO turma_aluno VALUES('7' , '58');
INSERT INTO turma_aluno VALUES('7' , '59');
INSERT INTO turma_aluno VALUES('7' , '60');
INSERT INTO turma_aluno VALUES('7' , '61');
INSERT INTO turma_aluno VALUES('7' , '62');
INSERT INTO turma_aluno VALUES('7' , '63');
INSERT INTO turma_aluno VALUES('8' , '64');
INSERT INTO turma_aluno VALUES('8' , '65');
INSERT INTO turma_aluno VALUES('8' , '66');
INSERT INTO turma_aluno VALUES('8' , '67');
INSERT INTO turma_aluno VALUES('8' , '68');
INSERT INTO turma_aluno VALUES('8' , '69');
INSERT INTO turma_aluno VALUES('8' , '70');
INSERT INTO turma_aluno VALUES('8' , '71');
INSERT INTO turma_aluno VALUES('8' , '72');
INSERT INTO turma_aluno VALUES('8' , '73');
INSERT INTO turma_aluno VALUES('9' , '74');
INSERT INTO turma_aluno VALUES('9' , '75');
INSERT INTO turma_aluno VALUES('9' , '76');
INSERT INTO turma_aluno VALUES('9' , '77');
INSERT INTO turma_aluno VALUES('9' , '78');
INSERT INTO turma_aluno VALUES('9' , '79');
INSERT INTO turma_aluno VALUES('9' , '80');
INSERT INTO turma_aluno VALUES('9' , '81');

--VIZUALIZANDO TABLE turma_aluno

SELECT * FROM turma_aluno ;

--CREATE TABLE turma_disciplina

DROP TABLE IF EXISTS turma_disciplina CASCADE;
CREATE TABLE turma_disciplina(
Id_disciplina INTEGER, 
Id_turma INTEGER,
FOREIGN KEY (Id_disciplina) REFERENCES disciplina(Id_disciplina) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Id_turma) REFERENCES turma(Id_turma) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (Id_disciplina, Id_turma));

--POPULANDO TABLE turma_disciplina

INSERT INTO turma_disciplina VALUES('1' , '1');
INSERT INTO turma_disciplina VALUES('1' , '2');
INSERT INTO turma_disciplina VALUES('1' , '3');
INSERT INTO turma_disciplina VALUES('1' , '4');
INSERT INTO turma_disciplina VALUES('1' , '5');
INSERT INTO turma_disciplina VALUES('1' , '6');
INSERT INTO turma_disciplina VALUES('1' , '7');
INSERT INTO turma_disciplina VALUES('1' , '8');
INSERT INTO turma_disciplina VALUES('1' , '9');
INSERT INTO turma_disciplina VALUES('2' , '1');
INSERT INTO turma_disciplina VALUES('2' , '2');
INSERT INTO turma_disciplina VALUES('2' , '3');
INSERT INTO turma_disciplina VALUES('2' , '4');
INSERT INTO turma_disciplina VALUES('2' , '5');
INSERT INTO turma_disciplina VALUES('2' , '6');
INSERT INTO turma_disciplina VALUES('2' , '7');
INSERT INTO turma_disciplina VALUES('2' , '8');
INSERT INTO turma_disciplina VALUES('2' , '9');
INSERT INTO turma_disciplina VALUES('3' , '1');
INSERT INTO turma_disciplina VALUES('3' , '2');
INSERT INTO turma_disciplina VALUES('3' , '3');
INSERT INTO turma_disciplina VALUES('3' , '4');
INSERT INTO turma_disciplina VALUES('3' , '5');
INSERT INTO turma_disciplina VALUES('3' , '6');
INSERT INTO turma_disciplina VALUES('3' , '7');
INSERT INTO turma_disciplina VALUES('3' , '8');
INSERT INTO turma_disciplina VALUES('3' , '9');

--VIZUALIZANDO TABLE turma_disciplina

SELECT * FROM turma_disciplina ;

--CREATE TABLE curso_professor

DROP TABLE IF EXISTS curso_professor CASCADE;
CREATE TABLE curso_professor(
Id_curso INTEGER,
Id_professor INTEGER,
FOREIGN KEY (Id_curso) REFERENCES curso(Id_curso) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Id_professor) REFERENCES professor(Id_professor) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (Id_curso, Id_professor));

--POPULANDO TABLE curso_professor

INSERT INTO curso_professor VALUES('1' , '1');
INSERT INTO curso_professor VALUES('2' , '2');
INSERT INTO curso_professor VALUES('3' , '3');
INSERT INTO curso_professor VALUES('4' , '4');
INSERT INTO curso_professor VALUES('5' , '5');
INSERT INTO curso_professor VALUES('6' , '6');
INSERT INTO curso_professor VALUES('7' , '7');
INSERT INTO curso_professor VALUES('8' , '8');
INSERT INTO curso_professor VALUES('9' , '9');

--CREATE TABLE frequencia

DROP TABLE IF EXISTS frequencia CASCADE;
CREATE TABLE frequencia(
Num_matricula INTEGER, 
Id_aula INTEGER, 
presença VARCHAR(2) NOT NULL CHECK (presença IN('P', 'AI', 'AJ')),
FOREIGN KEY (Num_matricula) REFERENCES alunos(Num_matricula) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Id_aula) REFERENCES aula (Id_aula) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (Num_matricula, Id_aula));

--POPULANDO TABLE frequencia

INSERT INTO frequencia VALUES('1' , '1' , 'P');
INSERT INTO frequencia VALUES('2' , '1' , 'P');
INSERT INTO frequencia VALUES('3' , '1' , 'P');
INSERT INTO frequencia VALUES('4' , '1' , 'P');
INSERT INTO frequencia VALUES('5' , '1' , 'P');
INSERT INTO frequencia VALUES('6' , '1' , 'P');
INSERT INTO frequencia VALUES('7' , '1' , 'P');
INSERT INTO frequencia VALUES('8' , '1' , 'P');
INSERT INTO frequencia VALUES('9' , '1' , 'P');
INSERT INTO frequencia VALUES('10' , '1' , 'P');
INSERT INTO frequencia VALUES('1' , '2' , 'P');
INSERT INTO frequencia VALUES('2' , '2' , 'P');
INSERT INTO frequencia VALUES('3' , '2' , 'P');
INSERT INTO frequencia VALUES('4' , '2' , 'P');
INSERT INTO frequencia VALUES('5' , '2' , 'P');
INSERT INTO frequencia VALUES('6' , '2' , 'P');
INSERT INTO frequencia VALUES('7' , '2' , 'P');
INSERT INTO frequencia VALUES('8' , '2' , 'P');
INSERT INTO frequencia VALUES('9' , '2' , 'P');
INSERT INTO frequencia VALUES('10' , '2' , 'P');
INSERT INTO frequencia VALUES('1' , '3' , 'P');
INSERT INTO frequencia VALUES('2' , '3' , 'P');
INSERT INTO frequencia VALUES('3' , '3' , 'P');
INSERT INTO frequencia VALUES('4' , '3' , 'P');
INSERT INTO frequencia VALUES('5' , '3' , 'P');
INSERT INTO frequencia VALUES('6' , '3' , 'P');
INSERT INTO frequencia VALUES('7' , '3' , 'P');
INSERT INTO frequencia VALUES('8' , '3' , 'P');
INSERT INTO frequencia VALUES('9' , '3' , 'P');
INSERT INTO frequencia VALUES('10' , '3' , 'P');
INSERT INTO frequencia VALUES('1' , '4' , 'P');
INSERT INTO frequencia VALUES('2' , '4' , 'P');
INSERT INTO frequencia VALUES('3' , '4' , 'P');
INSERT INTO frequencia VALUES('4' , '4' , 'P');
INSERT INTO frequencia VALUES('5' , '4' , 'P');
INSERT INTO frequencia VALUES('6' , '4' , 'P');
INSERT INTO frequencia VALUES('7' , '4' , 'P');
INSERT INTO frequencia VALUES('8' , '4' , 'P');
INSERT INTO frequencia VALUES('9' , '4' , 'P');
INSERT INTO frequencia VALUES('10' , '4' , 'P');
INSERT INTO frequencia VALUES('1' , '5' , 'P');
INSERT INTO frequencia VALUES('2' , '5' , 'P');
INSERT INTO frequencia VALUES('3' , '5' , 'P');
INSERT INTO frequencia VALUES('4' , '5' , 'P');
INSERT INTO frequencia VALUES('5' , '5' , 'P');
INSERT INTO frequencia VALUES('6' , '5' , 'P');
INSERT INTO frequencia VALUES('7' , '5' , 'P');
INSERT INTO frequencia VALUES('8' , '5' , 'P');
INSERT INTO frequencia VALUES('9' , '5' , 'P');
INSERT INTO frequencia VALUES('10' , '5' , 'P');
INSERT INTO frequencia VALUES('1' , '6' , 'P');
INSERT INTO frequencia VALUES('2' , '6' , 'P');
INSERT INTO frequencia VALUES('3' , '6' , 'P');
INSERT INTO frequencia VALUES('4' , '6' , 'P');
INSERT INTO frequencia VALUES('5' , '6' , 'P');
INSERT INTO frequencia VALUES('6' , '6' , 'P');
INSERT INTO frequencia VALUES('7' , '6' , 'P');
INSERT INTO frequencia VALUES('8' , '6' , 'P');
INSERT INTO frequencia VALUES('9' , '6' , 'P');
INSERT INTO frequencia VALUES('10' , '6' , 'P');
INSERT INTO frequencia VALUES('1' , '7' , 'P');
INSERT INTO frequencia VALUES('2' , '7' , 'P');
INSERT INTO frequencia VALUES('3' , '7' , 'P');
INSERT INTO frequencia VALUES('4' , '7' , 'P');
INSERT INTO frequencia VALUES('5' , '7' , 'P');
INSERT INTO frequencia VALUES('6' , '7' , 'P');
INSERT INTO frequencia VALUES('7' , '7' , 'P');
INSERT INTO frequencia VALUES('8' , '7' , 'P');
INSERT INTO frequencia VALUES('9' , '7' , 'P');
INSERT INTO frequencia VALUES('10' , '7' , 'P');
INSERT INTO frequencia VALUES('1' , '8' , 'P');
INSERT INTO frequencia VALUES('2' , '8' , 'P');
INSERT INTO frequencia VALUES('3' , '8' , 'P');
INSERT INTO frequencia VALUES('4' , '8' , 'P');
INSERT INTO frequencia VALUES('5' , '8' , 'P');
INSERT INTO frequencia VALUES('6' , '8' , 'P');
INSERT INTO frequencia VALUES('7' , '8' , 'P');
INSERT INTO frequencia VALUES('8' , '8' , 'P');
INSERT INTO frequencia VALUES('9' , '8' , 'P');
INSERT INTO frequencia VALUES('10' , '8' , 'P');
INSERT INTO frequencia VALUES('1' , '9' , 'P');
INSERT INTO frequencia VALUES('2' , '9' , 'P');
INSERT INTO frequencia VALUES('3' , '9' , 'P');
INSERT INTO frequencia VALUES('4' , '9' , 'P');
INSERT INTO frequencia VALUES('5' , '9' , 'P');
INSERT INTO frequencia VALUES('6' , '9' , 'P');
INSERT INTO frequencia VALUES('7' , '9' , 'P');
INSERT INTO frequencia VALUES('8' , '9' , 'P');
INSERT INTO frequencia VALUES('9' , '9' , 'P');
INSERT INTO frequencia VALUES('10' , '9' , 'P');
INSERT INTO frequencia VALUES('1' , '10' , 'P');
INSERT INTO frequencia VALUES('2' , '10' , 'P');
INSERT INTO frequencia VALUES('3' , '10' , 'P');
INSERT INTO frequencia VALUES('4' , '10' , 'P');
INSERT INTO frequencia VALUES('5' , '10' , 'P');
INSERT INTO frequencia VALUES('6' , '10' , 'P');
INSERT INTO frequencia VALUES('7' , '10' , 'P');
INSERT INTO frequencia VALUES('8' , '10' , 'P');
INSERT INTO frequencia VALUES('9' , '10' , 'P');
INSERT INTO frequencia VALUES('10' , '10' , 'P');
INSERT INTO frequencia VALUES('1' , '11' , 'P');
INSERT INTO frequencia VALUES('2' , '11' , 'P');
INSERT INTO frequencia VALUES('3' , '11' , 'P');
INSERT INTO frequencia VALUES('4' , '11' , 'P');
INSERT INTO frequencia VALUES('5' , '11' , 'P');
INSERT INTO frequencia VALUES('6' , '11' , 'P');
INSERT INTO frequencia VALUES('7' , '11' , 'P');
INSERT INTO frequencia VALUES('8' , '11' , 'P');
INSERT INTO frequencia VALUES('9' , '11' , 'P');
INSERT INTO frequencia VALUES('10' , '11' , 'P');
INSERT INTO frequencia VALUES('1' , '12' , 'P');
INSERT INTO frequencia VALUES('2' , '12' , 'P');
INSERT INTO frequencia VALUES('3' , '12' , 'P');
INSERT INTO frequencia VALUES('4' , '12' , 'P');
INSERT INTO frequencia VALUES('5' , '12' , 'P');
INSERT INTO frequencia VALUES('6' , '12' , 'P');
INSERT INTO frequencia VALUES('7' , '12' , 'P');
INSERT INTO frequencia VALUES('8' , '12' , 'P');
INSERT INTO frequencia VALUES('9' , '12' , 'P');
INSERT INTO frequencia VALUES('10' , '12' , 'P');
INSERT INTO frequencia VALUES('1' , '13' , 'P');
INSERT INTO frequencia VALUES('2' , '13' , 'P');
INSERT INTO frequencia VALUES('3' , '13' , 'P');
INSERT INTO frequencia VALUES('4' , '13' , 'P');
INSERT INTO frequencia VALUES('5' , '13' , 'P');
INSERT INTO frequencia VALUES('6' , '13' , 'P');
INSERT INTO frequencia VALUES('7' , '13' , 'P');
INSERT INTO frequencia VALUES('8' , '13' , 'P');
INSERT INTO frequencia VALUES('9' , '13' , 'P');
INSERT INTO frequencia VALUES('10' , '13' , 'P');
INSERT INTO frequencia VALUES('1' , '14' , 'P');
INSERT INTO frequencia VALUES('2' , '14' , 'P');
INSERT INTO frequencia VALUES('3' , '14' , 'P');
INSERT INTO frequencia VALUES('4' , '14' , 'P');
INSERT INTO frequencia VALUES('5' , '14' , 'P');
INSERT INTO frequencia VALUES('6' , '14' , 'P');
INSERT INTO frequencia VALUES('7' , '14' , 'P');
INSERT INTO frequencia VALUES('8' , '14' , 'P');
INSERT INTO frequencia VALUES('9' , '14' , 'P');
INSERT INTO frequencia VALUES('10' , '14' , 'P');
INSERT INTO frequencia VALUES('1' , '15' , 'P');
INSERT INTO frequencia VALUES('2' , '15' , 'P');
INSERT INTO frequencia VALUES('3' , '15' , 'P');
INSERT INTO frequencia VALUES('4' , '15' , 'P');
INSERT INTO frequencia VALUES('5' , '15' , 'P');
INSERT INTO frequencia VALUES('6' , '15' , 'P');
INSERT INTO frequencia VALUES('7' , '15' , 'P');
INSERT INTO frequencia VALUES('8' , '15' , 'P');
INSERT INTO frequencia VALUES('9' , '15' , 'P');
INSERT INTO frequencia VALUES('10' , '15' , 'P');
INSERT INTO frequencia VALUES('1' , '16' , 'P');
INSERT INTO frequencia VALUES('2' , '16' , 'P');
INSERT INTO frequencia VALUES('3' , '16' , 'P');
INSERT INTO frequencia VALUES('4' , '16' , 'P');
INSERT INTO frequencia VALUES('5' , '16' , 'P');
INSERT INTO frequencia VALUES('6' , '16' , 'P');
INSERT INTO frequencia VALUES('7' , '16' , 'P');
INSERT INTO frequencia VALUES('8' , '16' , 'P');
INSERT INTO frequencia VALUES('9' , '16' , 'P');
INSERT INTO frequencia VALUES('10' , '16' , 'P');
INSERT INTO frequencia VALUES('1' , '17' , 'P');
INSERT INTO frequencia VALUES('2' , '17' , 'P');
INSERT INTO frequencia VALUES('3' , '17' , 'P');
INSERT INTO frequencia VALUES('4' , '17' , 'P');
INSERT INTO frequencia VALUES('5' , '17' , 'P');
INSERT INTO frequencia VALUES('6' , '17' , 'P');
INSERT INTO frequencia VALUES('7' , '17' , 'P');
INSERT INTO frequencia VALUES('8' , '17' , 'P');
INSERT INTO frequencia VALUES('9' , '17' , 'P');
INSERT INTO frequencia VALUES('10' , '17' , 'P');
INSERT INTO frequencia VALUES('1' , '18' , 'P');
INSERT INTO frequencia VALUES('2' , '18' , 'P');
INSERT INTO frequencia VALUES('3' , '18' , 'P');
INSERT INTO frequencia VALUES('4' , '18' , 'P');
INSERT INTO frequencia VALUES('5' , '18' , 'P');
INSERT INTO frequencia VALUES('6' , '18' , 'P');
INSERT INTO frequencia VALUES('7' , '18' , 'P');
INSERT INTO frequencia VALUES('8' , '18' , 'P');
INSERT INTO frequencia VALUES('9' , '18' , 'P');
INSERT INTO frequencia VALUES('10' , '18' , 'P');
INSERT INTO frequencia VALUES('1' , '19' , 'P');
INSERT INTO frequencia VALUES('2' , '19' , 'P');
INSERT INTO frequencia VALUES('3' , '19' , 'P');
INSERT INTO frequencia VALUES('4' , '19' , 'P');
INSERT INTO frequencia VALUES('5' , '19' , 'P');
INSERT INTO frequencia VALUES('6' , '19' , 'P');
INSERT INTO frequencia VALUES('7' , '19' , 'P');
INSERT INTO frequencia VALUES('8' , '19' , 'P');
INSERT INTO frequencia VALUES('9' , '19' , 'P');
INSERT INTO frequencia VALUES('10' , '19' , 'P');
INSERT INTO frequencia VALUES('1' , '20' , 'P');
INSERT INTO frequencia VALUES('2' , '20' , 'P');
INSERT INTO frequencia VALUES('3' , '20' , 'P');
INSERT INTO frequencia VALUES('4' , '20' , 'P');
INSERT INTO frequencia VALUES('5' , '20' , 'P');
INSERT INTO frequencia VALUES('6' , '20' , 'P');
INSERT INTO frequencia VALUES('7' , '20' , 'P');
INSERT INTO frequencia VALUES('8' , '20' , 'P');
INSERT INTO frequencia VALUES('9' , '20' , 'P');
INSERT INTO frequencia VALUES('10' , '20' , 'P');
INSERT INTO frequencia VALUES('1' , '21' , 'P');
INSERT INTO frequencia VALUES('2' , '21' , 'P');
INSERT INTO frequencia VALUES('3' , '21' , 'P');
INSERT INTO frequencia VALUES('4' , '21' , 'P');
INSERT INTO frequencia VALUES('5' , '21' , 'P');
INSERT INTO frequencia VALUES('6' , '21' , 'P');
INSERT INTO frequencia VALUES('7' , '21' , 'P');
INSERT INTO frequencia VALUES('8' , '21' , 'P');
INSERT INTO frequencia VALUES('9' , '21' , 'P');
INSERT INTO frequencia VALUES('10' , '21' , 'P');
INSERT INTO frequencia VALUES('1' , '22' , 'P');
INSERT INTO frequencia VALUES('2' , '22' , 'P');
INSERT INTO frequencia VALUES('3' , '22' , 'P');
INSERT INTO frequencia VALUES('4' , '22' , 'P');
INSERT INTO frequencia VALUES('5' , '22' , 'P');
INSERT INTO frequencia VALUES('6' , '22' , 'P');
INSERT INTO frequencia VALUES('7' , '22' , 'P');
INSERT INTO frequencia VALUES('8' , '22' , 'P');
INSERT INTO frequencia VALUES('9' , '22' , 'P');
INSERT INTO frequencia VALUES('10' , '22' , 'P');
INSERT INTO frequencia VALUES('1' , '23' , 'P');
INSERT INTO frequencia VALUES('2' , '23' , 'P');
INSERT INTO frequencia VALUES('3' , '23' , 'P');
INSERT INTO frequencia VALUES('4' , '23' , 'P');
INSERT INTO frequencia VALUES('5' , '23' , 'P');
INSERT INTO frequencia VALUES('6' , '23' , 'P');
INSERT INTO frequencia VALUES('7' , '23' , 'P');
INSERT INTO frequencia VALUES('8' , '23' , 'P');
INSERT INTO frequencia VALUES('9' , '23' , 'P');
INSERT INTO frequencia VALUES('10' , '23' , 'P');
INSERT INTO frequencia VALUES('1' , '24' , 'P');
INSERT INTO frequencia VALUES('2' , '24' , 'P');
INSERT INTO frequencia VALUES('3' , '24' , 'P');
INSERT INTO frequencia VALUES('4' , '24' , 'P');
INSERT INTO frequencia VALUES('5' , '24' , 'P');
INSERT INTO frequencia VALUES('6' , '24' , 'P');
INSERT INTO frequencia VALUES('7' , '24' , 'P');
INSERT INTO frequencia VALUES('8' , '24' , 'P');
INSERT INTO frequencia VALUES('9' , '24' , 'P');
INSERT INTO frequencia VALUES('10' , '24' , 'P');
INSERT INTO frequencia VALUES('1' , '25' , 'P');
INSERT INTO frequencia VALUES('2' , '25' , 'P');
INSERT INTO frequencia VALUES('3' , '25' , 'P');
INSERT INTO frequencia VALUES('4' , '25' , 'P');
INSERT INTO frequencia VALUES('5' , '25' , 'P');
INSERT INTO frequencia VALUES('6' , '25' , 'P');
INSERT INTO frequencia VALUES('7' , '25' , 'P');
INSERT INTO frequencia VALUES('8' , '25' , 'P');
INSERT INTO frequencia VALUES('9' , '25' , 'P');
INSERT INTO frequencia VALUES('10' , '25' , 'P');
INSERT INTO frequencia VALUES('1' , '26' , 'P');
INSERT INTO frequencia VALUES('2' , '26' , 'P');
INSERT INTO frequencia VALUES('3' , '26' , 'P');
INSERT INTO frequencia VALUES('4' , '26' , 'P');
INSERT INTO frequencia VALUES('5' , '26' , 'P');
INSERT INTO frequencia VALUES('6' , '26' , 'P');
INSERT INTO frequencia VALUES('7' , '26' , 'P');
INSERT INTO frequencia VALUES('8' , '26' , 'P');
INSERT INTO frequencia VALUES('9' , '26' , 'P');
INSERT INTO frequencia VALUES('10' , '26' , 'P');
INSERT INTO frequencia VALUES('1' , '27' , 'P');
INSERT INTO frequencia VALUES('2' , '27' , 'P');
INSERT INTO frequencia VALUES('3' , '27' , 'P');
INSERT INTO frequencia VALUES('4' , '27' , 'P');
INSERT INTO frequencia VALUES('5' , '27' , 'P');
INSERT INTO frequencia VALUES('6' , '27' , 'P');
INSERT INTO frequencia VALUES('7' , '27' , 'P');
INSERT INTO frequencia VALUES('8' , '27' , 'P');
INSERT INTO frequencia VALUES('9' , '27' , 'P');
INSERT INTO frequencia VALUES('10' , '27' , 'P');
INSERT INTO frequencia VALUES('1' , '28' , 'P');
INSERT INTO frequencia VALUES('2' , '28' , 'P');
INSERT INTO frequencia VALUES('3' , '28' , 'P');
INSERT INTO frequencia VALUES('4' , '28' , 'P');
INSERT INTO frequencia VALUES('5' , '28' , 'P');
INSERT INTO frequencia VALUES('6' , '28' , 'P');
INSERT INTO frequencia VALUES('7' , '28' , 'P');
INSERT INTO frequencia VALUES('8' , '28' , 'P');
INSERT INTO frequencia VALUES('9' , '28' , 'P');
INSERT INTO frequencia VALUES('10' , '28' , 'P');
INSERT INTO frequencia VALUES('1' , '29' , 'P');
INSERT INTO frequencia VALUES('2' , '29' , 'P');
INSERT INTO frequencia VALUES('3' , '29' , 'P');
INSERT INTO frequencia VALUES('4' , '29' , 'P');
INSERT INTO frequencia VALUES('5' , '29' , 'P');
INSERT INTO frequencia VALUES('6' , '29' , 'P');
INSERT INTO frequencia VALUES('7' , '29' , 'P');
INSERT INTO frequencia VALUES('8' , '29' , 'P');
INSERT INTO frequencia VALUES('9' , '29' , 'P');
INSERT INTO frequencia VALUES('10' , '29' , 'P');
INSERT INTO frequencia VALUES('1' , '30' , 'P');
INSERT INTO frequencia VALUES('2' , '30' , 'P');
INSERT INTO frequencia VALUES('3' , '30' , 'P');
INSERT INTO frequencia VALUES('4' , '30' , 'P');
INSERT INTO frequencia VALUES('5' , '30' , 'P');
INSERT INTO frequencia VALUES('6' , '30' , 'P');
INSERT INTO frequencia VALUES('7' , '30' , 'P');
INSERT INTO frequencia VALUES('8' , '30' , 'P');
INSERT INTO frequencia VALUES('9' , '30' , 'P');
INSERT INTO frequencia VALUES('10' , '30' , 'P');
INSERT INTO frequencia VALUES('1' , '31' , 'P');
INSERT INTO frequencia VALUES('2' , '31' , 'P');
INSERT INTO frequencia VALUES('3' , '31' , 'P');
INSERT INTO frequencia VALUES('4' , '31' , 'P');
INSERT INTO frequencia VALUES('5' , '31' , 'P');
INSERT INTO frequencia VALUES('6' , '31' , 'P');
INSERT INTO frequencia VALUES('7' , '31' , 'P');
INSERT INTO frequencia VALUES('8' , '31' , 'P');
INSERT INTO frequencia VALUES('9' , '31' , 'P');
INSERT INTO frequencia VALUES('10' , '31' , 'P');
INSERT INTO frequencia VALUES('1' , '32' , 'P');
INSERT INTO frequencia VALUES('2' , '32' , 'P');
INSERT INTO frequencia VALUES('3' , '32' , 'P');
INSERT INTO frequencia VALUES('4' , '32' , 'P');
INSERT INTO frequencia VALUES('5' , '32' , 'P');
INSERT INTO frequencia VALUES('6' , '32' , 'P');
INSERT INTO frequencia VALUES('7' , '32' , 'P');
INSERT INTO frequencia VALUES('8' , '32' , 'P');
INSERT INTO frequencia VALUES('9' , '32' , 'P');
INSERT INTO frequencia VALUES('10' , '32' , 'P');
INSERT INTO frequencia VALUES('1' , '33' , 'P');
INSERT INTO frequencia VALUES('2' , '33' , 'P');
INSERT INTO frequencia VALUES('3' , '33' , 'P');
INSERT INTO frequencia VALUES('4' , '33' , 'P');
INSERT INTO frequencia VALUES('5' , '33' , 'P');
INSERT INTO frequencia VALUES('6' , '33' , 'P');
INSERT INTO frequencia VALUES('7' , '33' , 'P');
INSERT INTO frequencia VALUES('8' , '33' , 'P');
INSERT INTO frequencia VALUES('9' , '33' , 'P');
INSERT INTO frequencia VALUES('10' , '33' , 'P');
INSERT INTO frequencia VALUES('1' , '34' , 'P');
INSERT INTO frequencia VALUES('2' , '34' , 'P');
INSERT INTO frequencia VALUES('3' , '34' , 'P');
INSERT INTO frequencia VALUES('4' , '34' , 'P');
INSERT INTO frequencia VALUES('5' , '34' , 'P');
INSERT INTO frequencia VALUES('6' , '34' , 'P');
INSERT INTO frequencia VALUES('7' , '34' , 'P');
INSERT INTO frequencia VALUES('8' , '34' , 'P');
INSERT INTO frequencia VALUES('9' , '34' , 'P');
INSERT INTO frequencia VALUES('10' , '34' , 'P');
INSERT INTO frequencia VALUES('1' , '35' , 'P');
INSERT INTO frequencia VALUES('2' , '35' , 'P');
INSERT INTO frequencia VALUES('3' , '35' , 'P');
INSERT INTO frequencia VALUES('4' , '35' , 'P');
INSERT INTO frequencia VALUES('5' , '35' , 'P');
INSERT INTO frequencia VALUES('6' , '35' , 'P');
INSERT INTO frequencia VALUES('7' , '35' , 'P');
INSERT INTO frequencia VALUES('8' , '35' , 'P');
INSERT INTO frequencia VALUES('9' , '35' , 'P');
INSERT INTO frequencia VALUES('10' , '35' , 'P');
INSERT INTO frequencia VALUES('1' , '36' , 'P');
INSERT INTO frequencia VALUES('2' , '36' , 'P');
INSERT INTO frequencia VALUES('3' , '36' , 'P');
INSERT INTO frequencia VALUES('4' , '36' , 'P');
INSERT INTO frequencia VALUES('5' , '36' , 'P');
INSERT INTO frequencia VALUES('6' , '36' , 'P');
INSERT INTO frequencia VALUES('7' , '36' , 'P');
INSERT INTO frequencia VALUES('8' , '36' , 'P');
INSERT INTO frequencia VALUES('9' , '36' , 'P');
INSERT INTO frequencia VALUES('10' , '36' , 'P');
INSERT INTO frequencia VALUES('1' , '37' , 'P');
INSERT INTO frequencia VALUES('2' , '37' , 'P');
INSERT INTO frequencia VALUES('3' , '37' , 'P');
INSERT INTO frequencia VALUES('4' , '37' , 'P');
INSERT INTO frequencia VALUES('5' , '37' , 'P');
INSERT INTO frequencia VALUES('6' , '37' , 'P');
INSERT INTO frequencia VALUES('7' , '37' , 'P');
INSERT INTO frequencia VALUES('8' , '37' , 'P');
INSERT INTO frequencia VALUES('9' , '37' , 'P');
INSERT INTO frequencia VALUES('10' , '37' , 'P');
INSERT INTO frequencia VALUES('1' , '38' , 'P');
INSERT INTO frequencia VALUES('2' , '38' , 'P');
INSERT INTO frequencia VALUES('3' , '38' , 'P');
INSERT INTO frequencia VALUES('4' , '38' , 'P');
INSERT INTO frequencia VALUES('5' , '38' , 'P');
INSERT INTO frequencia VALUES('6' , '38' , 'P');
INSERT INTO frequencia VALUES('7' , '38' , 'P');
INSERT INTO frequencia VALUES('8' , '38' , 'P');
INSERT INTO frequencia VALUES('9' , '38' , 'P');
INSERT INTO frequencia VALUES('10' , '38' , 'P');
INSERT INTO frequencia VALUES('1' , '39' , 'P');
INSERT INTO frequencia VALUES('2' , '39' , 'P');
INSERT INTO frequencia VALUES('3' , '39' , 'P');
INSERT INTO frequencia VALUES('4' , '39' , 'P');
INSERT INTO frequencia VALUES('5' , '39' , 'P');
INSERT INTO frequencia VALUES('6' , '39' , 'P');
INSERT INTO frequencia VALUES('7' , '39' , 'P');
INSERT INTO frequencia VALUES('8' , '39' , 'P');
INSERT INTO frequencia VALUES('9' , '39' , 'P');
INSERT INTO frequencia VALUES('10' , '39' , 'P');
INSERT INTO frequencia VALUES('1' , '40' , 'P');
INSERT INTO frequencia VALUES('2' , '40' , 'P');
INSERT INTO frequencia VALUES('3' , '40' , 'P');
INSERT INTO frequencia VALUES('4' , '40' , 'P');
INSERT INTO frequencia VALUES('5' , '40' , 'P');
INSERT INTO frequencia VALUES('6' , '40' , 'P');
INSERT INTO frequencia VALUES('7' , '40' , 'P');
INSERT INTO frequencia VALUES('8' , '40' , 'P');
INSERT INTO frequencia VALUES('9' , '40' , 'P');
INSERT INTO frequencia VALUES('10' , '40' , 'P');
INSERT INTO frequencia VALUES('1' , '41' , 'P');
INSERT INTO frequencia VALUES('2' , '41' , 'P');
INSERT INTO frequencia VALUES('3' , '41' , 'P');
INSERT INTO frequencia VALUES('4' , '41' , 'P');
INSERT INTO frequencia VALUES('5' , '41' , 'P');
INSERT INTO frequencia VALUES('6' , '41' , 'P');
INSERT INTO frequencia VALUES('7' , '41' , 'P');
INSERT INTO frequencia VALUES('8' , '41' , 'P');
INSERT INTO frequencia VALUES('9' , '41' , 'P');
INSERT INTO frequencia VALUES('10' , '41' , 'P');
INSERT INTO frequencia VALUES('1' , '42' , 'P');
INSERT INTO frequencia VALUES('2' , '42' , 'P');
INSERT INTO frequencia VALUES('3' , '42' , 'P');
INSERT INTO frequencia VALUES('4' , '42' , 'P');
INSERT INTO frequencia VALUES('5' , '42' , 'P');
INSERT INTO frequencia VALUES('6' , '42' , 'P');
INSERT INTO frequencia VALUES('7' , '42' , 'P');
INSERT INTO frequencia VALUES('8' , '42' , 'P');
INSERT INTO frequencia VALUES('9' , '42' , 'P');
INSERT INTO frequencia VALUES('10' , '42' , 'P');
INSERT INTO frequencia VALUES('1' , '43' , 'P');
INSERT INTO frequencia VALUES('2' , '43' , 'P');
INSERT INTO frequencia VALUES('3' , '43' , 'P');
INSERT INTO frequencia VALUES('4' , '43' , 'P');
INSERT INTO frequencia VALUES('5' , '43' , 'P');
INSERT INTO frequencia VALUES('6' , '43' , 'P');
INSERT INTO frequencia VALUES('7' , '43' , 'P');
INSERT INTO frequencia VALUES('8' , '43' , 'P');
INSERT INTO frequencia VALUES('9' , '43' , 'P');
INSERT INTO frequencia VALUES('10' , '43' , 'P');
INSERT INTO frequencia VALUES('1' , '44' , 'P');
INSERT INTO frequencia VALUES('2' , '44' , 'P');
INSERT INTO frequencia VALUES('3' , '44' , 'P');
INSERT INTO frequencia VALUES('4' , '44' , 'P');
INSERT INTO frequencia VALUES('5' , '44' , 'P');
INSERT INTO frequencia VALUES('6' , '44' , 'P');
INSERT INTO frequencia VALUES('7' , '44' , 'P');
INSERT INTO frequencia VALUES('8' , '44' , 'P');
INSERT INTO frequencia VALUES('9' , '44' , 'P');
INSERT INTO frequencia VALUES('10' , '44' , 'P');
INSERT INTO frequencia VALUES('1' , '45' , 'P');
INSERT INTO frequencia VALUES('2' , '45' , 'P');
INSERT INTO frequencia VALUES('3' , '45' , 'P');
INSERT INTO frequencia VALUES('4' , '45' , 'P');
INSERT INTO frequencia VALUES('5' , '45' , 'P');
INSERT INTO frequencia VALUES('6' , '45' , 'P');
INSERT INTO frequencia VALUES('7' , '45' , 'P');
INSERT INTO frequencia VALUES('8' , '45' , 'P');
INSERT INTO frequencia VALUES('9' , '45' , 'P');
INSERT INTO frequencia VALUES('10' , '45' , 'P');
INSERT INTO frequencia VALUES('1' , '46' , 'P');
INSERT INTO frequencia VALUES('2' , '46' , 'P');
INSERT INTO frequencia VALUES('3' , '46' , 'P');
INSERT INTO frequencia VALUES('4' , '46' , 'P');
INSERT INTO frequencia VALUES('5' , '46' , 'P');
INSERT INTO frequencia VALUES('6' , '46' , 'P');
INSERT INTO frequencia VALUES('7' , '46' , 'P');
INSERT INTO frequencia VALUES('8' , '46' , 'P');
INSERT INTO frequencia VALUES('9' , '46' , 'P');
INSERT INTO frequencia VALUES('10' , '46' , 'P');
INSERT INTO frequencia VALUES('1' , '47' , 'P');
INSERT INTO frequencia VALUES('2' , '47' , 'P');
INSERT INTO frequencia VALUES('3' , '47' , 'P');
INSERT INTO frequencia VALUES('4' , '47' , 'P');
INSERT INTO frequencia VALUES('5' , '47' , 'P');
INSERT INTO frequencia VALUES('6' , '47' , 'P');
INSERT INTO frequencia VALUES('7' , '47' , 'P');
INSERT INTO frequencia VALUES('8' , '47' , 'P');
INSERT INTO frequencia VALUES('9' , '47' , 'P');
INSERT INTO frequencia VALUES('10' , '47' , 'P');
INSERT INTO frequencia VALUES('1' , '48' , 'P');
INSERT INTO frequencia VALUES('2' , '48' , 'P');
INSERT INTO frequencia VALUES('3' , '48' , 'P');
INSERT INTO frequencia VALUES('4' , '48' , 'P');
INSERT INTO frequencia VALUES('5' , '48' , 'P');
INSERT INTO frequencia VALUES('6' , '48' , 'P');
INSERT INTO frequencia VALUES('7' , '48' , 'P');
INSERT INTO frequencia VALUES('8' , '48' , 'P');
INSERT INTO frequencia VALUES('9' , '48' , 'P');
INSERT INTO frequencia VALUES('10' , '48' , 'P');
INSERT INTO frequencia VALUES('1' , '49' , 'P');
INSERT INTO frequencia VALUES('2' , '49' , 'P');
INSERT INTO frequencia VALUES('3' , '49' , 'P');
INSERT INTO frequencia VALUES('4' , '49' , 'P');
INSERT INTO frequencia VALUES('5' , '49' , 'P');
INSERT INTO frequencia VALUES('6' , '49' , 'P');
INSERT INTO frequencia VALUES('7' , '49' , 'P');
INSERT INTO frequencia VALUES('8' , '49' , 'P');
INSERT INTO frequencia VALUES('9' , '49' , 'P');
INSERT INTO frequencia VALUES('10' , '49' , 'P');
INSERT INTO frequencia VALUES('1' , '50' , 'P');
INSERT INTO frequencia VALUES('2' , '50' , 'P');
INSERT INTO frequencia VALUES('3' , '50' , 'P');
INSERT INTO frequencia VALUES('4' , '50' , 'P');
INSERT INTO frequencia VALUES('5' , '50' , 'P');
INSERT INTO frequencia VALUES('6' , '50' , 'P');
INSERT INTO frequencia VALUES('7' , '50' , 'P');
INSERT INTO frequencia VALUES('8' , '50' , 'P');
INSERT INTO frequencia VALUES('9' , '50' , 'P');
INSERT INTO frequencia VALUES('10' , '50' , 'P');
INSERT INTO frequencia VALUES('1' , '51' , 'P');
INSERT INTO frequencia VALUES('2' , '51' , 'P');
INSERT INTO frequencia VALUES('3' , '51' , 'P');
INSERT INTO frequencia VALUES('4' , '51' , 'P');
INSERT INTO frequencia VALUES('5' , '51' , 'P');
INSERT INTO frequencia VALUES('6' , '51' , 'P');
INSERT INTO frequencia VALUES('7' , '51' , 'P');
INSERT INTO frequencia VALUES('8' , '51' , 'P');
INSERT INTO frequencia VALUES('9' , '51' , 'P');
INSERT INTO frequencia VALUES('10' , '51' , 'P');
INSERT INTO frequencia VALUES('1' , '52' , 'P');
INSERT INTO frequencia VALUES('2' , '52' , 'P');
INSERT INTO frequencia VALUES('3' , '52' , 'P');
INSERT INTO frequencia VALUES('4' , '52' , 'P');
INSERT INTO frequencia VALUES('5' , '52' , 'P');
INSERT INTO frequencia VALUES('6' , '52' , 'P');
INSERT INTO frequencia VALUES('7' , '52' , 'P');
INSERT INTO frequencia VALUES('8' , '52' , 'P');
INSERT INTO frequencia VALUES('9' , '52' , 'P');
INSERT INTO frequencia VALUES('10' , '52' , 'P');
INSERT INTO frequencia VALUES('1' , '53' , 'P');
INSERT INTO frequencia VALUES('2' , '53' , 'P');
INSERT INTO frequencia VALUES('3' , '53' , 'P');
INSERT INTO frequencia VALUES('4' , '53' , 'P');
INSERT INTO frequencia VALUES('5' , '53' , 'P');
INSERT INTO frequencia VALUES('6' , '53' , 'P');
INSERT INTO frequencia VALUES('7' , '53' , 'P');
INSERT INTO frequencia VALUES('8' , '53' , 'P');
INSERT INTO frequencia VALUES('9' , '53' , 'P');
INSERT INTO frequencia VALUES('10' , '53' , 'P');
INSERT INTO frequencia VALUES('1' , '54' , 'P');
INSERT INTO frequencia VALUES('2' , '54' , 'P');
INSERT INTO frequencia VALUES('3' , '54' , 'P');
INSERT INTO frequencia VALUES('4' , '54' , 'P');
INSERT INTO frequencia VALUES('5' , '54' , 'P');
INSERT INTO frequencia VALUES('6' , '54' , 'P');
INSERT INTO frequencia VALUES('7' , '54' , 'P');
INSERT INTO frequencia VALUES('8' , '54' , 'P');
INSERT INTO frequencia VALUES('9' , '54' , 'P');
INSERT INTO frequencia VALUES('10' , '54' , 'P');
INSERT INTO frequencia VALUES('1' , '55' , 'P');
INSERT INTO frequencia VALUES('2' , '55' , 'P');
INSERT INTO frequencia VALUES('3' , '55' , 'P');
INSERT INTO frequencia VALUES('4' , '55' , 'P');
INSERT INTO frequencia VALUES('5' , '55' , 'P');
INSERT INTO frequencia VALUES('6' , '55' , 'P');
INSERT INTO frequencia VALUES('7' , '55' , 'P');
INSERT INTO frequencia VALUES('8' , '55' , 'P');
INSERT INTO frequencia VALUES('9' , '55' , 'P');
INSERT INTO frequencia VALUES('10' , '55' , 'P');
INSERT INTO frequencia VALUES('1' , '56' , 'P');
INSERT INTO frequencia VALUES('2' , '56' , 'P');
INSERT INTO frequencia VALUES('3' , '56' , 'P');
INSERT INTO frequencia VALUES('4' , '56' , 'P');
INSERT INTO frequencia VALUES('5' , '56' , 'P');
INSERT INTO frequencia VALUES('6' , '56' , 'P');
INSERT INTO frequencia VALUES('7' , '56' , 'P');
INSERT INTO frequencia VALUES('8' , '56' , 'P');
INSERT INTO frequencia VALUES('9' , '56' , 'P');
INSERT INTO frequencia VALUES('10' , '56' , 'P');
INSERT INTO frequencia VALUES('1' , '57' , 'P');
INSERT INTO frequencia VALUES('2' , '57' , 'P');
INSERT INTO frequencia VALUES('3' , '57' , 'P');
INSERT INTO frequencia VALUES('4' , '57' , 'P');
INSERT INTO frequencia VALUES('5' , '57' , 'P');
INSERT INTO frequencia VALUES('6' , '57' , 'P');
INSERT INTO frequencia VALUES('7' , '57' , 'P');
INSERT INTO frequencia VALUES('8' , '57' , 'P');
INSERT INTO frequencia VALUES('9' , '57' , 'P');
INSERT INTO frequencia VALUES('10' , '57' , 'P');
INSERT INTO frequencia VALUES('1' , '58' , 'P');
INSERT INTO frequencia VALUES('2' , '58' , 'P');
INSERT INTO frequencia VALUES('3' , '58' , 'P');
INSERT INTO frequencia VALUES('4' , '58' , 'P');
INSERT INTO frequencia VALUES('5' , '58' , 'P');
INSERT INTO frequencia VALUES('6' , '58' , 'P');
INSERT INTO frequencia VALUES('7' , '58' , 'P');
INSERT INTO frequencia VALUES('8' , '58' , 'P');
INSERT INTO frequencia VALUES('9' , '58' , 'P');
INSERT INTO frequencia VALUES('10' , '58' , 'P');
INSERT INTO frequencia VALUES('1' , '59' , 'P');
INSERT INTO frequencia VALUES('2' , '59' , 'P');
INSERT INTO frequencia VALUES('3' , '59' , 'P');
INSERT INTO frequencia VALUES('4' , '59' , 'P');
INSERT INTO frequencia VALUES('5' , '59' , 'P');
INSERT INTO frequencia VALUES('6' , '59' , 'P');
INSERT INTO frequencia VALUES('7' , '59' , 'P');
INSERT INTO frequencia VALUES('8' , '59' , 'P');
INSERT INTO frequencia VALUES('9' , '59' , 'P');
INSERT INTO frequencia VALUES('10' , '59' , 'P');
INSERT INTO frequencia VALUES('1' , '60' , 'P');
INSERT INTO frequencia VALUES('2' , '60' , 'P');
INSERT INTO frequencia VALUES('3' , '60' , 'P');
INSERT INTO frequencia VALUES('4' , '60' , 'P');
INSERT INTO frequencia VALUES('5' , '60' , 'P');
INSERT INTO frequencia VALUES('6' , '60' , 'P');
INSERT INTO frequencia VALUES('7' , '60' , 'P');
INSERT INTO frequencia VALUES('8' , '60' , 'P');
INSERT INTO frequencia VALUES('9' , '60' , 'P');
INSERT INTO frequencia VALUES('10' , '60' , 'P');
INSERT INTO frequencia VALUES('1' , '61' , 'P');
INSERT INTO frequencia VALUES('2' , '61' , 'P');
INSERT INTO frequencia VALUES('3' , '61' , 'P');
INSERT INTO frequencia VALUES('4' , '61' , 'P');
INSERT INTO frequencia VALUES('5' , '61' , 'P');
INSERT INTO frequencia VALUES('6' , '61' , 'P');
INSERT INTO frequencia VALUES('7' , '61' , 'P');
INSERT INTO frequencia VALUES('8' , '61' , 'P');
INSERT INTO frequencia VALUES('9' , '61' , 'P');
INSERT INTO frequencia VALUES('10' , '61' , 'P');
INSERT INTO frequencia VALUES('1' , '62' , 'P');
INSERT INTO frequencia VALUES('2' , '62' , 'P');
INSERT INTO frequencia VALUES('3' , '62' , 'P');
INSERT INTO frequencia VALUES('4' , '62' , 'P');
INSERT INTO frequencia VALUES('5' , '62' , 'P');
INSERT INTO frequencia VALUES('6' , '62' , 'P');
INSERT INTO frequencia VALUES('7' , '62' , 'P');
INSERT INTO frequencia VALUES('8' , '62' , 'P');
INSERT INTO frequencia VALUES('9' , '62' , 'P');
INSERT INTO frequencia VALUES('10' , '62' , 'P');
INSERT INTO frequencia VALUES('1' , '63' , 'P');
INSERT INTO frequencia VALUES('2' , '63' , 'P');
INSERT INTO frequencia VALUES('3' , '63' , 'P');
INSERT INTO frequencia VALUES('4' , '63' , 'P');
INSERT INTO frequencia VALUES('5' , '63' , 'P');
INSERT INTO frequencia VALUES('6' , '63' , 'P');
INSERT INTO frequencia VALUES('7' , '63' , 'P');
INSERT INTO frequencia VALUES('8' , '63' , 'P');
INSERT INTO frequencia VALUES('9' , '63' , 'P');
INSERT INTO frequencia VALUES('10' , '63' , 'P');
INSERT INTO frequencia VALUES('1' , '64' , 'P');
INSERT INTO frequencia VALUES('2' , '64' , 'P');
INSERT INTO frequencia VALUES('3' , '64' , 'P');
INSERT INTO frequencia VALUES('4' , '64' , 'P');
INSERT INTO frequencia VALUES('5' , '64' , 'P');
INSERT INTO frequencia VALUES('6' , '64' , 'P');
INSERT INTO frequencia VALUES('7' , '64' , 'P');
INSERT INTO frequencia VALUES('8' , '64' , 'P');
INSERT INTO frequencia VALUES('9' , '64' , 'P');
INSERT INTO frequencia VALUES('10' , '64' , 'P');
INSERT INTO frequencia VALUES('1' , '65' , 'P');
INSERT INTO frequencia VALUES('2' , '65' , 'P');
INSERT INTO frequencia VALUES('3' , '65' , 'P');
INSERT INTO frequencia VALUES('4' , '65' , 'P');
INSERT INTO frequencia VALUES('5' , '65' , 'P');
INSERT INTO frequencia VALUES('6' , '65' , 'P');
INSERT INTO frequencia VALUES('7' , '65' , 'P');
INSERT INTO frequencia VALUES('8' , '65' , 'P');
INSERT INTO frequencia VALUES('9' , '65' , 'P');
INSERT INTO frequencia VALUES('10' , '65' , 'P');
INSERT INTO frequencia VALUES('1' , '66' , 'P');
INSERT INTO frequencia VALUES('2' , '66' , 'P');
INSERT INTO frequencia VALUES('3' , '66' , 'P');
INSERT INTO frequencia VALUES('4' , '66' , 'P');
INSERT INTO frequencia VALUES('5' , '66' , 'P');
INSERT INTO frequencia VALUES('6' , '66' , 'P');
INSERT INTO frequencia VALUES('7' , '66' , 'P');
INSERT INTO frequencia VALUES('8' , '66' , 'P');
INSERT INTO frequencia VALUES('9' , '66' , 'P');
INSERT INTO frequencia VALUES('10' , '66' , 'P');
INSERT INTO frequencia VALUES('1' , '67' , 'P');
INSERT INTO frequencia VALUES('2' , '67' , 'P');
INSERT INTO frequencia VALUES('3' , '67' , 'P');
INSERT INTO frequencia VALUES('4' , '67' , 'P');
INSERT INTO frequencia VALUES('5' , '67' , 'P');
INSERT INTO frequencia VALUES('6' , '67' , 'P');
INSERT INTO frequencia VALUES('7' , '67' , 'P');
INSERT INTO frequencia VALUES('8' , '67' , 'P');
INSERT INTO frequencia VALUES('9' , '67' , 'P');
INSERT INTO frequencia VALUES('10' , '67' , 'P');
INSERT INTO frequencia VALUES('1' , '68' , 'P');
INSERT INTO frequencia VALUES('2' , '68' , 'P');
INSERT INTO frequencia VALUES('3' , '68' , 'P');
INSERT INTO frequencia VALUES('4' , '68' , 'P');
INSERT INTO frequencia VALUES('5' , '68' , 'P');
INSERT INTO frequencia VALUES('6' , '68' , 'P');
INSERT INTO frequencia VALUES('7' , '68' , 'P');
INSERT INTO frequencia VALUES('8' , '68' , 'P');
INSERT INTO frequencia VALUES('9' , '68' , 'P');
INSERT INTO frequencia VALUES('10' , '68' , 'P');
INSERT INTO frequencia VALUES('1' , '69' , 'P');
INSERT INTO frequencia VALUES('2' , '69' , 'P');
INSERT INTO frequencia VALUES('3' , '69' , 'P');
INSERT INTO frequencia VALUES('4' , '69' , 'P');
INSERT INTO frequencia VALUES('5' , '69' , 'P');
INSERT INTO frequencia VALUES('6' , '69' , 'P');
INSERT INTO frequencia VALUES('7' , '69' , 'P');
INSERT INTO frequencia VALUES('8' , '69' , 'P');
INSERT INTO frequencia VALUES('9' , '69' , 'P');
INSERT INTO frequencia VALUES('10' , '69' , 'P');
INSERT INTO frequencia VALUES('1' , '70' , 'P');
INSERT INTO frequencia VALUES('2' , '70' , 'P');
INSERT INTO frequencia VALUES('3' , '70' , 'P');
INSERT INTO frequencia VALUES('4' , '70' , 'P');
INSERT INTO frequencia VALUES('5' , '70' , 'P');
INSERT INTO frequencia VALUES('6' , '70' , 'P');
INSERT INTO frequencia VALUES('7' , '70' , 'P');
INSERT INTO frequencia VALUES('8' , '70' , 'P');
INSERT INTO frequencia VALUES('9' , '70' , 'P');
INSERT INTO frequencia VALUES('10' , '70' , 'P');
INSERT INTO frequencia VALUES('1' , '71' , 'P');
INSERT INTO frequencia VALUES('2' , '71' , 'P');
INSERT INTO frequencia VALUES('3' , '71' , 'P');
INSERT INTO frequencia VALUES('4' , '71' , 'P');
INSERT INTO frequencia VALUES('5' , '71' , 'P');
INSERT INTO frequencia VALUES('6' , '71' , 'P');
INSERT INTO frequencia VALUES('7' , '71' , 'P');
INSERT INTO frequencia VALUES('8' , '71' , 'P');
INSERT INTO frequencia VALUES('9' , '71' , 'P');
INSERT INTO frequencia VALUES('10' , '71' , 'P');
INSERT INTO frequencia VALUES('1' , '72' , 'P');
INSERT INTO frequencia VALUES('2' , '72' , 'P');
INSERT INTO frequencia VALUES('3' , '72' , 'P');
INSERT INTO frequencia VALUES('4' , '72' , 'P');
INSERT INTO frequencia VALUES('5' , '72' , 'P');
INSERT INTO frequencia VALUES('6' , '72' , 'P');
INSERT INTO frequencia VALUES('7' , '72' , 'P');
INSERT INTO frequencia VALUES('8' , '72' , 'P');
INSERT INTO frequencia VALUES('9' , '72' , 'P');
INSERT INTO frequencia VALUES('10' , '72' , 'P');
INSERT INTO frequencia VALUES('1' , '73' , 'P');
INSERT INTO frequencia VALUES('2' , '73' , 'P');
INSERT INTO frequencia VALUES('3' , '73' , 'P');
INSERT INTO frequencia VALUES('4' , '73' , 'P');
INSERT INTO frequencia VALUES('5' , '73' , 'P');
INSERT INTO frequencia VALUES('6' , '73' , 'P');
INSERT INTO frequencia VALUES('7' , '73' , 'P');
INSERT INTO frequencia VALUES('8' , '73' , 'P');
INSERT INTO frequencia VALUES('9' , '73' , 'P');
INSERT INTO frequencia VALUES('10' , '73' , 'P');
INSERT INTO frequencia VALUES('1' , '74' , 'P');
INSERT INTO frequencia VALUES('2' , '74' , 'P');
INSERT INTO frequencia VALUES('3' , '74' , 'P');
INSERT INTO frequencia VALUES('4' , '74' , 'P');
INSERT INTO frequencia VALUES('5' , '74' , 'P');
INSERT INTO frequencia VALUES('6' , '74' , 'P');
INSERT INTO frequencia VALUES('7' , '74' , 'P');
INSERT INTO frequencia VALUES('8' , '74' , 'P');
INSERT INTO frequencia VALUES('9' , '74' , 'P');
INSERT INTO frequencia VALUES('10' , '74' , 'P');
INSERT INTO frequencia VALUES('1' , '75' , 'P');
INSERT INTO frequencia VALUES('2' , '75' , 'P');
INSERT INTO frequencia VALUES('3' , '75' , 'P');
INSERT INTO frequencia VALUES('4' , '75' , 'P');
INSERT INTO frequencia VALUES('5' , '75' , 'P');
INSERT INTO frequencia VALUES('6' , '75' , 'P');
INSERT INTO frequencia VALUES('7' , '75' , 'P');
INSERT INTO frequencia VALUES('8' , '75' , 'P');
INSERT INTO frequencia VALUES('9' , '75' , 'P');
INSERT INTO frequencia VALUES('10' , '75' , 'P');
INSERT INTO frequencia VALUES('1' , '76' , 'P');
INSERT INTO frequencia VALUES('2' , '76' , 'P');
INSERT INTO frequencia VALUES('3' , '76' , 'P');
INSERT INTO frequencia VALUES('4' , '76' , 'P');
INSERT INTO frequencia VALUES('5' , '76' , 'P');
INSERT INTO frequencia VALUES('6' , '76' , 'P');
INSERT INTO frequencia VALUES('7' , '76' , 'P');
INSERT INTO frequencia VALUES('8' , '76' , 'P');
INSERT INTO frequencia VALUES('9' , '76' , 'P');
INSERT INTO frequencia VALUES('10' , '76' , 'P');
INSERT INTO frequencia VALUES('1' , '77' , 'P');
INSERT INTO frequencia VALUES('2' , '77' , 'P');
INSERT INTO frequencia VALUES('3' , '77' , 'P');
INSERT INTO frequencia VALUES('4' , '77' , 'P');
INSERT INTO frequencia VALUES('5' , '77' , 'P');
INSERT INTO frequencia VALUES('6' , '77' , 'P');
INSERT INTO frequencia VALUES('7' , '77' , 'P');
INSERT INTO frequencia VALUES('8' , '77' , 'P');
INSERT INTO frequencia VALUES('9' , '77' , 'P');
INSERT INTO frequencia VALUES('10' , '77' , 'P');
INSERT INTO frequencia VALUES('1' , '78' , 'P');
INSERT INTO frequencia VALUES('2' , '78' , 'P');
INSERT INTO frequencia VALUES('3' , '78' , 'P');
INSERT INTO frequencia VALUES('4' , '78' , 'P');
INSERT INTO frequencia VALUES('5' , '78' , 'P');
INSERT INTO frequencia VALUES('6' , '78' , 'P');
INSERT INTO frequencia VALUES('7' , '78' , 'P');
INSERT INTO frequencia VALUES('8' , '78' , 'P');
INSERT INTO frequencia VALUES('9' , '78' , 'P');
INSERT INTO frequencia VALUES('10' , '78' , 'P');
INSERT INTO frequencia VALUES('1' , '79' , 'P');
INSERT INTO frequencia VALUES('2' , '79' , 'P');
INSERT INTO frequencia VALUES('3' , '79' , 'P');
INSERT INTO frequencia VALUES('4' , '79' , 'P');
INSERT INTO frequencia VALUES('5' , '79' , 'P');
INSERT INTO frequencia VALUES('6' , '79' , 'P');
INSERT INTO frequencia VALUES('7' , '79' , 'P');
INSERT INTO frequencia VALUES('8' , '79' , 'P');
INSERT INTO frequencia VALUES('9' , '79' , 'P');
INSERT INTO frequencia VALUES('10' , '79' , 'P');
INSERT INTO frequencia VALUES('1' , '80' , 'P');
INSERT INTO frequencia VALUES('2' , '80' , 'P');
INSERT INTO frequencia VALUES('3' , '80' , 'P');
INSERT INTO frequencia VALUES('4' , '80' , 'P');
INSERT INTO frequencia VALUES('5' , '80' , 'P');
INSERT INTO frequencia VALUES('6' , '80' , 'P');
INSERT INTO frequencia VALUES('7' , '80' , 'P');
INSERT INTO frequencia VALUES('8' , '80' , 'P');
INSERT INTO frequencia VALUES('9' , '80' , 'P');
INSERT INTO frequencia VALUES('10' , '80' , 'P');
INSERT INTO frequencia VALUES('1' , '81' , 'P');
INSERT INTO frequencia VALUES('2' , '81' , 'P');
INSERT INTO frequencia VALUES('3' , '81' , 'P');
INSERT INTO frequencia VALUES('4' , '81' , 'P');
INSERT INTO frequencia VALUES('5' , '81' , 'P');
INSERT INTO frequencia VALUES('6' , '81' , 'P');
INSERT INTO frequencia VALUES('7' , '81' , 'P');
INSERT INTO frequencia VALUES('8' , '81' , 'P');
INSERT INTO frequencia VALUES('9' , '81' , 'P');
INSERT INTO frequencia VALUES('10' , '81' , 'P');

--CREATE TABLE avaliado

DROP TABLE IF EXISTS avaliacao CASCADE;
CREATE TABLE avaliacao(
Num_matricula INTEGER, 
Id_disciplina INTEGER,
Id_curso INTEGER,
Nota_parcial_1 NUMERIC(4,2), 
Nota_parcial_2 NUMERIC(4,2), 
Nota_final NUMERIC(4,2),
Situacao VARCHAR(20) NOT NULL CHECK(Situacao IN ('APROVADO', 'CURSANDO', 'REPROVADO')),
FOREIGN KEY (Num_matricula) REFERENCES alunos(Num_matricula) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Id_disciplina) REFERENCES disciplina(Id_disciplina) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Id_curso) REFERENCES curso(Id_curso) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(Num_matricula, Id_disciplina, Id_curso));

--POPULANDO TABLE avaliado

INSERT INTO avaliacao VALUES( '1' , '1' , '1' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '2' , '1' , '1' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '3' , '1' , '1' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '4' , '1' , '1' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '5' , '1' , '1' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '6' , '1' , '1' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '7' , '1' , '1' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '8' , '1' , '1' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '9' , '1' , '1' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '10' , '1' , '2' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '11' , '1' , '2' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '12' , '1' , '2' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '13' , '1' , '2' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '14' , '1' , '2' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '15' , '1' , '2' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '16' , '1' , '2' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '17' , '1' , '2' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '18' , '1' , '2' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '19' , '1' , '3' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '20' , '1' , '3' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '21' , '1' , '3' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '22' , '1' , '3' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '23' , '1' , '3' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '24' , '1' , '3' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '25' , '1' , '3' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '26' , '1' , '3' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '27' , '1' , '3' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '28' , '1' , '4' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '29' , '1' , '4' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '30' , '1' , '4' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '31' , '1' , '4' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '32' , '1' , '4' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '33' , '1' , '4' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '34' , '1' , '4' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '35' , '1' , '4' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '36' , '1' , '4' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '37' , '1' , '5' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '38' , '1' , '5' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '39' , '1' , '5' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '40' , '1' , '5' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '41' , '1' , '5' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '42' , '1' , '5' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '43' , '1' , '5' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '44' , '1' , '5' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '45' , '1' , '5' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '46' , '1' , '6' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '47' , '1' , '6' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '48' , '1' , '6' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '49' , '1' , '6' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '50' , '1' , '6' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '51' , '1' , '6' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '52' , '1' , '6' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '53' , '1' , '6' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '54' , '1' , '6' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '55' , '1' , '7' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '56' , '1' , '7' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '57' , '1' , '7' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '58' , '1' , '7' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '59' , '1' , '7' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '60' , '1' , '7' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '61' , '1' , '7' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '62' , '1' , '7' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '63' , '1' , '7' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '64' , '1' , '8' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '65' , '1' , '8' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '66' , '1' , '8' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '67' , '1' , '8' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '68' , '1' , '8' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '69' , '1' , '8' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '70' , '1' , '8' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '71' , '1' , '8' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '72' , '1' , '8' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '73' , '1' , '9' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '74' , '1' , '9' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '75' , '1' , '9' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '76' , '1' , '9' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '77' , '1' , '9' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '78' , '1' , '9' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '79' , '1' , '9' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '80' , '1' , '9' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '81' , '1' , '9' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '1' , '2' , '1' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '2' , '2' , '1' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '3' , '2' , '1' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '4' , '2' , '1' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '5' , '2' , '1' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '6' , '2' , '1' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '7' , '2' , '1' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '8' , '2' , '1' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '9' , '2' , '1' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '10' , '2' , '2' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '11' , '2' , '2' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '12' , '2' , '2' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '13' , '2' , '2' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '14' , '2' , '2' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '15' , '2' , '2' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '16' , '2' , '2' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '17' , '2' , '2' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '18' , '2' , '2' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '19' , '2' , '3' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '20' , '2' , '3' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '21' , '2' , '3' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '22' , '2' , '3' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '23' , '2' , '3' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '24' , '2' , '3' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '25' , '2' , '3' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '26' , '2' , '3' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '27' , '2' , '3' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '28' , '2' , '4' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '29' , '2' , '4' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '30' , '2' , '4' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '31' , '2' , '4' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '32' , '2' , '4' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '33' , '2' , '4' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '34' , '2' , '4' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '35' , '2' , '4' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '36' , '2' , '4' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '37' , '2' , '5' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '38' , '2' , '5' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '39' , '2' , '5' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '40' , '2' , '5' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '41' , '2' , '5' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '42' , '2' , '5' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '43' , '2' , '5' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '44' , '2' , '5' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '45' , '2' , '5' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '46' , '2' , '6' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '47' , '2' , '6' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '48' , '2' , '6' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '49' , '2' , '6' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '50' , '2' , '6' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '51' , '2' , '6' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '52' , '2' , '6' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '53' , '2' , '6' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '54' , '2' , '6' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '55' , '2' , '7' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '56' , '2' , '7' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '57' , '2' , '7' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '58' , '2' , '7' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '59' , '2' , '7' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '60' , '2' , '7' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '61' , '2' , '7' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '62' , '2' , '7' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '63' , '2' , '7' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '64' , '2' , '8' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '65' , '2' , '8' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '66' , '2' , '8' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '67' , '2' , '8' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '68' , '2' , '8' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '69' , '2' , '8' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '70' , '2' , '8' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '71' , '2' , '8' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '72' , '2' , '8' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '73' , '2' , '9' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '74' , '2' , '9' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '75' , '2' , '9' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '76' , '2' , '9' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '77' , '2' , '9' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '78' , '2' , '9' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '79' , '2' , '9' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '80' , '2' , '9' , '0' , '0' , '0'  , 'REPROVADO');
INSERT INTO avaliacao VALUES( '81' , '2' , '9' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '1' , '3' , '1' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '2' , '3' , '1' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '3' , '3' , '1' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '4' , '3' , '1' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '5' , '3' , '1' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '6' , '3' , '1' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '7' , '3' , '1' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '8' , '3' , '1' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '9' , '3' , '1' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '10' , '3' , '2' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '11' , '3' , '2' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '12' , '3' , '2' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '13' , '3' , '2' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '14' , '3' , '2' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '15' , '3' , '2' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '16' , '3' , '2' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '17' , '3' , '2' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '18' , '3' , '2' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '19' , '3' , '3' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '20' , '3' , '3' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '21' , '3' , '3' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '22' , '3' , '3' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '23' , '3' , '3' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '24' , '3' , '3' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '25' , '3' , '3' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '26' , '3' , '3' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '27' , '3' , '3' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '28' , '3' , '4' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '29' , '3' , '4' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '30' , '3' , '4' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '31' , '3' , '4' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '32' , '3' , '4' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '33' , '3' , '4' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '34' , '3' , '4' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '35' , '3' , '4' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '36' , '3' , '4' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '37' , '3' , '5' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '38' , '3' , '5' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '39' , '3' , '5' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '40' , '3' , '5' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '41' , '3' , '5' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '42' , '3' , '5' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '43' , '3' , '5' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '44' , '3' , '5' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '45' , '3' , '5' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '46' , '3' , '6' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '47' , '3' , '6' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '48' , '3' , '6' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '49' , '3' , '6' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '50' , '3' , '6' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '51' , '3' , '6' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '52' , '3' , '6' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '53' , '3' , '6' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '54' , '3' , '6' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '55' , '3' , '7' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '56' , '3' , '7' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '57' , '3' , '7' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '58' , '3' , '7' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '59' , '3' , '7' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '60' , '3' , '7' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '61' , '3' , '7' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '62' , '3' , '7' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '63' , '3' , '7' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '64' , '3' , '8' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '65' , '3' , '8' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '66' , '3' , '8' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '67' , '3' , '8' , '8' , '7' , '7.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '68' , '3' , '8' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '69' , '3' , '8' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '70' , '3' , '8' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '71' , '3' , '8' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '72' , '3' , '8' , '9' , '9' , '9'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '73' , '3' , '9' , '10' , '7' , '8.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '74' , '3' , '9' , '6' , '8' , '7'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '75' , '3' , '9' , '8' , '9.5' , '8.75'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '76' , '3' , '9' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '77' , '3' , '9' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '78' , '3' , '9' , '6.5' , '9.5' , '8'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '79' , '3' , '9' , '4' , '5' , '4.5'  , 'APROVADO');
INSERT INTO avaliacao VALUES( '80' , '3' , '9' , '0' , '0' , '0'  , 'REPROVADO');
INSERT INTO avaliacao VALUES( '81' , '3' , '9' , '6.5' , '9.5' , '8'  , 'APROVADO');

--VIZUALIZANDO TABLE avaliacao

SELECT * FROM avaliacao ;
