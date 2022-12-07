#!/usr/bin/ruby -w

dirs = []

def getFolderArray(pwd)
  d = dirs
  foundAll = true
  for fName in pwd
    found = false
    for dr in d
      if dr[0] == fName
        d = dr[1]
        found = true
    end
    foundAll = found and foundAll
    if not found
      # Creates directory
      dNew = []
      d.append([fName, dNew])
      d = dNew
    end
  end
  return d
end

def part1()
  pwd = []
  folderArray = dir
  File.open("input.txt") do |fh|
    while (line = fh.gets) != nil
      if line == "$ cd .."
        pwd.pop
        newDir = pwd[pwd.size - 1]
        getFolderArray(pwd)
      elsif "$ cd" in line
        newDir = line.gsub("$ cd ", "").strip()
      elsif line == "$ ls"
        # TODO: figure out how to peek at the next line
      end
    end
  end
end

def part2()
  File.readlines("input.txt").each do |line|
    # TODO
  end
end

print "Day 7: Advent of Code\n"
part1()
