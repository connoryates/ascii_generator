Fun little script to generate ASCII art from commandline input.

Usage:

    perl ascii_generator.pl --text '(input)' --font '(input|random|blank)'
  
See ascii_generator.pl for list of fonts. Default is ```epic```

Useful in ```~/.bashrc:```

    alias ascii='perl ~/$PATH/ascii_generator.pl'
    

Sample output:
```$ ascii --text 'Linux' --font 'random'```

```
 _      _                  
| |    (_)                 
| |     _ _ __  _   ___  __
| |    | | '_ \| | | \ \/ /
| |____| | | | | |_| |>  < 
|______|_|_| |_|\__,_/_/\_\
                           
                           
```
