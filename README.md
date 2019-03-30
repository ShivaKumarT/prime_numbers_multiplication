# Prime Numbers Multiplication Table

Prime numbers multiplication table is an Erlang application. Its purpose is to print the multiplication table for the first N prime numbers. Generated an erlang script file `prime_numbers_multiplication` to run the application from the command line.

### System Requirements
-------------------
+ Operating System: Linux
+ Programming Language: Erlang v19+

### Build & Execution Steps
```shell
    $ git clone https://github.com/ShivaKumarT/prime_numbers_multiplication.git
    $ cd prime_numbers_multiplication
    $ ./rebar3 escriptize
    $ cp _build/default/bin/prime_numbers_multiplication .
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
