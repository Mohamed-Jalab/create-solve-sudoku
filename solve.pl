append([],L2,L2).
append([H|T],L2,[H|L3]):-append(T,L2,L3).

% R is [H|T]
removeElement(V,L,[H|T] ,F):-H =\= V, append(L,[H],NL), removeElement(V,NL,T,F).
removeElement(_,L,[_|T],F):- append(L,T,F).

fillProb(X,Y,10,L):- assert(cell(X,Y,L,0)).
fillProb(X,Y,N,L) :- append(L,[N],R), NN is N+1, fillProb(X,Y,NN,R).

fillPuzzleProb(_,10):-!.
fillPuzzleProb(X,Y):- cell(X,Y,_,1),NX is X+1, fillPuzzleProb(NX,Y).
fillPuzzleProb(X,Y):- X<10, fillProb(X,Y,1,[]),NX is X+1, fillPuzzleProb(NX,Y).
fillPuzzleProb(_,Y):- NY is Y+1, fillPuzzleProb(1,NY).

validateRow(_,_,_,10).
% validateRow(X,Y,V,I):-cell(I,Y,[V],_),X=\=I.
validateRow(X,Y,[H|_],I):- cell(I,Y,[H],_), X=\=I.
validateRow(X,Y,V,I):- NI is I+1, validateRow(X,Y,V,NI).