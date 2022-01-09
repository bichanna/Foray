module Lexer

keywords = [
	"printout",
	"stop",
	"run",
]

vars = Dict()

function tokenize(filename::String)
	file = open(filename, "r")
	tokens = []
	while !eof(file)
		tmp = []
		tid = ""
		isvar = false
		varkey = ""
		for l in readline(file, keep=true) # typeof(l) = Char
			if l == '"' && tid == ""
				tid = "char"
				tmp = []
			elseif l == '"' && tid == "char"
				push!(tokens, Dict("id"=>"string", "value"=>join(tmp)))
				if isvar == true
					vars[varkey] = join(tmp)
				end
				tid = ""
				tmp = []
			elseif haskey(vars, join(tmp))
				push!(tokens, Dict("id"=>"string", "value"=>vars[join(tmp)]))
			elseif l == ':'
				push!(tokens, Dict("id"=>"label", "value"=>join(tmp)))
				tmp = []
			elseif issubset([join(tmp)], keywords)
				push!(tokens, Dict("id"=>"keyword", "value"=>join(tmp)))
				tmp = []
			elseif l == '='
				push!(tokens, Dict("id"=>"var", "value"=>join(tmp)))
				push!(tokens, Dict("id"=>"alloc", "value"=>"eq"))
				vars[join(tmp)] = ""
				isvar = true
				varkey = join(tmp)
				tmp = []
			elseif l == '\n'
				if length(tmp) > 0
					push!(tokens, Dict("id"=>"atom", "value"=>join(tmp)))
					tmp = []
				end
			elseif (l == ' ' || l == '\t') && tid != "char"
				continue
			elseif l == '#' && tid != "char"
				break
			else
				push!(tmp, l)
			end
		end
	end

	close(file)# close file

	return tokens
end

export tokenize
end # module