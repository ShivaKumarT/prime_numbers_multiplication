%%%-------------------------------------------------------------------
%%% @author shiva
%%% @copyright (C) 2019, shiva
%%% @doc module to print multiplication table of first N prime numbers.
%%% The first row and column of the table have first N prime numbers
%%% and remaining cells in the table contain the prodcut of the primes
%%% for the correspoding row and column of the cell. The value in the cell
%%% will be left aligned.
%%% @end
%%% Created : 2019-03-28 23:53:23.623017
%%%-------------------------------------------------------------------
-module(prime_numbers_multiplication).

%% API
-export([main/1]).


%%%===================================================================
%%% API
%%%===================================================================

%% @doc main entry point to the primary numbers multiplication
%% It takes N number from command line and converts it to integer.
%% And It generates first N prime numbers list. It finds the largest
%% number in the prime numbers list and counts number of digits in
%% in the largest product value of two prime numbers.Based on number of
%% digits , it frames the format string to be used while printing
%% the muliplication result of two prime numbers on STDOUT.
%%  @end

-spec main([String]) -> Res when
    String  :: string(),
    Res     :: ok.
main([N]) ->
  PrimeNumbersList = lists:sort(prime_numbers(list_to_integer(N))),
  [LargeNumber|_] = lists:reverse(PrimeNumbersList),
  NumberOfDigits = integer_to_list(number_of_digits(LargeNumber * LargeNumber)),
  Format = print_format(NumberOfDigits),
  print_columns(Format, 1, PrimeNumbersList),
  [_First|RestRows] = PrimeNumbersList,
  print_rows(PrimeNumbersList,  Format,  RestRows).

%% @doc Generates first N prime numbers.
-spec prime_numbers(N) -> Res when
    N :: integer(),
    Res    :: [integer()].
prime_numbers(N) ->
  prime_numbers(N,  2,  [],  0).


%%%===================================================================
%%% Internal functions
%%%===================================================================

%% @doc Takes prime number from the cell corresponding to the current row and
%% the first column, calls print_columns function to print product of
%% prime numbers in that row
%% @end
-spec print_rows(Original, Format, Rows) -> Res when
    Original :: [integer()],
    Format   :: string(),
    Rows     :: [integer()],
    Res      :: ok.
print_rows(_Original,  _Format,  []) ->
  io:format("\n");
print_rows(Original,  Format,  [Row|RestRows]) ->
  io:format("~n~n"),
  io:fwrite(Format,  [io_lib:write(Row)]),
  [_|Columns] = Original,
  print_columns(Format,  Row,  Columns),
  print_rows(Original,  Format,  RestRows).

%% @doc Calculates the product of prime number in the cells [current row, first column]
%% and [first row, current column]. Prints the result on STDOUT.
%%
%% Note: Row = value of cell [current row, first column]
%%       H = value of cell [first row, current column]
%% @end
-spec print_columns(Format, Row, Columns) -> Res when
    Format :: string(),
    Row    :: integer(),
    Columns:: [integer()],
    Res    :: ok.
print_columns(_Format,  _Row,  []) ->
  ok;
print_columns(Format,  Row,  [H|Rest]) ->
  io:fwrite(Format,  [io_lib:write(Row*H)]),
  print_columns(Format,  Row,  Rest).

%% @doc Calculates numbers of digits in the given number
-spec number_of_digits(N) -> Res when
    N   :: integer(),
    Res :: integer().
number_of_digits(N) ->
  number_of_digits(N div 10,  1).

-spec number_of_digits(N, NumberOfDigits) -> Res when
    NumberOfDigits :: integer(),
    N              :: integer(),
    Res            :: integer().
number_of_digits(0,  NumberOfDigits) -> NumberOfDigits;
number_of_digits(N,  NumberOfDigits) -> number_of_digits(N div 10,  NumberOfDigits + 1).

%% @doc Frames printing format string
-spec print_format(NumberOfDigits) -> Res when
    NumberOfDigits :: integer(),
    Res            :: integer().
print_format(NumberOfDigits) ->
  "~-"++NumberOfDigits++"s ".

%%% @doc Generates first N prime numbers
-spec prime_numbers(N, Number, PrimeNumbersList, Count) -> Res when
    PrimeNumbersList :: [integer()],
    N                :: integer(),
    Number           :: integer(),
    Count            :: integer(),
    Res              :: [integer()].
prime_numbers(N,  _Number,  PrimeNumbersList,  N) ->
  PrimeNumbersList;
prime_numbers(N,  Number,  PrimeNumbersList,  Count) ->
  case is_prime(Number) of
    true ->
      prime_numbers(N,  Number+1,  [Number|PrimeNumbersList],  Count+1);
    false ->
      prime_numbers(N,  Number + 1,  PrimeNumbersList,  Count)
  end.

%% @doc Checkes whether given number is prime or not.
-spec is_prime(N) -> Res when
    N  :: integer(),
    Res:: boolean().
is_prime(N) ->
  is_prime(N,  N,  0).

%% @doc Whenevenr number of divisors to the given number is
%% more then 2 then that number is not prime.
-spec is_prime(N, C, Count) -> Res when
    N    :: integer(),
    C    :: integer(),
    Count:: integer(),
    Res  :: boolean().
is_prime(_,  _,  Count) when Count > 2 -> false;
is_prime(_,  0,  Count) when Count =< 2 -> true;
is_prime(N,  C,  Count) when N rem C =:= 0 -> is_prime(N,  C-1,  Count+1);
is_prime(N,  C,  Count) -> is_prime(N,  C-1,  Count).

