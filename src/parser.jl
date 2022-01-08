module Parser

AST = []

function add_node(parent::Union{String, Dict{String, String}}, node::Dict{String, String})
	for a in AST
		if typeof(parent) != String
			if issubset([parent], a)
				push!(a[parent], node)
			end
		else
			if haskey(a, parent)
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
		elseif token["id"] == "keyword" || token["id"] == "var"
			if token["value"] == "stop"
				t = Dict(token["value"]=>"")
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
		elseif token["id"] == "string" || token["id"] == "atom"
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