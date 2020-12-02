### A Pluto.jl notebook ###
# v0.12.15

using Markdown
using InteractiveUtils

# ╔═╡ 9c955030-34b8-11eb-14f9-8fc18fff0ba8
function validate_pass(samp::AbstractArray)
	store = []
	for i in 1:length(samp)
		splits = strip.(split(samp[i], ":"))
		rule = split(splits[1]," ")
		passwrd = strip(splits[2])
		letter = first(rule[2])
		r = parse.(Int, split(rule[1], "-"))
		counts = sum([1 for i in passwrd if i == letter])
		if r[1] <= counts <= r[2]
			eval = true
		else 
			eval = false
		end
		println(eval)
		push!(store, eval)
	end
	return(sum(store))
end

# ╔═╡ 469c13c0-34b9-11eb-2bb1-45fa39d2276e
samp = ["1-3 a: abcde",
"1-3 b: cdefg",
"2-9 c: ccccccccc"]

# ╔═╡ 5ddfe340-34b9-11eb-2366-3d6fe2d4dfdc
validate_pass(samp)

# ╔═╡ dd62788e-34c2-11eb-364c-6fb5b4f08032
begin
	input = open("input_day2.txt")
	lines = readlines(input)
	validate_pass(lines)
end

# ╔═╡ 956b33f0-34c3-11eb-3c09-a3f62a9667c1
function validate_pass_deux(samp::AbstractArray)
	store = []
	for i in 1:length(samp)
		splits = strip.(split(samp[i], ":"))
		rule = split(splits[1]," ")
		# get the password 
		passwrd = strip(splits[2])
		# get the letter 
		letter = first(rule[2])
		# get the first and second items in the rules 
		r = parse.(Int, split(rule[1], "-"))
		counts = (passwrd[r[1]] == letter) + (passwrd[r[2]] == letter)
		if counts == 1
			eval = true
		else 
			eval = false
		end
		println(eval)
		push!(store, eval)
	end
	return(sum(store))
end

# ╔═╡ 9127fa10-34c5-11eb-01ed-3f4db3c02164
validate_pass_deux(samp)

# ╔═╡ 1f952bc0-34ca-11eb-35a6-0533655d1d83
validate_pass_deux(lines)

# ╔═╡ Cell order:
# ╠═9c955030-34b8-11eb-14f9-8fc18fff0ba8
# ╠═469c13c0-34b9-11eb-2bb1-45fa39d2276e
# ╠═5ddfe340-34b9-11eb-2366-3d6fe2d4dfdc
# ╠═dd62788e-34c2-11eb-364c-6fb5b4f08032
# ╠═956b33f0-34c3-11eb-3c09-a3f62a9667c1
# ╠═9127fa10-34c5-11eb-01ed-3f4db3c02164
# ╠═1f952bc0-34ca-11eb-35a6-0533655d1d83
