package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	inputArray := getInput()
	//fmt.Println(len(inputArray))
	fileLength := len(inputArray)
	solution := 0
	yPos := 0
	for c := 0; c < fileLength; c++ {
		if string(inputArray[c][yPos]) == "#" {
			temp := inputArray[c]
			temp = temp[:yPos] + "X" + temp[yPos+1:]
			inputArray[c] = temp
			solution++
		} else {
			temp := inputArray[c]
			temp = temp[:yPos] + "O" + temp[yPos+1:]
			inputArray[c] = temp
		}
		yPos = (yPos + 3) % 31
	}
	fmt.Println("Slope of 3:1,", solution)
}

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
