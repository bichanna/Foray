include("./lexer.jl")
using .Lexer

include("./parser.jl")
using .Parser

include("./evaluator.jl")
using .Evaluator


try
	global filename = ARGS[1]
catch
	printstyled("Foray: Specify a file\n"; color=:red)
	exit()
end

extension = filename[end-2] * filename[end-1] * filename[end]
if extension != ".fyy"
	printstyled("Foray: Specify a file with .fyy extension\n"; color=:red)
	exit()
end

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

println("OUTPUTS:")
evaluate(AST, true)