include("./lexer.jl")
using .Lexer

include("./parser.jl")
using .Parser

include("./evaluator.jl")
using .Evaluator

function printout_error(text::String)
	printstyled("Foray: $text\n"; color=:red)
end

try
	global filename = ARGS[1]
catch
	printout_error("Specify a file")
	exit()
end

try
	global extension = filename[end-3] * filename[end-2] * filename[end-1] * filename[end]
catch
	printout_error("Foray: Specify a file with .fyy extension")
	exit()
end

if extension != ".fyy"
	printout_error("Specify a file with .fyy extension")
	exit()
end

tokens = tokenize(filename)
# println("TOKENS:")
# for t in tokens
# 	println("""	  $(t["id"]): $(t["value"])""")
# end

AST = build_AST(tokens)
# println("AST:")
# for a in AST
# 	println("	$a")
# end

# println("OUTPUTS:")
evaluate(AST, true)