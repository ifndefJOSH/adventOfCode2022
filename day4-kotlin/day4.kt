import java.io.BufferedReader
import java.io.File
import java.io.FileReader
import java.io.IOException

fun overlaps(fMin : Int, fMax : Int, sMin : Int, sMax : Int) : Boolean {
	return ((fMin >= sMin) && (fMin <= sMax)) || ((fMax >= sMin) && (fMax <= sMax)) || ((sMin >= fMin) && (sMin <= fMax)) || ((sMax >= fMin) && (sMax <= fMax))
}

fun fullyContains(fMin : Int, fMax : Int, sMin : Int, sMax : Int) : Boolean {
	return ((fMin >= sMin) && (fMax <= sMax)) || ((sMin >= fMin) && (sMax <= fMax))
	// first is contained within second
		//((fMin >= sMin) && (fMax <= sMax)) ||
		// second is contained in the first
		// ((sMin >= fMin) && (sMax <= fMax))
}

fun parts() {
	val file = File("input.txt")
	var totalFullyContained = 0
	var totalOverlapping = 0
	try {
		BufferedReader(FileReader(file)).use { br ->
			br.lines().forEach { line ->
				val ranges = line.split(",")
				val firstElveRange = ranges[0].split("-")
				val secondElveRange = ranges[1].split("-")
				try {
					val fMin = firstElveRange[0].toInt()
					val fMax = firstElveRange[1].toInt()
					val sMin = secondElveRange[0].toInt()
					val sMax = secondElveRange[1].toInt()
					println("For line $line: $fMin, $fMax, $sMin, $sMax")
					if (fullyContains(fMin, fMax, sMin, sMax)) {
						println("One fully contains the other")
						totalFullyContained++
					}
					if (overlaps(fMin, fMax, sMin, sMax)) {
						totalOverlapping++
					}
				} catch (nfe : NumberFormatException) {
					println("Not valid Integer!")
					nfe.printStackTrace()
				}
			}
		}
	} catch (e : IOException) {
		e.printStackTrace()
	}
	println("Total fully contained: $totalFullyContained")
	println("Total overlapping: $totalOverlapping")
}

fun main() {
	println("Hello world!")
	parts()
}
