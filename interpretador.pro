% GRAMATICA
% G/GG: genero 
% N/NN: numero {plural, sing}
% L/R: lista de relaciones encadenadas
% X/Y: personas involucradas en la pregunta
% Z: persona intermedia para resolver relaciones
% P: persona que aparece en la pregunta

% Preguntas que empiezan con quien/quienes
% Si se esta haciendo la pregunta en plural (quienes son...)
% entonces con la funcion fail se oliga a hacer backtracking
% para buscar todos los resultados sin tener que escribir ;
% en la consola.
% En caso contrario se detiene la ejecucion con stop luego de
% devolver el primer resultado 
preguntar --> quien_quienes(L), {invertir(L,Q), eval(Q,Z)}.

% Preguntas que empiezan con es verdad
preguntar --> es_verdad(L), {invertir(L,Q), eval(Q,_)}.

% Quien/Quienes...
quien_quienes(L) --> quien(N),verbo(N),articulo(G,N),rec(G,N,L,_X,_Y).

% rec permite parsear preguntas 'recursivas'
rec(G,N,[R|L],X,Y) --> relacion(G,N,R,Z,Y),conector(GG,NN),rec(GG,NN,L,X,Z).

% en este momento termina la pregunta
rec(G,N,[R],X,Y) --> relacion(G,N,R,X,Y),[de],persona(X).

% Es verdad...
es_verdad(R) --> [es],[verdad],[que],persona(Y),verbo(N),articulo(G,N),rec(G,N,R,_X,Y).%, {write(R)}.

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
relacion(masc,sin,esEsposo(Y,X),X,Y) --> [esposo].
relacion(masc,sin,esPadre(Y,X),X,Y)  --> [padre].
relacion(masc,sin,esHermano(Y,X),X,Y)--> [hermano].
relacion(masc,sin,esAbuelo(Y,X),X,Y) --> [abuelo].
relacion(masc,sin,esHijo(Y,X),X,Y)   --> [hijo].
relacion(masc,sin,esNieto(Y,X),X,Y)  --> [nieto].
relacion(masc,sin,esTio(Y,X),X,Y)    --> [tio].
relacion(masc,sin,esSobrino(Y,X),X,Y)--> [sobrino].
relacion(masc,sin,esCunado(Y,X),X,Y) --> [cunado].
relacion(masc,sin,esSuegro(Y,X),X,Y) --> [suegro].

% Femeninas y Singulares
relacion(fem,sin,esEsposa(Y,X),X,Y)  --> [esposa].
relacion(fem,sin,esMadre(Y,X),X,Y)   --> [madre].
relacion(fem,sin,esHermana(Y,X),X,Y) --> [hermana].
relacion(fem,sin,esAbuela(Y,X),X,Y)  --> [abuela].
relacion(fem,sin,esHija(Y,X),X,Y)    --> [hija].
relacion(fem,sin,esNieta(Y,X),X,Y)   --> [nieta].
relacion(fem,sin,esTia(Y,X),X,Y)     --> [tia].
relacion(fem,sin,esSobrina(Y,X),X,Y) --> [sobrina].
relacion(fem,sin,esCunada(Y,X),X,Y)  --> [cunada].
relacion(fem,sin,esSuegra(Y,X),X,Y)  --> [suegra].

% Masculinas y Plurales
relacion(masc,plu,sonHermanos(Y,X),X,Y) --> [hermanos].
relacion(masc,plu,sonAbuelos(Y,X),X,Y)  --> [abuelos].
relacion(masc,plu,sonHijos(Y,X),X,Y)    --> [hijos].
relacion(masc,plu,sonNietos(Y,X),X,Y)   --> [nietos].
relacion(masc,plu,sonTios(Y,X),X,Y)     --> [tios].
relacion(masc,plu,sonSobrinos(Y,X),X,Y) --> [sobrinos].
relacion(masc,plu,sonCunados(Y,X),X,Y)  --> [cunados].

