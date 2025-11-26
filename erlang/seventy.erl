-module(seventy).
-export([start/0]).

find_70(S) -> find_70([], S).
find_70(L, S) when length(L) + length(S) < 6 -> [];
find_70(L, [H|R]) when length(L) < 6 ->
    case is_more_than_70(sum(L) + H * (6 - length(L))) of
        true -> [];
        false -> find_70(L, R) ++ find_70(L ++ [H], R)
    end;
find_70(L, _) when length(L) == 6 ->
    case sum(L) of
        70 -> [L];
        _ -> []
    end;
find_70(_, []) -> [].

is_more_than_70(S) when S > 70 -> true;
is_more_than_70(_) -> false.

make_list_string(S) -> make_list_string(1, S).
make_list_string(N, [H|R]) -> integer_to_list(N) ++ " :" ++ make_string(H) ++ make_list_string(N + 1, R);
make_list_string(_, []) -> "".

make_string([H|R]) -> " " ++ integer_to_list(H) ++ make_string(R);
make_string([]) -> "~n".

sum(L) -> sum(0, L).
sum(A, [H|R]) -> sum(A + H, R);
sum(A, []) -> A.

start() ->
    io:format(make_list_string(lists:sort(find_70(lists:seq(1, 45))))).
