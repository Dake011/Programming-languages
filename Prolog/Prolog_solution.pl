%task1
cartesian([],Q,[]).
cartesian(P,[],[]).                                 %both are initial recursion conditions.
cartesian(L1, L2, Z):-findall(pair(A,B), (member(A, L1), member(B, L2)), Z). %the special predicate findall is used to collect all items from list.

%task2
deepmember(P,[P|_]).                               %recursion condition
deepmember(P,[Q|_]):-deepmember(P,Q).              %checks by each element in the list
deepmember(P,[_|Z]):-deepmember(P,Z).              %there is no P

%task3
notcontains(_,[]):-!.                              %if the condition is true then end.
notcontains(P,[Q|Z]):-P\=Q, notcontains(P,Z).      %checks if the P with the elements in a list.

%task4a
addunique([],List,List).                                %no element.
addunique(P,List,[P|List]) :- notcontains(P,List).      %checks if P is not in the List, if not adds and store in the next list.

%task4b
setinsertion(P,List,List):-deepmember(P,List), !.     %if two lists are consist P and already equal.
setinsertion(P,List,[P|List]).                        %if S2-S1 equals to P.

%task5
graph1([[1,2],[1,3],[2,3],[3,4],[4,1]]).
graph2([[1,2],[2,3],[2,4],[3,4],[4,3],[3,1],[4,1 ]]).
graph3([[1,2],[1,3],[2,3],[3,2],[3,4],[2,4],[4,6],[4,5],[5,6],[6,5],[6,7],[5,7],[7,1]]).

%task5a
allvertices([],[]).
allvertices([[X|[Y|_]]|P],G):-allvertices(P,Q), setinsertion(X,Q,Z), setinsertion(Y,Z,G).   %go through in list and ckeck all the element until no elements.

%task5b
connected(X,Y,[[X|[Y|_]]|_]).               %initial condition for recursion when X and Y in the list.
connected(X,Y,[_|P]):-connected(X,Y,P).     %go through the list and check all the element.

%task5c
path(G,Begin,1,Forbid,[Begin],Begin).    %initial condition when path is 1
path(G,Begin,N,Forbid,[Begin|Path], End):-connected(Begin,Y,G), notcontains(Y,Forbid), N1 is N-1, path(G,Y,N1,[Y|Forbid],Path, End).  %path decrease each time by 1, checks the edges to get the value.

%task5d
hamiltoniancircuit( G, C ) :-
allvertices( G, Vert ),
Vert = [ V0 | _ ],
length( Vert, N ),
path( G, V0, N, [ V0 ], C, LastV ),
connected( LastV, V0, G ).
