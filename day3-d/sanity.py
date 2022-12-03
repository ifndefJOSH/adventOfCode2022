# D is a broken language

def priority(c):
    if not c.isalpha():
        return 0
    if c.islower():
        return ord(c) - ord('a') + 1
    elif c.isupper():
        return ord(c) - ord('A') + 27

def firstSharedTriple(first, second, third):
    for c in first:
        if c in second and c in third:
            return c
    return '.'

with open("input.txt", 'r') as f:
    lines = f.readlines()
    total = 0
    for i in range(0, len(lines), 3):
        first = lines[i]
        second = lines[i + 1]
        third = lines[i + 2]
        total += priority(firstSharedTriple(first, second, third))
    print(f"Total: {total}")

