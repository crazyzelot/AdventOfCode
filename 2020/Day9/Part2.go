package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
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
	numberIndex := 0
	number := 731031916
	var intInput []int
	for c := 0; c < len(inputArray); c++ {
		nextInput, _ := strconv.Atoi(inputArray[c])
		intInput = append(intInput, nextInput)
		if nextInput == number {
			numberIndex = c
		}
	}
	lowerBound := 0
	upperBound := 0
	for c := 0; c < len(intInput); c++ {
		runningSum := 0
		if intInput[c] < number {
			runningSum = runningSum + intInput[c]
			for i := c + 1; i < len(intInput); i++ {
				runningSum = runningSum + intInput[i]
				if runningSum == number {
					fmt.Println("We found it")
					lowerBound = c
					upperBound = i
					c = len(intInput)
				} else if runningSum > number {
					break
				}
			}
		} else {
			fmt.Println("We somehow missed the correct answer. Let's try again.", numberIndex, c)
			break
		}
	}
	largest := 0
	smallest := 1000000000000000000
	for c := lowerBound; c < upperBound+1; c++ {
		if smallest > intInput[c] {
			smallest = intInput[c]
		}
		if largest < intInput[c] {
			largest = intInput[c]
		}
	}
	solution := largest + smallest
	fmt.Println(largest, smallest, solution)

}
