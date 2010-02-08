% Gramatica
% G: genero 
% N: numero {plural, sing}

preguntar --> quien_quienes.
preguntar --> es_verdad.

% p1 = quien o quienes...
quien_quienes --> quien(N),verbo(N),articulo(G,N),rec(G,N).
rec(G,N) --> relacion(G,N,X,Y),['de'],persona(X), {write(Y)}.
rec(G,N) --> relacion(G,N,X,Y),conector(GG,NN),rec(GG,NN), {write(Y)}.

%p2 = es verdad...
es_verdad --> [es],[verdad],[que],persona,verbo(N),articulo(G,N),rec(G,N).

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


relacion(masc,sin,X,Y) --> [esposo], {esposo(Y,X)}.
relacion(masc,sin,X,Y) --> [padre], {padre(Y,X)}.
relacion(masc,sin,X,Y) --> [hermano], {hermano(Y,X)}.
relacion(masc,sin,X,Y) --> [abuelo], {abuelo(Y,X)}.
relacion(masc,sin,X,Y) --> [hijo], {hijo(Y,X)}.
relacion(masc,sin,X,Y) --> [nieto], {nieto(Y,X)}.
relacion(masc,sin,X,Y) --> [tio], {tio(Y,X)}.
relacion(masc,sin,X,Y) --> [sobrino], {sobrino(Y,X)}.
relacion(masc,sin,X,Y) --> [cunado], {cunado(Y,X)}.
relacion(masc,sin,X,Y) --> [suegro], {suegro(Y,X)}.

relacion(fem,sin,X,Y) --> [esposa], {esposa(Y,X)}.
relacion(fem,sin,X,Y) --> [madre], {madre(Y,X)}.
relacion(fem,sin,X,Y) --> [hermana], {hermana(Y,X)}.
relacion(fem,sin,X,Y) --> [abuela], {abuela(Y,X)}.
relacion(fem,sin,X,Y) --> [hija], {hija(Y,X)}.
relacion(fem,sin,X,Y) --> [nieta], {nieta(Y,X)}.
relacion(fem,sin,X,Y) --> [tia], {tia(Y,X)}.
relacion(fem,sin,X,Y) --> [sobrina], {sobrina(Y,X)}.
relacion(fem,sin,X,Y) --> [cunada], {cunada(Y,X)}.
relacion(fem,sin,X,Y) --> [suegra], {suegra(Y,X)}.

relacion(masc,plu) --> [esposos].
relacion(masc,plu) --> [hermanos].
relacion(masc,plu) --> [abuelos].
relacion(masc,plu) --> [hijos].
relacion(masc,plu) --> [nietos].
relacion(masc,plu) --> [tios].
relacion(masc,plu) --> [sobrinos].
relacion(masc,plu) --> [cunados].
relacion(masc,plu) --> [suegros].

relacion(fem,plu) --> [esposas].
relacion(fem,plu) --> [hermanas].
relacion(fem,plu) --> [abuelas].
relacion(fem,plu) --> [hijas].
relacion(fem,plu) --> [nietas].
relacion(fem,plu) --> [tias].
relacion(fem,plu) --> [sobrinas].
relacion(fem,plu) --> [cunadas].
relacion(fem,plu) --> [suegras].



persona(X):- persona(X,masc) ; persona(X,fem).


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
hermana(X,Y):- persona(X,fem), ((padre(Z,X), padre(Z,Y)); (madre(Z,X), madre(Z,Y))).
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
