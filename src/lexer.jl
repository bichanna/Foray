module Lexer

keywords = [
	"printout",
	"stop",
	"run",
]

function tokenize(filename::String)
	file = open(filename, "r")
	tokens = []
	while !eof(file)
		tmp = []
		tid = ""
		for l in readline(file, keep=true) # typeof(l) = Char
			if l == '"' && tid == ""
				tid = "char"
				tmp = []
			elseif l == '"' && tid == "char"
				push!(tokens, Dict("id"=>"string", "value"=>join(tmp)))
				tid = ""
				tmp = []
			elseif l == ':'
				push!(tokens, Dict("id"=>"label", "value"=>join(tmp)))
				tmp = []
			elseif issubset([join(tmp)], keywords)
				push!(tokens, Dict("id"=>"keyword", "value"=>join(tmp)))
				tmp = []
			elseif l == '\n'
				if length(tmp) > 0
					push!(tokens, Dict("id"=>"atom", "value"=>join(tmp)))
					tmp = []
				end
			elseif (l == ' ' || l == '\t') && tid != "char"
				continue
			elseif l == "\t" && tid != "char"
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