% Gramatica
% G/GG: genero 
% N/NN: numero {plural, sing}
% L/R: lista de relaciones encadenadas
% X/Y: personas involucradas en la pregunta
% Z: persona intermedia para resolver relaciones
% P: persona que aparece en la pregunta

% Preguntas que empiezan con quien/quienes
%preguntar --> quien_quienes.

% Preguntas que empiezan con es verdad
%preguntar --> es_verdad.

preguntar --> quien_quienes(N,Y),
	{((N == plu) -> write(Y), nl, fail)
        ;(write(Y),nl,stop)}.

% Quien/Quienes...

quien_quienes(N,Y) --> quien(N),verbo(N),articulo(G,N),rec(G,N,_L,_X,Y).
rec(G,N,[R|L],X,Y) --> relacion(G,N,R,Z,Y),conector(GG,NN),rec(GG,NN,L,X,Z).
rec(G,N,[R],X,Y) --> relacion(G,N,R,X,Y),[de],persona(X).

% Es verdad...
es_verdad --> [es],[verdad],[que],persona(Y),verbo(N),articulo(G,N),rec(G,N,R,_X,Y).

% Devuelve en P el nombre parseado
persona(P) --> [P].

% Simbolos Terminales
conector(masc,sin) --> [del].
conector(masc,plu) --> [de],[los].
conector(fem,sin) --> [de],[la].
conector(fem,plu) --> [de],[las].

quien(plu) --> [quienes].
quien(sin) --> [quien].

verbo(plu) --> [son].
verbo(sin) --> [es].

articulo(masc,sin) --> [el].
articulo(masc,plu) --> [los].
articulo(fem,sin) --> [la].
articulo(fem,plu) --> [las].

% Relaciones que se llevan en la lista
% Los predicados entre llaves permiten
% ir calculando a medida que se parsea

% Masculinas y Singulares
relacion(masc,sin,esEsposo(Y,X),X,Y) --> [esposo], {esposo(Y,X)}.
relacion(masc,sin,esPadre(Y,X),X,Y) --> [padre], {padre(Y,X)}.
relacion(masc,sin,esHermano(Y,X),X,Y) --> [hermano], {hermano(Y,X)}.
relacion(masc,sin,esAbuelo(Y,X),X,Y) --> [abuelo], {abuelo(Y,X)}.
relacion(masc,sin,esHijo(Y,X),X,Y) --> [hijo], {hijo(Y,X)}.
relacion(masc,sin,esNieto(Y,X),X,Y) --> [nieto], {nieto(Y,X)}.
relacion(masc,sin,esTio(Y,X),X,Y) --> [tio], {tio(Y,X)}.
relacion(masc,sin,esSobrino(Y,X),X,Y) --> [sobrino], {sobrino(Y,X)}.
relacion(masc,sin,esCunado(Y,X),X,Y) --> [cunado], {cunado(Y,X)}.
relacion(masc,sin,esSuegro(Y,X),X,Y) --> [suegro], {suegro(Y,X)}.

% Femeninas y Singulares
relacion(fem,sin,esEsposa(Y,X),X,Y) --> [esposa], {esposa(Y,X)}.
relacion(fem,sin,esMadre(Y,X),X,Y) --> [madre], {madre(Y,X)}.
relacion(fem,sin,esHermana(Y,X),X,Y) --> [hermana], {hermana(Y,X)}.
relacion(fem,sin,esAbuela(Y,X),X,Y) --> [abuela], {abuela(Y,X)}.
relacion(fem,sin,esHija(Y,X),X,Y) --> [hija], {hija(Y,X)}.
relacion(fem,sin,esNieta(Y,X),X,Y) --> [nieta], {nieta(Y,X)}.
relacion(fem,sin,esTia(Y,X),X,Y) --> [tia], {tia(Y,X)}.
relacion(fem,sin,esSobrina(Y,X),X,Y) --> [sobrina], {sobrina(Y,X)}.
relacion(fem,sin,esCunada(Y,X),X,Y) --> [cunada], {cunada(Y,X)}.
relacion(fem,sin,esSuegra(Y,X),X,Y) --> [suegra], {suegra(Y,X)}.

% Masculinas y Plurales
relacion(masc,plu,sonHermanos(Y,X),X,Y) --> [hermanos], {hermano(Y,X)}.
relacion(masc,plu,sonAbuelos(Y,X),X,Y) --> [abuelos], {abuelo(Y,X)}.
relacion(masc,plu,sonHijos(Y,X),X,Y) --> [hijos], {hijo(Y,X)}.
relacion(masc,plu,sonNietos(Y,X),X,Y) --> [nietos], {nieto(Y,X)}.
relacion(masc,plu,sonTios(Y,X),X,Y) --> [tios], {tio(Y,X)}.
relacion(masc,plu,sonSobrinos(Y,X),X,Y) --> [sobrinos], {sobrino(Y,X)}.
relacion(masc,plu,sonCunados(Y,X),X,Y) --> [cunados], {cunado(Y,X)}.

