-module(my_tree).
-export([empty/0, insert/3, lookup/2, list_keys/1]).

empty() -> {node, 'nil'}.

insert(NewKey, NewVal, {node, 'nil'}) ->
    {node, {NewKey, NewVal, {node, 'nil'}, {node, 'nil'}}};
insert(NewKey, NewVal, {node, {Key, Val, Smaller, Larger}}) when NewKey < Key ->
    {node, {Key, Val, insert(NewKey, NewVal, Smaller), Larger}};
insert(NewKey, NewVal, {node, {Key, Val, Smaller, Larger}}) when NewKey > Key ->
    {node, {Key, Val, Smaller, insert(NewKey, NewVal, Larger)}};
insert(Key, NewVal, {node, {Key, _, Smaller, Larger}}) ->
    {node, {Key, NewVal, Smaller, Larger}}.

lookup(_, {node, 'nil'}) ->
    undefined;
lookup(Query, {node, {Key, _, Smaller, _}}) when Query < Key ->
    lookup(Query, Smaller);
lookup(Query, {node, {Key, _, _, Larger}}) when Query > Key ->
    lookup(Query, Larger);
lookup(_, {node, {_, Val, _, _}}) ->
    Val.

list_keys({node, 'nil'}) ->
    [];
list_keys({node, {Key, _, {node, 
            'nil'}, {node, 'nil'}}}) ->
    [Key];
list_keys({node, {Key, _, Left, {node, 'nil'}}}) ->
    [Key|list_keys(Left)];
list_keys({node, {Key, _, {node, 'nil'}, Right}}) ->
    [Key|list_keys(Right)];
list_keys({node, {Key, _, Left, Right}}) ->
    [Key|list_keys(Left)] ++ list_keys(Right).

