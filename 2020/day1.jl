### A Pluto.jl notebook ###
# v0.12.11

using Markdown
using InteractiveUtils

# ╔═╡ aef9f930-33e4-11eb-0368-85b038554728
md"
# Day 1  
After saving Christmas five years in a row, you've decided to take a vacation at a nice resort on a tropical island. Surely, Christmas will go on without you.

The tropical island has its own currency and is entirely cash-only. The gold coins used there have a little picture of a starfish; the locals just call them stars. None of the currency exchanges seem to have heard of them, but somehow, you'll need to find fifty of these coins by the time you arrive so you can pay the deposit on your room.

To save your vacation, you need to get all fifty stars by December 25th.

Collect stars by solving puzzles. Two puzzles will be made available on each day in the Advent calendar; the second puzzle is unlocked when you complete the first. Each puzzle grants one star. Good luck!

Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.

Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.

For example, suppose your expense report contained the following:

1721
979
366
299
675
1456

In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.

Of course, your expense report is much larger. Find the two entries that sum to 2020; what do you get if you multiply them together?
"

# ╔═╡ db2c5d90-33e4-11eb-178d-f10508db3c84
list = [1721, 979, 366, 299, 675, 1456]

# ╔═╡ 759f17a0-33e5-11eb-2108-b95f22a16618
function get_multiplier(list::AbstractArray) 
	for i in 1:length(list)
		item = list[i]
		remainder = 2020 - item
		idx = findall(x -> x == remainder, list)
		if (length(idx) > 0)
			return(item * list[idx])
			break
		end
	end
end

# ╔═╡ 8e752a70-33e6-11eb-1c28-df54d0a495b5
# try out funtion with test list 
get_multiplier(list)

# ╔═╡ 2ecdd840-33ed-11eb-3843-fb6e15e8c3a1
# loading data
begin
	input = open("input_day1.txt")
	lines = readlines(input)
	lines = [parse(Int, x) for x in lines]
	get_multiplier(lines)
end

# ╔═╡ 78b49b60-33ed-11eb-32d4-6b54e7a2a5ee
# first sort the list, then fix the first number, then increment inwards until a sum is found 
function get_multiplier_three(list::AbstractArray)
	nitems = length(list)
	sort!(list)
	for i in 1:(nitems-2)
		first = list[i]
		left_idx = i+1
		right_idx = nitems
		while left_idx < right_idx
			left = list[left_idx]
			right = list[right_idx]
			if left + right + first < 2020
				left_idx += 1
			elseif left + right + first > 2020
				right_idx -= 1
			else 
				return(left * right * first)
				break
			end
		end
	end
	return(false)
end

# ╔═╡ 32411090-33ee-11eb-006a-6d4bb8bfe68d
begin
	get_multiplier_three(list)
	get_multiplier_three(lines)
end

# ╔═╡ b2b42f20-33f1-11eb-3ae3-7550672f8f3c


# ╔═╡ Cell order:
# ╟─aef9f930-33e4-11eb-0368-85b038554728
# ╠═db2c5d90-33e4-11eb-178d-f10508db3c84
# ╠═759f17a0-33e5-11eb-2108-b95f22a16618
# ╠═8e752a70-33e6-11eb-1c28-df54d0a495b5
# ╠═2ecdd840-33ed-11eb-3843-fb6e15e8c3a1
# ╠═78b49b60-33ed-11eb-32d4-6b54e7a2a5ee
# ╠═32411090-33ee-11eb-006a-6d4bb8bfe68d
# ╠═b2b42f20-33f1-11eb-3ae3-7550672f8f3c
