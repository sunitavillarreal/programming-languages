-module(pythagoreanseries).
-export([pythagorean_triples_iterative/1, pythagorean_triples_recursive/1, pythagorean_triples_tail_recursive/1, pythagorean_triples_tail_recursive/4]).

get_triple(M, N) -> {M * M - N * N, 2 * M * N, M * M + N * N}.

pythagorean_triples_iterative(S) -> lists:sublist(lists:flatmap(fun(M) ->
  lists:map(fun(N) -> get_triple(M, N) end, lists:seq(1, M - 1)) end, lists:seq(2, S + 1)), 1, S).

pythagorean_triples_recursive(0) -> [];
pythagorean_triples_recursive(Size) -> pythagorean_triples_recursive(Size, 2, 1).
pythagorean_triples_recursive(Size, M, N) ->
  case {Size == 0, M > N} of
    {true, _} -> [];
    {false, true} -> [get_triple(M, N) | pythagorean_triples_recursive(Size - 1, M, N + 1)];
    {false, false} -> pythagorean_triples_recursive(Size, M + 1, 1)
  end.

pythagorean_triples_tail_recursive(0) -> [];
pythagorean_triples_tail_recursive(Size) -> pythagorean_triples_tail_recursive(Size, 2, 1, []).
pythagorean_triples_tail_recursive(Size, M, N, TripleSeries) ->
  case {Size == length(TripleSeries), M > N} of
    {true, _} -> lists:reverse(TripleSeries);
    {false, true} -> pythagorean_triples_tail_recursive(Size, M, N + 1, [get_triple(M, N) | TripleSeries]);
    {false, false} -> pythagorean_triples_tail_recursive(Size, M + 1, 1, TripleSeries)
  end.
