### A Pluto.jl notebook ###
# v0.12.15

using Markdown
using InteractiveUtils

# ╔═╡ 065779c0-3744-11eb-1800-6f166db630af
samp = "BBFFBBFRLL"

# ╔═╡ 61ee64fe-3746-11eb-04f0-335c4fe07725
begin
	arr = collect(samp)
	r = [0,7]
end

# ╔═╡ 05b42d9c-3747-11eb-32e8-2d195bcb8c37
function get_range(range::Array{Int,1}, char::Char)
	mid = round(Int,(range[1] + range[2])/2, RoundDown)
	if char == 'F'|| char == 'L'
		range[2] = mid 
	elseif char == 'B'|| char == 'R'
		range[1] = mid + 1
	end
	return(range)
end

# ╔═╡ 8e134284-374b-11eb-3302-7f123bb536b3
function get_index(array::Array{Char,1}, attr::String)
	if attr == "row"
		range = [0,127]
	elseif attr == "col"
		range = [0,7]
	end
	for i in 1:length(array)
		range = get_range(range, array[i])
	end
	return(range[1])
end

# ╔═╡ 6ac436bc-3746-11eb-2a53-4ba69897dd2f
function seat_id(code::AbstractString)
	code = collect(code)
	r_id = get_index(code[1:7], "row")
	c_id = get_index(code[8:10], "col")
	return(r_id * 8 + c_id)
end

# ╔═╡ fc4edd20-374c-11eb-2a9b-3b2a76ee3c9c
begin
	file = open("input_day5.txt")
	lines = readlines(file)
	ids = seat_id.(lines)
	maximum(ids)
end

# ╔═╡ 7b7582d8-374e-11eb-138a-6113a44c5e2e
function get_seat(ids::AbstractArray)
	sorted = sort(ids)
	for i in 1:length(sorted)
		first = sorted[i]
		second = sorted[i+1]
		if second - first == 2
			return(second - 1)
		end
	end
end 

# ╔═╡ 03656002-374f-11eb-38b8-bb05824bdad1
get_seat(ids)

# ╔═╡ Cell order:
# ╠═065779c0-3744-11eb-1800-6f166db630af
# ╠═61ee64fe-3746-11eb-04f0-335c4fe07725
# ╠═05b42d9c-3747-11eb-32e8-2d195bcb8c37
# ╠═8e134284-374b-11eb-3302-7f123bb536b3
# ╠═6ac436bc-3746-11eb-2a53-4ba69897dd2f
# ╠═fc4edd20-374c-11eb-2a9b-3b2a76ee3c9c
# ╠═7b7582d8-374e-11eb-138a-6113a44c5e2e
# ╠═03656002-374f-11eb-38b8-bb05824bdad1
