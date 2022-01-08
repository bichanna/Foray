<div align="center">
    <img width="115px" src="https://user-images.githubusercontent.com/60306074/148629691-9a17fed9-e188-4116-a950-3f0687d9d9a0.png">
    <h1>The Foray Programming Language</h1>
</div>

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

### Print statement
Just a bit different with 'out'
```
start:
  printout "Hello World from Foray"
```

### Comment
Yay! Just like Python.
```
# printout "This won't be printed out"
```

### Function(?)
🤔 Python without def
```
something:
  printout "Yay"

start:
  run something
  printout "This will be printed out after"
```

### Exit the program
Easy poosy.
```
start:
  printout "Weee!"
  stop
  printout "This does not show up."
```
