include("./lexer.jl")
using .Lexer

filename = "test.ef"

file = open(filename, "r")

tokens = tokenize(file)
println("TOKENS:")
println(tokens)

close(file)