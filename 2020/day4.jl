### A Pluto.jl notebook ###
# v0.12.15

using Markdown
using InteractiveUtils

# ╔═╡ b07a64dc-3657-11eb-17a4-2750640a1a8d
using Printf

# ╔═╡ 95b3ded8-3645-11eb-160d-1570c022db82
samp = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
byr:1937 iyr:2017 cid:147 hgt:183cm

iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
hcl:#cfa07d byr:1929

hcl:#ae17e1 iyr:2013
eyr:2024
ecl:brn pid:760753108 byr:1931
hgt:179cm

hcl:#cfa07d eyr:2025 pid:166559648
iyr:2011 ecl:brn hgt:59in"

# ╔═╡ ec79ff10-3646-11eb-1e61-cfb371793cf5
function validate_passport(passports::AbstractArray)
	valid = Bool[]
	categories_needed = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
	for i in 1:length(passports)
		# first split by either newline or space
		processed = split(passports[i], r"[\n\s]") 
		# store key-value pairs in a dictionary 
		categories = [split(i, ":")[1] for i in processed]
		missing = [i for i ∈ categories_needed if i ∉ categories]
		if length(missing) >= 1
			push!(valid, false)
		else
			push!(valid, true)
		end
	end
	return(sum(valid))
end		

# ╔═╡ db33a4a2-364a-11eb-0bdd-c3ab94a19187
begin
	lines = open("input_day4.txt")
	data = read(lines, String)
	data = split(data, "\n\n")
end

# ╔═╡ 8f4589ba-364b-11eb-3232-6172cf40cbda
validate_passport(data)

# ╔═╡ 1e821a0c-3661-11eb-1763-fb8a94702292
function fail_rules(field::AbstractString, value::AbstractString)
	# first, for relevant fields, check if it's a number 
	if field ∈ ["byr", "iyr", "eyr", "pid"]
		entry = try
			parse(Int, value)
		catch
			return(true)
		end
	end
	# return true for whatever cid
	if field == "cid"
		return(false)
	end
	# first check for those requiring numbers since entry is defined first 
	if field == "byr"
		if 1920 <= entry <= 2002
			return(false)
		else
			return(true)
		end
	end
	if field == "iyr"
		if 2010 <= entry <= 2020
			return(false)
		else
			return(true)
		end
	end
	if field == "eyr"
		if 2020 <= entry <= 2030
			return(false)
		else
			return(true)
		end
	end
	if field == "pid"
		if length(value) == 9
			return(false)
		else
			return(true)
		end
	end
	# check height
	if field == "hgt"
		units = last(value,2)
		# first check units 
		if units ∉ ["cm", "in"]
			return(true)
		else # if units are good parse for entry
			entry = parse(Int, split(value, units)[1])
			# if centimeter
			if units == "cm"
				if 150 <= entry <= 193
					return(false)
				else
					return(true)
				end
			# if inches
			else 
				if 59 <= entry <= 76
					return(false)
				else
					return(true)
				end
			end
		end
	end
	# check for eye color
	if field == "ecl"
		if value ∈ ["amb","blu","brn","gry","grn","hzl","oth"]
			return(false)
		else
			return(true)
		end
	end
	# check for hair color
	if field == "hcl"
		if occursin(r"^#[a-f0-9]+$", value)
			if length(split(value,"#")[2]) == 6
				return(false)
			else
				return(true)
			end
		else
			return(true)
		end
	end
		
end

# ╔═╡ 4dd94b24-3646-11eb-00f3-37278564f9e1
begin
	passports = split(samp, "\n\n")
	categories_needed = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
	proc = split(passports[3], r"[\n\s]")
	dict = Dict(split(i,":")[1] => split(i, ":")[2] for i in proc)
	[i for i ∈ categories_needed if haskey(dict, i) == false]
	sum([fail_rules(key, value) for (key,value) in dict]) == length(dict)
end

# ╔═╡ 1df09afc-3648-11eb-0a5f-d5fa1e079a68
validate_passport(passports)

# ╔═╡ 82763af8-364c-11eb-0fff-e5d09a6e307a
function validate_passport_deux(passports::AbstractArray)
	valid = Bool[]
	categories_needed = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
	for i in 1:length(passports)
		# first split by either newline or space
		text = strip(passports[i])
		processed = split(text, r"[\n\s]") 
		# store key-value pairs in a dictionary 
		categories = Dict(split(j,":")[1] => split(j, ":")[2] for j in processed)
		# check for missing
		missing = [k for k ∈ categories_needed if haskey(categories,k) == false]
		if length(missing) >= 1
			push!(valid, false)
		else
			n_fail = sum([fail_rules(key, value) for (key,value) in categories])
			if n_fail >= 1
				push!(valid, false)
			else
				println("$categories passed")
				push!(valid, true)
			end
		end
	end
	return(sum(valid))
end

# ╔═╡ c04f180a-365f-11eb-0665-39db3055fa65
begin
	invalids = "eyr:1972 cid:100
hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926

iyr:2019
hcl:#602927 eyr:1967 hgt:170cm
ecl:grn pid:012533040 byr:1946

hcl:dab227 iyr:2012
ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277

hgt:59cm ecl:zzz
eyr:2038 hcl:74454a iyr:2023
pid:3556412378 byr:2007"
	invalids = split(invalids, "\n\n")
	validate_passport_deux(invalids)
end

# ╔═╡ f39f1be2-365f-11eb-3eb3-2701cd46a2d1
begin
	valids = "pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
hcl:#623a2f

eyr:2029 ecl:blu cid:129 byr:1989
iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm

hcl:#888785
hgt:164cm byr:2001 iyr:2015 cid:88
pid:545766238 ecl:hzl
eyr:2022

iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719"
	valids = split(valids, "\n\n")
	validate_passport_deux(valids)
end

# ╔═╡ 61905b70-3660-11eb-2008-dbb5fd90a805
begin
	println("Let's start")
	validate_passport_deux(data)
end

# ╔═╡ Cell order:
# ╠═b07a64dc-3657-11eb-17a4-2750640a1a8d
# ╠═95b3ded8-3645-11eb-160d-1570c022db82
# ╠═4dd94b24-3646-11eb-00f3-37278564f9e1
# ╠═ec79ff10-3646-11eb-1e61-cfb371793cf5
# ╠═1df09afc-3648-11eb-0a5f-d5fa1e079a68
# ╠═db33a4a2-364a-11eb-0bdd-c3ab94a19187
# ╠═8f4589ba-364b-11eb-3232-6172cf40cbda
# ╠═1e821a0c-3661-11eb-1763-fb8a94702292
# ╠═82763af8-364c-11eb-0fff-e5d09a6e307a
# ╠═c04f180a-365f-11eb-0665-39db3055fa65
# ╠═f39f1be2-365f-11eb-3eb3-2701cd46a2d1
# ╠═61905b70-3660-11eb-2008-dbb5fd90a805
