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
	preambleBounds := 25
	preamble := make(map[int][]int)
	solution := 0
	index := 0
	for i := 0; i < preambleBounds; i++ {
		key, _ := strconv.Atoi(inputArray[i])
		preamble[key] = sumMaker(inputArray, key, i)
	}
	for i := 25; i < len(inputArray); i++ {
		value, _ := strconv.Atoi(inputArray[i])
		if checkValue(value, preamble) {
			whatToDelete, _ := strconv.Atoi(inputArray[index])
			delete(preamble, whatToDelete)
			for x := range preamble {
				preamble[x] = append(preamble[x], x+value)
			}
			preamble[value] = nil
		} else {
			solution = value
			fmt.Println("We found our solution", solution)
			break
		}
	}
	fmt.Println(solution)
}

func sumMaker(array []string, first int, i int) []int {
	var response []int
	for c := i + 1; c < 25; c++ {
		second, _ := strconv.Atoi(array[c])
		response = append(response, first+second)
	}

	return response
}

func checkValue(value int, preamble map[int][]int) bool {
	for x := range preamble {
		for y := range preamble[x] {
			if value == preamble[x][y] {
				return true
			}
		}
	}
	return false
}
