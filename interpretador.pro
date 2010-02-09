% Gramatica
% G: genero 
% N: numero {plural, sing}

preguntar --> quien_quienes.
preguntar --> es_verdad.

% p1 = quien o quienes...
quien_quienes --> quien(N),verbo(N),articulo(G,N),rec(G,N,_L,_X,Y), {write(Y)}.
rec(G,N,[R|L],X,Y) --> relacion(G,N,R,Z,Y),conector(GG,NN),rec(GG,NN,L,X,Z).
rec(G,N,[R],X,Y) --> relacion(G,N,R,X,Y),[de],persona(X).

%p2 = es verdad...
es_verdad --> [es],[verdad],[que],persona(Y),verbo(N),articulo(G,N),rec(G,N,R,_X,Y), {write(R)}.

persona(P) --> [P].


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

relacion(masc,plu,sonHermanos(Y,X),X,Y) --> [hermanos], {hermano(Y,X),!}.
relacion(masc,plu,sonAbuelos(Y,X),X,Y) --> [abuelos], {abuelos(Y,X)}.
relacion(masc,plu,sonHijos(Y,X),X,Y) --> [hijos], {hijos(Y,X)}.
relacion(masc,plu,sonNietos(Y,X),X,Y) --> [nietos], {nietos(Y,X)}.
relacion(masc,plu,sonTios(Y,X),X,Y) --> [tios], {tios(Y,X)}.
relacion(masc,plu,sonSobrinos(Y,X),X,Y) --> [sobrinos], {sobrinos(Y,X)}.
relacion(masc,plu,sonCunados(Y,X),X,Y) --> [cunados], {cunados(Y,X)}.

relacion(fem,plu,sonHermanas(Y,X),X,Y) --> [hermanas], {hermanas(Y,X)}.
relacion(fem,plu,sonAbuelas(Y,X),X,Y) --> [abuelas], {abuelas(Y,X)}.
relacion(fem,plu,sonHijas(Y,X),X,Y) --> [hijas], {hijas(Y,X)}.
relacion(fem,plu,sonNietas(Y,X),X,Y) --> [nietas], {nietas(Y,X)}.
relacion(fem,plu,sonTias(Y,X),X,Y) --> [tias], {tias(Y,X)}.
relacion(fem,plu,sonSobrinas(Y,X),X,Y) --> [sobrinas], {sobrinas(Y,X)}.
relacion(fem,plu,sonCunadas(Y,X),X,Y) --> [cunadas], {cunadas(Y,X)}.
relacion(fem,plu,sonSuegras(Y,X),X,Y) --> [suegras], {suegras(Y,X)}.

% Hechos
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

madre(mane,carlitos).
madre(mane,pancho).
madre(laura,jose).
madre(laura,carmen).
madre(mamama,kiko).
madre(mamama,arturo).
madre(mamama,miguel).
madre(mamama,joy).
madre(yamir,carlos).


% Relaciones
esposa(X,Y):- esposo(Y,X).
hermano(X,Y):- persona(X,masc), ((padre(Z,X), padre(Z,Y)); (madre(Z,X), madre(Z,Y))), X\=Y.
hermana(X,Y):- persona(X,fem), ((padre(Z,X), padre(Z,Y)); (madre(Z,X), madre(Z,Y))), X\=Y.
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