% Femeninas y Plurales
relacion(fem,plu,sonHermanas(Y,X),X,Y)  --> [hermanas].
relacion(fem,plu,sonAbuelas(Y,X),X,Y)   --> [abuelas].
relacion(fem,plu,sonHijas(Y,X),X,Y)     --> [hijas].
relacion(fem,plu,sonNietas(Y,X),X,Y)    --> [nietas].
relacion(fem,plu,sonTias(Y,X),X,Y)      --> [tias].
relacion(fem,plu,sonSobrinas(Y,X),X,Y)  --> [sobrinas].
relacion(fem,plu,sonCunadas(Y,X),X,Y)   --> [cunadas].
relacion(fem,plu,sonSuegras(Y,X),X,Y)   --> [suegras].

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
persona(carlos,masc).

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

madre(mane,carlitos).
madre(mane,pancho).
madre(laura,jose).
madre(laura,carmen).
madre(mamama,kiko).
madre(mamama,arturo).
madre(mamama,miguel).
madre(mamama,joy).
madre(yamir,carlos).

% Relaciones que devuelven 1 resultado 
% (definidas de acuerdo con el enunciado, excepto herman@)

% La relacion herman@ no se definio como se explica en el enunciado
% ya que se repetian resultados.
% Se definio la relacion herman@(X,Y) como "X es hermano de Y" si
% Y y X tienen el mismo padre y la misma madre (1), o solo tienen el
% mismo padre (2), o solo tienen la misma madre (3).


hermano(X,Y):- 
	persona(X,masc),
	((padre(Z,X),padre(Z,Y), madre(W,X), madre(W,Y)); % (1)
	(padre(Z,X), padre(Z,Y), \+ (madre(W,X), madre(W,Y))); % (2)
	( \+ (padre(Z,X), padre(Z,Y)), madre(W,X), madre(W,Y))), % (3)
	X\=Y.

hermana(X,Y):- 
	persona(X,fem),
	((padre(Z,X), padre(Z,Y), madre(W,X), madre(W,Y));
	(padre(Z,X), padre(Z,Y), \+ (madre(W,X), madre(W,X)));
	( \+ (padre(Z,X), padre(Z,Y)), madre(W,X), madre(W,X))),
	X\=Y.

esposa(X,Y):- 
	esposo(Y,X).

abuelo(X,Y):-
	padre(X,Z),
	(padre(Z,Y); madre(Z,Y)).

abuela(X,Y):-
	madre(X,Z),
	(madre(Z,Y); padre(Z,Y)).

hijo(X,Y):- 
	persona(X,masc),
	(padre(Y,X); madre(Y,X)).

hija(X,Y):-
	persona(X,fem),
	(padre(Y,X);  madre(Y,X)).

nieto(X,Y):- 
	hijo(X,Z),
	(hijo(Z,Y); hija(Z,Y)).

nieta(X,Y):-
	hija(X,Z),
	(hijo(Z,Y); hija(Z,Y)).

tio(X,Y):-
	hermano(X,Z),
	(padre(Z,Y); madre(Z,Y)).

tia(X,Y):- 
	hermana(X,Z),
	(padre(Z,Y); madre(Z,Y)).

sobrino(X,Y):-
	hijo(X,Z),
	(hermano(Z,Y); hermana(Z,Y)).

sobrina(X,Y):-
	hija(X,Z),
	(hermano(Z,Y); hermana(Z,Y)).

cunado(X,Y):-
	(esposo(X,Z),(hermano(Y,Z); hermana(Y,Z)));
	(hermano(X,H), (esposo(H,Y);esposa(H,Y))).

cunada(X,Y):- 
	(esposa(X,Z), (hermano(Y,Z); hermana(Y,Z)));
	(hermana(X,H), (esposo(H,Y); esposa(H,Y))).

suegro(X,Y):-
	padre(X,Z),
	(esposo(Z,Y); esposa(Z,Y)).

suegra(X,Y):-
	madre(X,Z),
	(esposo(Z,Y); esposa(Z,Y)).

% Utilizada para invertir la lista
% de relaciones encadenadas
invertir([],[]). 
invertir([H|T],L):-
	invertir(T,R), concatenar(R,[H],L).

% Usada por la funcion invertir
concatenar([],L,L). 
concatenar([X|L1],L2,[X|L3]):-
	concatenar(L1,L2,L3).

% Evalua la lista de relaciones encadenadas
% y da la respuesta a la pregunta
eval([],R):-
	write(R).

