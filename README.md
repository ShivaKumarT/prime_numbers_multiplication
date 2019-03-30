# Prime Numbers Multiplication Table

Prime numbers multiplication table is an Erlang application. Its purpose is to print the multiplication table for the first N prime numbers. Generated an erlang script file `prime_numbers_multiplication` to run the application from the command line.

### System Requirements

+ Operating System: Linux
+ Programming Language: Erlang v19+

### Build & Execution Steps
```shell
    $ git clone https://github.com/ShivaKumarT/prime_numbers_multiplication.git
    $ cd prime_numbers_multiplication
    $ ./rebar3 escriptize
    $ cp _build/default/bin/prime_numbers_multiplication .
    $ ./rebar3 eunit --module=prime_numbers_multiplication_tests
    ===> Verifying dependencies...
    ===> Compiling prime_numbers_multiplication
    ===> Performing EUnit tests...
    ...

    Top 3 slowest tests (0.207 seconds, 90.0% of total time):
    prime_numbers_multiplication_tests:first_5_test/0
    0.071 seconds
    prime_numbers_multiplication_tests:firt_1_test/0
    0.068 seconds
    prime_numbers_multiplication_tests:first_2_test/0
    0.068 seconds
    
    Finished in 0.230 seconds
    3 tests, 0 failures

    $ ./prime_numbers_multiplication 5
    2   3   5   7   11  

    3   9   15  21  33  

    5   15  25  35  55  

    7   21  35  49  77  

    11  33  55  77  121 
    
    $./prime_numbers_multiplication 10
    2   3   5   7   11  13  17  19  23  29  

    3   9   15  21  33  39  51  57  69  87  

    5   15  25  35  55  65  85  95  115 145 

    7   21  35  49  77  91  119 133 161 203 

    11  33  55  77  121 143 187 209 253 319 

    13  39  65  91  143 169 221 247 299 377 

    17  51  85  119 187 221 289 323 391 493 

    19  57  95  133 209 247 323 361 437 551 

    23  69  115 161 253 299 391 437 529 667 

    29  87  145 203 319 377 493 551 667 841 
    
    $./prime_numbers_multiplication 11
    2   3   5   7   11  13  17  19  23  29  31  

    3   9   15  21  33  39  51  57  69  87  93  

    5   15  25  35  55  65  85  95  115 145 155 

    7   21  35  49  77  91  119 133 161 203 217 

    11  33  55  77  121 143 187 209 253 319 341 

    13  39  65  91  143 169 221 247 299 377 403 

    17  51  85  119 187 221 289 323 391 493 527 

    19  57  95  133 209 247 323 361 437 551 589 

    23  69  115 161 253 299 391 437 529 667 713 

    29  87  145 203 319 377 493 551 667 841 899 

    31  93  155 217 341 403 527 589 713 899 961 
    
```
### Approach
+ Generated the first N prime numbers
+ Printed first row with N prime numbers as N columns
+ Took the Nth row element from N primes and multiplied it with N primes except the first element\
    Nth row element or {current_row, first_column} * {first_row,current_column}\
    ex: 3 * 5, 3 * 11,3 * 17 etc
+ Printed line break for each row
+ Framed the format string to print the number within the specified width and left aligned on STDOUT. \
    width = number of digits in the square of larget number in N primes.
    
### Complexity
+ Rum time complexity of the current program is O(n2). 
+ We can scale the programe by dividing the N rows into P batches. Each batch contains specific number of rows. P erlang processes executes each batch parrallely. Once completion of execution of each process, combine the output and print it on STDOUT.With this approach, we can bring the run time complexity to O(n2/p) wher p is number of processes.

### N primes
+ Current programe can print the multiplication table for N primes.
    
