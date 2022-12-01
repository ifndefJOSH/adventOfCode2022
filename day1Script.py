
totalCalorieCounts = []
with open("day1Input.txt", 'r') as inFile:
	thisElveCalories = 0
	for line in inFile:
		if line == "\n":
			totalCalorieCounts.append(thisElveCalories)
			thisElveCalories = 0
		else:
			thisElveCalories += int(line)

totalCalorieCounts.sort()
print(totalCalorieCounts[len(totalCalorieCounts) - 1])
print(totalCalorieCounts[len(totalCalorieCounts) - 3:])
print(sum(totalCalorieCounts[len(totalCalorieCounts) - 3:]))