eval([H|T],_R):-

	% Si se lee de la lista 'esEsposo' 

	H = esEsposo(A,B)  -> esposo(A,B),  eval(T,A);
	H = esPadre(A,B)   -> padre(A,B),   eval(T,A);
	H = esHermano(A,B) -> hermano(A,B), eval(T,A);
	H = esAbuelo(A,B)  -> abuelo(A,B),  eval(T,A);
	H = esHijo(A,B)    -> hijo(A,B),    eval(T,A);
	H = esNieto(A,B)   -> nieto(A,B),   eval(T,A);
	H = esSobrino(A,B) -> sobrino(A,B), eval(T,A);
	H = esCunado(A,B)  -> cunado(A,B),  eval(T,A);
	H = esSuegro(A,B)  -> suegro(A,B),  eval(T,A);

	H = esEsposa(A,B)  -> esposa(A,B),  eval(T,A);
	H = esMadre(A,B)   -> madre(A,B),   eval(T,A);
	H = esHermana(A,B) -> hermana(A,B), eval(T,A);
	H = esAbuela(A,B)  -> abuela(A,B),  eval(T,A);
	H = esHija(A,B)    -> hija(A,B),    eval(T,A);
	H = esNieta(A,B)   -> nieta(A,B),   eval(T,A);
	H = esSobrina(A,B) -> sobrina(A,B), eval(T,A);
	H = esCunada(A,B)  -> cunada(A,B),  eval(T,A);
	H = esSuegra(A,B)  -> suegra(A,B),  eval(T,A);

	% Si T es la lista vacia, estamos en la primera relacion
	% de la lista de relaciones encadenadas, y se formatea
	% la respuesta de acuerdo con el N (plu, sin) de la pregunta.
        length(T,0) -> 
	(
 	  H = sonHermanos(A,B) -> findall(C,hermano(C,B),A), eval(T,A);
 	  H = sonAbuelos(A,B)  -> findall(C,abuelo(C,B),A),  eval(T,A);
 	  H = sonHijos(A,B)    -> findall(C,hijo(C,B),A),    eval(T,A);
 	  H = sonNietos(A,B)   -> findall(C,nieto(C,B),A),   eval(T,A);
 	  H = sonSobrinos(A,B) -> findall(C,sobrino(C,B),A), eval(T,A);
 	  H = sonCunados(A,B)  -> findall(C,cunado(C,B),A),  eval(T,A);

 	  H = sonHermanas(A,B) -> findall(C,hermana(C,B),A), eval(T,A);
 	  H = sonAbuelas(A,B)  -> findall(C,abuela(C,B),A),  eval(T,A);
 	  H = sonHijas(A,B)    -> findall(C,hija(C,B),A),    eval(T,A);
 	  H = sonNietas(A,B)   -> findall(C,nieta(C,B),A),   eval(T,A);
 	  H = sonSobrinas(A,B) -> findall(C,sobrina(C,B),A), eval(T,A);
 	  H = sonCunadas(A,B)  -> findall(C,cunada(C,B),A),  eval(T,A);
	  true
        )

        % else
       ;(
	  H = sonHermanos(A,B) -> hermano(A,B), eval(T,A);
 	  H = sonAbuelos(A,B)  -> abuelo(A,B),  eval(T,A);
 	  H = sonHijos(A,B)    -> hijo(A,B),    eval(T,A);
 	  H = sonNietos(A,B)   -> nieto(A,B),   eval(T,A);
 	  H = sonSobrinos(A,B) -> sobrino(A,B), eval(T,A);
 	  H = sonCunados(A,B)  -> cunado(A,B),  eval(T,A);
	  
 	  H = sonHermanas(A,B) -> hermana(A,B), eval(T,A);
 	  H = sonAbuelas(A,B)  -> abuela(A,B),  eval(T,A);
 	  H = sonHijas(A,B)    -> hija(A,B),    eval(T,A);
 	  H = sonNietas(A,B)   -> nieta(A,B),   eval(T,A);
 	  H = sonSobrinas(A,B) -> sobrina(A,B), eval(T,A);
 	  H = sonCunadas(A,B)  -> cunada(A,B),  eval(T,A);
 	  true
        ).