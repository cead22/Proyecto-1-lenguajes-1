/**
  * Laboratorio de Lenguajes
  * 
  * Proyecto 1: Consultas en lenguaje natural a una base de conocimiento 
  * sobre genealogía
  *
  * Integrantes:
  * Molina Gabriela 06-30028
  * Pereira Alechandrina 06-40048
 */

persona(michael,mas).
persona(charles_gordon,mas).
persona(jim,mas).
persona(elmo,mas).
persona(greg,mas).
persona(peter,mas).
persona(cathy,fem).
persona(sharon,fem).
persona(julie,fem).
persona(melody,fem).
persona(crystal,fem).
persona(stephanie,fem).
persona(danielle,fem).
persona(hazel,fem).
persona(eleanor,fem).
persona(maria,fem).

padre(michael, cathy).
padre(michael, sharon).
padre(charles_gordon, michael).
padre(charles_gordon, julie).
padre(charles, charles_gordon).
padre(jim, melody).
padre(jim, crystal).
padre(elmo, jim).
padre(greg, stephanie).
padre(greg, peter).
padre(greg, maria).
padre(greg, danielle).

madre(melody, cathy).
madre(melody, sharon).
madre(hazel, michael).
madre(hazel, julie).
madre(eleanor, melody).
madre(eleanor, crystal).
madre(crystal, stephanie).
madre(crystal, peter).
madre(crystal, maria).
madre(crystal, danielle).

esposo(michael,melody).
esposo(charles_gordon,hazel).
esposo(jim,eleanor).
esposo(elmo,crystal).

    :- op(100, xfy, and).
    :- op(150, xfy, =>).

    sentence(S) --> np(X,Assn,S),vp(X,Assn).
  
    np(X,Assn,S) --> deter(X, Prop12,Assn,S),noun(X,Prop1),rel_clause(X,Prop1,Prop12).

    np(X,Assn,Assn) --> pn(X).

    vp(X,Assn) --> tver(X,Y,Assn1),np(Y,Assn1,Assn).

    vp(X,Assn) --> iv(X,Assn).

    rel_clause(X,Prop1,Prop1 and Prop2) -->
      [ that],vp(X,Prop2).

    rel_clause(X,Prop1,Prop1) --> [].

    deter(X,Prop,Assn,all(X,Prop => Assn)) --> [every].

    deter(X,Prop,Assn,exists(X,Prop and Assn)) --> [a].

    noun(X,man(X)) --> [man].
    
    noun(X,woman(X)) --> [woman].

    pn(john) --> [john].

   tver(X,Y,likes(X,Y)) --> [likes].

   iv(X,paints(X)) --> [paints].