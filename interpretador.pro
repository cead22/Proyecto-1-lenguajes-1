% Gramatica
% G: genero 
% N: numero {plural, sing}

preguntar --> quien_quienes.
preguntar --> es_verdad.

% p1 = quien o quienes...
quien_quienes --> quien(N),verbo(N),articulo(G,N),rec(G,N).
rec(G,N) --> relacion(G,N),['de'],persona(B), {relacion(X,B), write(X)}.
rec(G,N) --> relacion(G,N),conector(GG,NN),rec(GG,NN).

%p2 = es verdad...
es_verdad --> [es],[verdad],[que],persona,verbo(N),articulo(G,N),rec(G,N).

persona(W) --> [W],{persona(W,masc)}.
relacion(G,N,A) --> [A],{relacion(G,N)}.

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

relacion(masc,sin) --> [esposo].
relacion(masc,sin) --> [padre].
relacion(masc,sin) --> [hermano].
relacion(masc,sin) --> [abuelo].
relacion(masc,sin) --> [hijo].
relacion(masc,sin) --> [nieto].
relacion(masc,sin) --> [tio].
relacion(masc,sin) --> [sobrino].
relacion(masc,sin) --> [cunado].
relacion(masc,sin) --> [suegro].

relacion(fem,sin) --> [esposa].
relacion(fem,sin) --> [madre].
relacion(fem,sin) --> [hermana].
relacion(fem,sin) --> [abuela].
relacion(fem,sin) --> [hija].
relacion(fem,sin) --> [nieta].
relacion(fem,sin) --> [tia].
relacion(fem,sin) --> [sobrina].
relacion(fem,sin) --> [cunada].
relacion(fem,sin) --> [suegra].

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
