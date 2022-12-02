% is this language even real

-module(encrypt).
-export([encrypt/0]).


yep(0,Output) -> Output;
  yep(N,Output) when N > 0 ->
    Result = base64:encode_to_string(Output),
    yep(N-1,Result).

encrypt() ->
  try
    {_,[[Secret,Rounds]]} = init:get_argument(encrypt),
    _Rounds = erlang:list_to_integer(Rounds),
    Result = yep(_Rounds, Secret),
    io:put_chars(["\"encrypted\" ", Result, "\n", "\"decrypted\" ", Secret, "\n"]),
    init:stop()
  catch _:_ ->
    io:fwrite("Usage: $ erl -noshell -s encrypt encrypt -encrypt \"secret\" 3\n"),
    init:stop()
  end.
