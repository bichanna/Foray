module Lexer

keywords = [
	"print"
]

function tokenize(file::IOStream)
	tokens = []
	while !eof(file)
		tmp = []
		tid = ""
		
		for l in readline
			if l == "\"" && isempty(tmp)
				tid = "char"
				tmp = []
			elseif l == "\"" && tid == "char"
				push!(tokens, {"id"=>tid, "value"=>join(tmp)})
				tid = ""
				tmp = []
			elseif occursin()

			elseif l == " " && tid != "char"
				continue
			else
				push!(tmp, l)
			end
		end
	end
	return tokens
end

export tokenize
end # module