include("./lexer.jl")
using .Lexer

filename = "test.qr"

tokens = tokenize(filename)
println("TOKENS:")
println(tokens)
