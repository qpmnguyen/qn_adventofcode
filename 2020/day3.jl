### A Pluto.jl notebook ###
# v0.12.15

using Markdown
using InteractiveUtils

# ╔═╡ a1fabdb0-358c-11eb-1150-a5498461a643
samp = "..##.........##.........##.........##.........##.........##.......
#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..
.#....#..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.
..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#
.#...##..#..#...##..#..#...##..#..#...##..#..#...##..#..#...##..#.
..#.##.......#.##.......#.##.......#.##.......#.##.......#.##.....
.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#
.#........#.#........#.#........#.#........#.#........#.#........#
#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...
#...##....##...##....##...##....##...##....##...##....##...##....#
.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#"

# ╔═╡ c1dd3fb2-358f-11eb-21a3-79ca0ed07571
function step(ind::Tuple{Int64, Int64}, ncol::Int64, inc_right::Int64,
		inc_down::Int64)
	nr = ind[1] + inc_down
	nc = ind[2] + inc_right
	if nc > ncol
		remainder = nc - ncol 
		nc = remainder 
	end
	return((nr, nc))
end

# ╔═╡ df490410-358c-11eb-1d29-c701e9652001
function calculate_trees(input::Any, inc_right::Int64, inc_down::Int64)
	if typeof(input) <: AbstractString
		input = split(input, "\n")
	end
	arr = reduce(vcat, permutedims.(collect.(input)))
	ncol = size(arr,2)
	nrow = size(arr,1)
	idx = (1,1)
	tree = Bool[]
	while idx[1] <= nrow
		if arr[idx...] == '.'
			push!(tree, false)
		else
			push!(tree, true)
		end
		idx = step(idx, ncol, inc_right, inc_down)
	end
	return(sum(tree))
end

# ╔═╡ 206d0a92-358d-11eb-17df-a5458e4d127d
calculate_trees(samp, 3, 1)

# ╔═╡ 2f0a2990-3590-11eb-2221-176b0cf8ff7c
begin
	input = open("input_day3.txt")
	lines = readlines(input)
end

# ╔═╡ 5551286e-3596-11eb-1af6-21eedab562ed
reduce(vcat,permutedims.(collect.(lines)))

# ╔═╡ ce04f118-3597-11eb-19a6-2f53d7aba9c9
calculate_trees(lines,3, 1)

# ╔═╡ e38f734e-3599-11eb-0e59-dd1e05d642f7
begin
	paths = [(1,1), (3,1), (5,1), (7,1), (1,2)]
	store = Int64[]
	for i in paths
		ntrees = calculate_trees(samp, i[1], i[2])
		push!(store, ntrees)
	end
	prod(store)
end

# ╔═╡ 3f9a977c-359a-11eb-3937-6b4525ed9e1f
begin
	store_new = Int64[]
	for i in paths
		ntrees = calculate_trees(lines, i[1], i[2])
		push!(store_new, ntrees)
	end
	prod(store_new)
end

# ╔═╡ Cell order:
# ╠═a1fabdb0-358c-11eb-1150-a5498461a643
# ╠═df490410-358c-11eb-1d29-c701e9652001
# ╠═c1dd3fb2-358f-11eb-21a3-79ca0ed07571
# ╠═206d0a92-358d-11eb-17df-a5458e4d127d
# ╠═2f0a2990-3590-11eb-2221-176b0cf8ff7c
# ╠═5551286e-3596-11eb-1af6-21eedab562ed
# ╠═ce04f118-3597-11eb-19a6-2f53d7aba9c9
# ╠═e38f734e-3599-11eb-0e59-dd1e05d642f7
# ╠═3f9a977c-359a-11eb-3937-6b4525ed9e1f
