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
	for c := 0; c < len(inputArray); c++ {
		temp, _ := strconv.Atoi(inputArray[c])
		intInput = append(intInput, temp)
		sort.Ints(intInput)
	}
	dif1 := 0
	dif3 := 0
	solution := 0
	intInput = append(intInput, intInput[len(intInput)-1]+3)
	for c := range intInput {
		if c == 0 {
			if intInput[c] == 1 {
				dif1++
			} else if intInput[c] == 2 {
			} else if intInput[c] == 3 {
				dif3++
			} else {
				fmt.Println("We have had some error.")
				break
			}
		} else {
			if intInput[c]-intInput[c-1] == 1 {
				dif1++
			} else if intInput[c]-intInput[c-1] == 2 {
			} else if intInput[c]-intInput[c-1] == 3 {
				dif3++
			} else {
				fmt.Println("We have had some error.")
				break
			}
		}
	}
	solution = dif1 * dif3
	fmt.Println("We have", dif1, "adapters with a dif of 1, and", dif3, "adpaters with a dif of 3.", solution)

}
