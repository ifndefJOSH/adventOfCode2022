/**
 * This is the first program I've ever written in D.
 * So far I like it.
 */

import std.range, std.stdio, std.ascii, std.string;

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

/*
First char in ALL THREE strings (separate since less efficient)
*/
dchar firstSharedTriple(string first, string second, string third) {
	foreach (fChar; first) {
		if (indexOf(second, fChar) != -1 && indexOf(third, fChar) != -1) {
			return fChar;
		}
	}
	return '.';
}

void part2() {
	auto file = File("input.txt");
	auto lines = file.byLine();
	// string[] lines; // dynamic array

	ulong totalPriority = 0;
	// This is the best way I could figure to do it.
	// D won't let me convert a ByLineImpl to an array
	string first = "";
	string second = "";
	string third = "";
	uint toSet = 1;
	foreach (line; lines) {
		writeln(line);
		if (toSet == 1) {
			writeln("Setting first");
			first = cast(string) line;
			writeln("First = ", first);
			toSet = 2;
		}
		else if (toSet == 2) {
			writeln("Setting second");
			second = cast(string) line;
			writeln("Second = ", second);
			toSet = 3;
		}
		else if (toSet == 3) {
			toSet = 1;
			writeln("Setting third");
			third = cast(string) line;
			writeln("Third = ", third);
			writeln("=========\n\t", first, " \n\t", second, " \n\t", third);
			dchar c = firstSharedTriple(first, second, third);
			totalPriority += priority(c);
		}
		else {
			writeln("Houston, we have a problem.");
		}
	}
	writeln("Total Priority: ", totalPriority);
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
	// part1();
	part2();
}
