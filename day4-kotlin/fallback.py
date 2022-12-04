# Sanity check

with open("input.txt", "r") as f:
	t = 0
	for line in f:
		first, second = line.split(',')
		fMin, fMax = first.split('-')
		sMin, sMax = second.split('-')
		fMin, fMax, sMin, sMax = int(fMin), int(fMax), int(sMin), int(sMax)
		if ((fMin >= sMin) and (fMax <= sMax)) or ((sMin >= fMin) and (sMax <= fMax)):
			t += 1




print(t)
with open("input.txt", "r") as f:
	t = 0
	for line in f:
		first, second = line.split(',')
		fMin, fMax = first.split('-')
		sMin, sMax = second.split('-')
		fMin, fMax, sMin, sMax = int(fMin), int(fMax), int(sMin), int(sMax)
		if ((fMin >= sMin) and (fMin <= sMax)) or ((fMax >= sMin) and (fMax <= sMax)) or ((sMin >= fMin) and (sMin <= fMax)) or ((sMax >= fMin) and (sMax <= fMax)):
			t += 1




print(t)
