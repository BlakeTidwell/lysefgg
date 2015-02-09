-module(my_tree).
-export([empty/0, insert/3, lookup/2]).

empty() -> {node, 'nil'}.

insert(NewKey, NewVal, {node, 'nil'}) ->
    {node, {NewKey, NewVal, {node, 'nil'}, {node, 'nil'}}};
insert(NewKey, NewVal, {node, {Key, Val, Smaller, Larger}}) when NewKey < Key ->
    {node, {Key, Val, insert(NewKey, NewVal, Smaller), Larger}};
insert(NewKey, NewVal, {node, {Key, Val, Smaller, Larger}}) when NewKey > Key ->
    {node, {Key, Val, Smaller, insert(NewKey, NewVal, Larger)}};
insert(Key, NewVal, {node, {Key, _, Smaller, Larger}}) ->
    {node, {Key, NewVal, Smaller, Larger}}.

lookup(a, b) -> ok.
