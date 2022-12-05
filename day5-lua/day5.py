import re
crates = []

def moveCrates(fromCrate, toCrate, count):
    for i in range(count):
        crates[toCrate - 1].append(crates[fromCrate - 1].pop())

def moveCrates2(fromCrate, toCrate, count):
    cratesToAppend = crates[fromCrate - 1][-count:]
    crates[fromCrate - 1] = crates[fromCrate - 1][:-count]
    for c in cratesToAppend:
        crates[toCrate - 1].append(c)

with open("initConfig2.txt", 'r') as c:
    for line in c:
        line = line.replace('\n', '')
        crates.append(list(line))

print(crates)

with open("input.txt", 'r') as l:
    for line in l:
        if line == "\n":
            continue
        count, fromCrate, toCrate = list(map(int, re.findall("\d+", line)))
        # Use moveCrates for part 1, moveCrates2 for part 2
        moveCrates2(fromCrate, toCrate, count)

print(crates)
for c in crates:
    print(c[len(c) - 1], end="")
print()
