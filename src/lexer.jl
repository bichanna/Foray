module Lexer

keywords = [
	"print"
]

function tokenize(filename::String)
	println(filename)
	file = open(filename, "r")
	tokens = []
	while !eof(file)
		tmp = []
		tid = ""
		for l in readline(file) # typeof(l) = Char
			if l == '"' && tid == ""
				tid = "char"
				tmp = []
			elseif l == '"' && tid == "char"
				push!(tokens, Dict("id"=>tid, "value"=>join(tmp)))
				tid = ""
				tmp = []
			elseif issubset([join(tmp)], keywords)
				push!(tokens, Dict("id"=>"keyword", "value"=>join(tmp)))
				tmp = []
			elseif l == ' ' && tid != "char"
				continue
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