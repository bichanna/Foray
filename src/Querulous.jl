include("./lexer.jl")
using .Lexer

include("./parser.jl")
using .Parser

filename = "test.qr"

tokens = tokenize(filename)
println("TOKENS:")
println(tokens)

AST = build_AST(tokens)
println("AST:")
println(AST)