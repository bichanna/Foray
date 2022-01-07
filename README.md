# Querulous

WARNING!! THIS LANGUAGE IS JUST A TOY AND IS IN DEVELOPMENT.

It used to be 'Effulgent', but I thought 'Querulous' is a lot better because this is gonna be buggy.

```
git clone https://github.com/bichanna/Querulous.git
cd Querulous/src
```
After that you can run your `.qr` file.
```
julia Querulous.jl test.qr
```

## Syntax

### Print statement
Just a bit different with 'out'
```
start:
  printout "Hello World from Querulous"
```

### Comment
Yay! Just like Python.
```
# printout "This won't be printed out"
```

### Exit the program
Easy poosy.
```
start:
  printout "Weee!"
  stop
  printout "This does not show up."
```

### Function(?)
🤔 Python without def
```
start:
  run something
  printout "This will be printed out after"
something:
  printout "Yay"
```
