include("./lexer.jl")
using .Lexer

include("./parser.jl")
using .Parser

include("./evaluator.jl")
using .Evaluator

function printout_error(text::String)
	printstyled("Foray: $text\n"; color=:red)
end

function show_usage()
	println("Usage:")
	println("	julia Foray.jl <filename>.fyy")
end

if length(ARGS) < 1
	show_usage()
	exit()
else
	global filename = ARGS[1]
end

try
	global extension = filename[end-3] * filename[end-2] * filename[end-1] * filename[end]
catch
	printout_error("Foray: Specify a file with .fyy extension")
	show_usage()
	exit()
end

if extension != ".fyy"
	printout_error("Specify a file with .fyy extension")
	show_usage()
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