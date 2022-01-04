include("./lexer.jl")
using .Lexer

filename = "test.qr"

file = open(filename, "r")

tokens = tokenize(file)
println("TOKENS:")
println(tokens)

close(file)