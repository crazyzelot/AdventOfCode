package main

import (
	"bufio"
	"fmt"
	"os"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func getInput() []string {
	var inputArray []string
	file, err := os.Open("./input.txt")
	check(err)
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		check(err)
		inputArray = append(inputArray, scanner.Text())
	}
	return inputArray
}

func getVInput() []string {
	var inputArray []string
	file, err := os.Open("./input.txt")
	check(err)
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		check(err)
		inputArray = append(inputArray, scanner.Text())
	}
	maxValue := len(inputArray)
	for reader := 0; reader < maxValue; reader++ {
		fmt.Println(inputArray[reader])
	}
	return inputArray
}

func main() {
	inputArray := getInput()
	solution := 0
	for c := 0; c < len(inputArray); c++ {
		leftColumn := 0
		rightColumn := 7
		columnCount := 8
		frontRow := 0
		backRow := 127
		rowCount := 128
		for i := 0; i < len(inputArray[c]); i++ {
			if string(inputArray[c][i]) == "F" {
				rowCount = rowCount / 2
				backRow = backRow - rowCount
			} else if string(inputArray[c][i]) == "B" {
				rowCount = rowCount / 2
				frontRow = frontRow + rowCount
			} else if string(inputArray[c][i]) == "L" {
				columnCount = columnCount / 2
				rightColumn = rightColumn - columnCount
			} else if string(inputArray[c][i]) == "R" {
				columnCount = columnCount / 2
				leftColumn = leftColumn + columnCount
			}
		}
		fmt.Println(" Back Row: ", backRow, "\r\nFront Row: ", frontRow, "\r\nLeft Column: ", leftColumn, "\r\nRight Column: ", rightColumn)
		if (backRow*8)+leftColumn > solution {
			solution = (backRow * 8) + leftColumn
		}
	}
	fmt.Println(solution)
}
