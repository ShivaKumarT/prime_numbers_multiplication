-module(prime_numbers_multiplication_tests).
-include_lib("eunit/include/eunit.hrl").

firt_1_test() ->
  ?assertCmdStatus(0, "./prime_numbers_multiplication 5").

first_2_test() ->
  ?assertCmdOutput("2 3 \n\n3 9 \n", "./prime_numbers_multiplication 2").

first_5_test() ->
  ?assertCmdOutput("2   3   5   7   11  \n\n3   9   15  21  33  \n\n5   15  25"++
"  35  55  \n\n7   21  35  49  77  \n\n11  33  55  77  121 \n", "./prime_numbers_multiplication 5").