% Femeninas y Plurales
relacion(fem,plu,sonHermanas(Y,X),X,Y) --> [hermanas], {hermana(Y,X)}.
relacion(fem,plu,sonAbuelas(Y,X),X,Y) --> [abuelas], {abuela(Y,X)}.
relacion(fem,plu,sonHijas(Y,X),X,Y) --> [hijas], {hija(Y,X)}.
relacion(fem,plu,sonNietas(Y,X),X,Y) --> [nietas], {nieta(Y,X)}.
relacion(fem,plu,sonTias(Y,X),X,Y) --> [tias], {tia(Y,X)}.
relacion(fem,plu,sonSobrinas(Y,X),X,Y) --> [sobrinas], {sobrina(Y,X)}.
relacion(fem,plu,sonCunadas(Y,X),X,Y) --> [cunadas], {cunada(Y,X)}.
relacion(fem,plu,sonSuegras(Y,X),X,Y) --> [suegras], {suegra(Y,X)}.

% Hechos (Base de Conocimiento)
persona(carlitos,masc).
persona(pancho,masc).
persona(mane,fem).
persona(kiko,masc).
persona(arturo,masc).
persona(yamir,fem).
persona(arturito,masc).
persona(jose,masc).
persona(carmen,fem).
persona(joy,masc).
persona(laura,fem).
persona(papapa,masc).
persona(mamama,fem).
persona(miguel,masc).

esposo(papapa,mamama).
esposo(kiko,mane).
esposo(joy,laura).
esposo(arturo,yamir).

padre(kiko,carlitos).
padre(kiko,pancho).
padre(joy,jose).
padre(joy,carmen).
padre(arturo,arturito).
padre(arturo,carlos).
padre(papapa,kiko).
padre(papapa,arturo).
padre(papapa,joy).
padre(papapa,miguel).


madre(mane,lili).
madre(mane,carlitos).
madre(mane,pancho).
madre(laura,jose).
madre(laura,carmen).
madre(mamama,kiko).
madre(mamama,arturo).
madre(mamama,miguel).
madre(mamama,joy).
madre(yamir,carlos).


% Relaciones (definidas de acuerdo con el enunciado,excepto hermano)
esposa(X,Y):- esposo(Y,X).

% La relacion herman@ no se definio como se explica en el enunciado
% ya que se repetian resultados.
% Se definio la relacion herman@(X,Y) como "X es hermano de Y si
% Y y X tienen el mismo padre y la misma madre, o solo tienen el
% mismo padre, o solo tienen la misma madre.
hermano(X,Y):- 
	persona(X,masc),
	((padre(Z,X), padre(Z,Y), madre(W,X), madre(W,Y)); % (1)
	(padre(Z,X), padre(Z,Y), \+ (madre(W,X), madre(W,Y))); % (2)
	( \+ (padre(Z,X), padre(Z,Y)), madre(W,X), madre(W,Y))), % (3)
	X\=Y.
hermana(X,Y):- 
	persona(X,fem),
	((padre(Z,X), padre(Z,Y), madre(W,X), madre(W,Y)); % (1)
	(padre(Z,X), padre(Z,Y), \+ (madre(W,X), madre(W,X))); % (2)
	( \+ (padre(Z,X), padre(Z,Y)), madre(W,X), madre(W,X))), % (3)
	X\=Y.
abuelo(X,Y):- padre(X,Z), (padre(Z,Y); madre(Z,Y)).
abuela(X,Y):- madre(X,Z), (madre(Z,Y); padre(Z,Y)).
hijo(X,Y):- persona(X,masc), (padre(Y,X); madre(Y,X)).
hija(X,Y):- persona(X,fem), (padre(Y,X); madre(Y,X)).
nieto(X,Y):- hijo(X,Z), (hijo(Z,Y); hija(Z,Y)).
nieta(X,Y):- hija(X,Z), (hijo(Z,Y); hija(Z,Y)).
tio(X,Y):- hermano(X,Z), (padre(Z,Y) ; madre(Z,Y)).
tia(X,Y):- hermana(X,Z), (padre(Z,Y) ; madre(Z,Y)).
sobrino(X,Y):- hijo(X,Z), (hermano(Z,Y); hermana(Z,Y)).
sobrina(X,Y):- hija(X,Z), (hermano(Z,Y); hermana(Z,Y)).
cunado(X,Y):- (esposo(X,Z), (hermano(Y,Z); hermana(Y,Z))) ; (hermano(X,H), (esposo(H,Y); esposa(H,Y))).
cunada(X,Y):- (esposa(X,Z), (hermano(Y,Z); hermana(Y,Z))) ; (hermana(X,H), (esposo(H,Y); esposa(H,Y))).
suegro(X,Y):- padre(X,Z), (esposo(Z,Y); esposa(Z,Y)).
suegra(X,Y):- madre(X,Z), (esposo(Z,Y); esposa(Z,Y)).
