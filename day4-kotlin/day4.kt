import java.io.BufferedReader
import java.io.File
import java.io.FileReader
import java.io.IOException

fun part1() {
	val file = File("input.txt")
	try {
		BufferedReader(FileReader(file)).use { br ->
			br.lines().forEach { line ->
				println(line)
			}
		}
	} catch (e : IOException) {
		e.printStackTrace()
	}
}

fun main() {
	println("Hello world!")
	part1()
}
