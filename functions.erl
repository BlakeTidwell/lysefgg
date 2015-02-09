-module(functions).
-compile(export_all).

%% Return the head element of a list.
head([H|_]) -> H.

%% Return the second element in a list I DONT KNOW Y
second([_, X|_]) -> X.

%% Return the tail elements of a list.
tail([_|T]) -> T.

%% Pretendo equality function
same(X,X) ->
    true;
same(_,_) ->
    false.
