/**
 * This is the first program I've ever written in D.
 * So far I like it.
 */

import std.range, std.stdio, std.ascii;

/**
This function exploits the ASCII values of the letters.
*/
uint priority(dchar item) {
	// Item must be a letter
	if (!isAlpha(item)) {
		writeln("Warning! Item is not alpha ", item);
		return 0;
	}
	// If it's lowercase
	if (isLower(item)) {
		return cast(uint) item - 'a' + 1;
	}
	else { // it's uppercase
		return cast(uint) item - 'A' + 27;
	}

}

/*
For short strings this is faster than a hashmap
*/
dchar firstSharedChar(string first, string second) {
		foreach (fChar; first) {
			foreach (sChar; second) {
				if (fChar == sChar) {
					return fChar;
				}
			}
		}
		return '.';
}

void part1() {
	auto file = File("input.txt");
	auto range = file.byLine();
	ulong totalPriority = 0;
	foreach (line; range) {
		// Split the string in two
		if (line.length % 2 == 1) {
			writeln("Warning, line is not even number of characters: ", line);
		}
		ulong halfPoint = line.length / 2;
		string first = cast(string) line[0..halfPoint];
		string second = cast(string) line[halfPoint..$];
		dchar sChar = firstSharedChar(first, second);
		uint p = priority(sChar);
		totalPriority += p;
	}
	writeln("Total Priority: ", totalPriority);
}

void main() {
	part1();
}
