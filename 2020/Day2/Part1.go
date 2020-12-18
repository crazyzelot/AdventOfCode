package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {
	inputArray := getInput()
	fmt.Println(len(inputArray))
	stop := len(inputArray)
	solution := 0
	for count := 0; count < stop; count++ {
		splitLine := strings.Split(inputArray[count], " ")
		temp := strings.Split(splitLine[0], "-")
		minS := temp[0]
		min, _ := strconv.Atoi(minS)
		maxS := temp[1]
		max, _ := strconv.Atoi(maxS)
		value := splitLine[1]
		value = string(value[0])
		password := splitLine[2]
		charCount := strings.Count(password, value)
		if charCount >= min && charCount <= max {
			solution++
		}
	}
	fmt.Println(solution)
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
