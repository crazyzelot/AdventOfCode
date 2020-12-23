package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
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
	allergenMap := make(map[string][]string)
	for c := 0; c < len(inputArray); c++ {
		splitInput := strings.Split(inputArray[c], " (contains ")
		ingredientsArray := strings.Split(splitInput[0], " ")
		allergenArray := strings.Split(string(splitInput[1][0:(len(splitInput[1])-1)]), ", ")
		for i := range allergenArray {
			for x := range ingredientsArray {
				allergenMap[allergenArray[i]] = append(allergenMap[allergenArray[i]], ingredientsArray[x])
			}
		}
	}
	fmt.Println(allergenMap)
}
