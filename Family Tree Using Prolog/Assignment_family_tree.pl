
spouse(jahiruddin,meher).
spouse(azizul,fatema).
spouse(sattar,afroja).
spouse(aneek,salma).
spouse(sahil,riana).
spouse(omisha,zain).
spouse(hena,samad).
spouse(surovi,rasel).
spouse(raisa,ayan).
spouse(arosh,esha).
spouse(bazrul,helena).
spouse(mustafa,tamanna).
spouse(vor,siam).
spouse(diya,farhan).


father(jahiruddin,azizul).
father(jahiruddin,bazrul).
father(azizul,sattar).
father(sattar,aneek).
father(aneek,sahil).
father(sahil,omisha).
father(zain,fiona).
father(sattar,sararah).
father(azizul,hena).
father(samad,surovi).
father(rasel,raisa).
father(ayan,arosh).
father(arosh,aliya).
father(rasel,rehan).
father(bazrul,mustafa).
father(mustafa,vor).
father(siam,diya).
father(farhan,emma).



mother(meher,azizul).
mother(meher,bazrul).
mother(fatema,sattar).
mother(fatema,hena).
mother(afroja,aneek).
mother(afroja,sararah).
mother(salma,sahil).
mother(riana,omisha).
mother(omisha,fiona).
mother(hena,surovi).
mother(surovi,raisa).
mother(raisa,arosh).
mother(omisha,fiona).
mother(esha,aliya).
mother(surovi,rehan).
mother(helena,mustafa).
mother(tamanna,vor).
mother(vor,diya).
mother(diya,emma).




parent( X, Y ) :-
    father( X, Y );
    mother( X, Y ).

child(X, Y) :-
    parent(Y, X).

grandparent(X, Y) :-
    parent(Z, Y),
    parent(X, Z).


greatgrandparent(X, Y) :-
    parent(P, Y),
    grandparent(X, P).

greatgreatgrandparent( X, Y ) :-
    grandparent(Z ,Y),
    grandparent( X, Z ).

greatgreatgreatgrandparent( X, Y ) :-
    parent(Z, Y),
    greatgreatgrandparent(X, Z).



sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.


parentsinlaw( X, Y ) :-
    spouse(Z, Y),
    parent( X, Z ).



cousin(X, Y) :-
    grandparent(Z, X),
    grandparent(Z, Y),
    \+sibling(X, Y),
    X \= Y.


secondcousin(X, Y) :-
    greatgrandparent(Z, X),
    greatgrandparent(Z, Y),
    \+sibling(X, Y),
    \+cousin(X, Y),
    X \= Y.

thirdcousin(X, Y) :-
    greatgreatgrandparent(Z, X),
    greatgreatgrandparent(Z, Y),
    \+sibling(X, Y),
    \+cousin(X, Y),
    \+secondcousin(X, Y),
    X\= Y.


fourthcousin(X, Y) :-
    greatgreatgreatgrandparent(Z,X),
    greatgreatgreatgrandparent(Z,Y),
     \+sibling(X, Y),
     \+cousin(X, Y),
     \+secondcousin(X, Y),
     \+thirdcousin(X, Y),
     X\= Y.





firstcousinonceremoved(X, Y) :-
    cousin(Z, Y),
    child(X, Z).

firstcousintwiceremoved(X, Y) :-
    cousin(Z, Y),
    grandparent(Z, X).

firstcousinthriceremoved(X, Y) :-
    cousin(Z, Y),
    greatgrandparent(Z, X).

firstcousinfourthremoved(X, Y) :-
    cousin(Z, Y),
    greatgreatgrandparent(Z, X).



secondcousinonceremoved(X, Y ) :-
    secondcousin(Z, Y),
    parent(Z, X).

secondcousintwiceremoved(X, Y ) :-
    grandparent(Z, X),
    secondcousin(Z, Y).

secondcousinthriceremoved(X, Y ) :-
    greatgrandparent(Z, X),
    secondcousin(Z, Y).




thirdcousinonceremoved(X, Y ) :-
    parent(Z, X),
    thirdcousin(Z, Y).

thirdcousintwiceremoved(X, Y ) :-
    grandparent(Z, X),
    thirdcousin(Z, Y).






