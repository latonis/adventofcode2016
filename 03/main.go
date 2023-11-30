package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func isValidTriangle(x int, y int, z int) bool {
	return x+y > z && x+z > y && z+y > x
}

func main() {
	readFile, err := os.Open("./input")

	if err != nil {
		fmt.Println(err)
	}

	fileScanner := bufio.NewScanner(readFile)

	fileScanner.Split(bufio.ScanLines)

	var fileLines []string

	for fileScanner.Scan() {
		fileLines = append(fileLines, fileScanner.Text())
	}
	readFile.Close()

	solvePartOne(fileLines)
	solvePartTwo(fileLines)
}

func solvePartOne(input []string) int {
	var validCount = 0

	for _, line := range input {
		triangle := strings.Fields(line)
		// fmt.Println(triangle)
		// fmt.Println(triangle[0], triangle[1], triangle[2])

		x, _ := strconv.Atoi(triangle[0])

		y, _ := strconv.Atoi(triangle[1])

		z, _ := strconv.Atoi(triangle[2])

		if isValidTriangle(x, y, z) {
			validCount++
		}

	}

	fmt.Printf("Valid triangle count (rows): %d\n", validCount)

	return validCount
}

func solvePartTwo(input []string) int {

	var values = make(map[int][]int)
	var valCount = 0
	var validTriangleCount = 0

	for _, line := range input {
		triangle := strings.Fields(line)

		x, _ := strconv.Atoi(triangle[0])
		values[0] = append(values[0], x)

		y, _ := strconv.Atoi(triangle[1])
		values[1] = append(values[1], y)

		z, _ := strconv.Atoi(triangle[2])
		values[3] = append(values[3], z)

		if valCount >= 2 {

			for _, verticalTriangle := range values {
				if isValidTriangle(verticalTriangle[0], verticalTriangle[1], verticalTriangle[2]) {
					validTriangleCount++
				}
			}

			values = make(map[int][]int)
			valCount = 0
		} else {
			valCount++
		}
	}

	fmt.Printf("Valid triangle count (columns): %d\n", validTriangleCount)

	return validTriangleCount
}
