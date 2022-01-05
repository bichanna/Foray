module Parser

AST = []

function add_node(parent::Union{String, Dict{String, String}}, node::Dict{String, String})
	if typeof(parent) == typeof(String)
		for a in AST
			if issubset(parent, a)
				push!(a[parent], node)
			end
		end
	end
end

function build_AST(tokens::Vector{Any})
	saved = Dict()
	parent = Dict()
	collect = false

	for token in tokens
		if token["id"] == "label"
			t = Dict(token["value"]=>[])
			if parent != t
				parent = token["value"]
				push!(AST, t)
			end
		elseif token["id"] == "keyword"
			if token["value"] == "end"
				t = Dict(token["value"]=>0)
				add_node(parent, t)
			else
				if collect == false
					saved = token
					collect = true
				else
					t = Dict(saved["value"]=>token["value"])
					add_node(parent, t)
					collect = false
				end
			end
		elseif token["id"] == "char"
			if collect == false
				saved = token
				collect = true
			else
				t = Dict(saved["value"]=>token["value"])
				add_node(parent, t)
				collect = false
			end
		end
	end
	return AST
end

export build_AST
end # module