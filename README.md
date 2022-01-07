# Foray

WARNING!! THIS LANGUAGE IS JUST A TOY AND IS IN DEVELOPMENT.

I made the foray into learning Julia on the day 2022 started, so I thought it'd be nice to name this way.

```
git clone https://github.com/bichanna/Foray.git
cd Foray/src
```
After that you can run your `.fyy` file.
```
julia Foray.jl test.fyy
```

## Syntax

*Note:* **`stop` is mandatory at the end of `start`**

### Print statement
Just a bit different with 'out'
```
start:
  printout "Hello World from Foray"
  stop
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
something:
  printout "Yay"

start:
  run something
  printout "This will be printed out after"
  stop
```
