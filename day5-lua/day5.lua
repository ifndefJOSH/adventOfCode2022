
local inputFile = "input.txt"
local crateFile = "initConfig.txt"
local crateFileFinal = "initConfig2.txt"

function modifyCrates(crates, fromIndex, toIndex, stackCount)
	printTable(crates)
	print(crates[fromIndex - 1][1])
	print("Size of crates: ", #(crates))
	print("Last element in crates: ", crates[#(crates)])
	print("Second to last element in crates: ", crates[#(crates) - 1])
	print("Index to pull from (remember, Lua is 1-based indexing): ", fromIndex)
	print("Crate at this index: ", crates[fromIndex])
	print("Crate at this index - 1: ", crates[fromIndex - 1])
	print("Make it make sense")
	-- Lua is a busted language
	local topFromCrate = #(crates[fromIndex])
	for i = topFromCrate,topFromCrate - stackCount, -1 do
		if crates[fromIndex] == nil then
			break
		end
		crates[toIndex][#(crates[toIndex])] = crates[fromIndex][i]
		crates[fromIndex][i] = nil
	end
	return crates
end

function getCrates()
	crates = {}
	local i = 1
	for line in io.lines(crateFileFinal) do
		crates[i] = {}
		for j =1, #line do
			local c = line:sub(j,j)
			crates[i][j] = c
		end
		i = i + 1
	end
	return crates
end

function printTable(table)
	for i = 1,#(table),1 do
		print("==== i = ", i, "=====")
		for j = 1,#(table[i]),1 do
			print(table[i][j])
		end
		print("===============")
	end
end

-- Not used. Tried to parse the crate
function getInitialCrateConfig()
	crates = {}
	-- Get the number of crates
	local cratesLine = ""
	for line in io.lines(crateFile) do
		cratesLine = line
	end
	local crateNames = {}
	for cN in string.gmatch(cratesLine, "%S+") do
		table.insert(crateNames, cN)
	end
	for i = 1, #(crateNames),1 do
		crates[i] = {}
	end
	for line in io.lines(crateFile) do
		if (line == cratesLine) then
			return crates
		end
		-- There are 3 characters in between crates in a line with an initial offset of 2
		for i = 1,#(crateNames),1 do
			local crateIndex = 1 + 4 * (i - 1)
			local crateAtLocation = string.sub(line, i, i)
			print(crateAtLocation)
			if crateAtLocation ~= " " then
				crates[i][#(crates[i])] = crateAtLocation
			end
		end
	end
end

-- Checks to see if a file exists
function fileExists(file)
	local f = io.open(file, "rb")
	if f then f:close() end
	return f ~= nil
end

-- Part 1
function part1()
	print("TODO: Part 1")
	if not fileExists(inputFile) then
		print("ERROR: Input file does not exist!")
		return
	end
	local crates = getCrates()
	printTable(crates)
	for line in io.lines(inputFile) do
		if line == "" then
			break
		end
		print(line)
		local lineMatch = {}
		local i = 1
		for v in string.gmatch(line, "%d+") do
			lineMatch[i] = v
			i = i + 1
		end
		local moveCount = lineMatch[1]
		local fromCrate = lineMatch[2]
		local toCrate  = lineMatch[3]
		print(moveCount, " ", fromCrate, " ", toCrate)
		crates = modifyCrates(crates, fromCrate, toCrate, moveCount)
	end
	printTable(crates)
end

-- Part 2
function part2()
	-- TODO
	print("TODO: Part 2")
end

-- Main function
-- This will execute part 1 and part 2
function main()
	print("Hello World! This is actually my first program written in Lua")
	part1()
	part2()
end

main()
