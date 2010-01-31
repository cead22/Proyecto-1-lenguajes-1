% nos
persona(carlitos,masc).
persona(pancho,masc).
persona(mane,fem).
persona(kiko,masc).
persona(arturo,masc).
persona(yamir,fem).
persona(arturito,masc).
persona(carlos,fem).
persona(jose,masc).
persona(carmen,fem).
persona(joy,masc).
persona(laura,fem).
persona(arturo,masc).
persona(yamir,fem).
persona(arturito,masc).
persona(carlos,fem).
persona(papapa,masc).
persona(mamama,fem).
persona(miguel,masc).

esposo(kiko,mane).
esposo(joy,laura).
esposo(arturo,yamir).
esposo(arturo,yamir).

padre(kiko,carlitos).
padre(kiko,pancho).
padre(joy,jose).
padre(joy,carmen).
padre(arturo,arturito).
padre(arturo,carlos).
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
madre(yamir,carlos).

esposa(X,Y):- esposo(Y,X).
hermano(X,Y):- persona(X,masc), ((padre(Z,X), padre(Z,Y)); (madre(Z,X), madre(Z,Y))).
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
