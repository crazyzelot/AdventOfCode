package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
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
	var intInput []int
	intMap := make(map[int]int)
	for c := 0; c < len(inputArray); c++ {
		temp, _ := strconv.Atoi(inputArray[c])
		intInput = append(intInput, temp)
		sort.Ints(intInput)
	}
	intInput = append(intInput, intInput[len(intInput)-1]+3)
	//startingPoint := intInput[len(intInput)-1]
	//endingPoint := intInput[0]
	for c := range intInput {
		intMap[intInput[c]] = 0
	}
	for c := range intMap {
		fmt.Println(c)
	}
	lightningStrike(intMap, intInput)

}

func lightningStrike(intMap map[int]int, intInput []int) {
	for c := range intInput {
		first := 0
		second := 0
		third := 0
		if c == 0 {
			intMap[intInput[c]] = 1
		} else if c == 1 {
			if intInput[c]-intInput[c-1] < 4 {
				first = intMap[intInput[c-1]]
				if intInput[c]-3 < 1 {
					first = first + 1
				}
			}
			intMap[intInput[c]] = first
		} else if c == 2 {
			if intInput[c]-intInput[c-1] < 4 {
				first = intMap[intInput[c-1]]
			}
			if intInput[c]-intInput[c-2] < 4 {
				second = intMap[intInput[c-2]]
			}
			if intInput[c]-3 < 1 {
				first = first + 1
			}
			intMap[intInput[c]] = first + second
		} else {
			if intInput[c]-intInput[c-1] < 4 {
				first = intMap[intInput[c-1]]
			}
			if intInput[c]-intInput[c-2] < 4 {
				second = intMap[intInput[c-2]]
			}
			if intInput[c]-intInput[c-3] < 4 {
				third = intMap[intInput[c-3]]
			}
			intMap[intInput[c]] = first + second + third
		}

	}
	fmt.Println(intMap)
}

func optionCheck() {

}
