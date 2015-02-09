-module(my_sets).
-export([insert/2]).

insert(X,[]) ->
    [X];
insert(X,Set) ->
    case lists:member(X,Set) of
        true -> Set;
        false -> [X|Set]
    end.
