-module(pythagoreanseries_tests).

-include_lib("eunit/include/eunit.hrl").
-import(pythagoreanseries, [pythagorean_triples_iterative/1, pythagorean_triples_recursive/1, pythagorean_triples_tail_recursive/1]).

pythagorean_triples_iterative_test() ->
  [?assertEqual([], pythagorean_triples_iterative(0)),
    ?assertEqual([{3, 4, 5}], pythagorean_triples_iterative(1)),
    ?assertEqual([{3, 4, 5}, {8, 6, 10}], pythagorean_triples_iterative(2)),
    ?assertEqual([{3, 4, 5}, {8, 6, 10}, {5, 12, 13}], pythagorean_triples_iterative(3)),
    ?assertEqual([{3, 4, 5}, {8, 6, 10}, {5, 12, 13}, {15, 8, 17}], pythagorean_triples_iterative(4))
  ].

pythagorean_triples_recursive_test() ->
  [?assertEqual([], pythagorean_triples_recursive(0)),
    ?assertEqual([{3, 4, 5}], pythagorean_triples_recursive(1)),
    ?assertEqual([{3, 4, 5}, {8, 6, 10}], pythagorean_triples_recursive(2)),
    ?assertEqual([{3, 4, 5}, {8, 6, 10}, {5, 12, 13}], pythagorean_triples_recursive(3)),
    ?assertEqual([{3, 4, 5}, {8, 6, 10}, {5, 12, 13}, {15, 8, 17}], pythagorean_triples_recursive(4))
  ].

pythagorean_triples_tail_recursive_test() ->
  [?assertEqual([], pythagorean_triples_tail_recursive(0)),
    ?assertEqual([{3, 4, 5}], pythagorean_triples_tail_recursive(1)),
    ?assertEqual([{3, 4, 5}, {8, 6, 10}], pythagorean_triples_tail_recursive(2)),
    ?assertEqual([{3, 4, 5}, {8, 6, 10}, {5, 12, 13}], pythagorean_triples_tail_recursive(3)),
    ?assertEqual([{3, 4, 5}, {8, 6, 10}, {5, 12, 13}, {15, 8, 17}], pythagorean_triples_tail_recursive(4))
  ].
