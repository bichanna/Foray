include("./lexer.jl")
using .Lexer

include("./parser.jl")
using .Parser

include("./evaluator.jl")
using .Evaluator

filename = "test.qr"

tokens = tokenize(filename)
# println("TOKENS:")
# println(tokens)

AST = build_AST(tokens)
# println("AST:")
# for a in AST
# 	println(a)
# end

println("OUTPUTS:")
evaluate(AST)