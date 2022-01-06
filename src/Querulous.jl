include("./lexer.jl")
using .Lexer

include("./parser.jl")
using .Parser

include("./evaluator.jl")
using .Evaluator

filename = ARGS[1]

tokens = tokenize(filename)
# println("TOKENS:")
# for t in tokens
# 	println("""	  $(t["id"]): $(t["value"])""")
# end

AST = build_AST(tokens)
# println("AST:")
# println(AST)
# for a in AST
# 	println(a)
# end

println("\nOUTPUTS:")
evaluate(AST)