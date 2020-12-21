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
	var rulesArray []string
	var messagesArray []string
	lineBreak := false
	for c := 0; c < len(inputArray); c++ {
		if !lineBreak {
			if inputArray[c] == "\r\n" {
				lineBreak = true
			} else {
				rulesArray = append(rulesArray, inputArray[c])
			}
		} else if lineBreak {
			messagesArray = append(messagesArray, inputArray[c])
		}
	}
	for c := 0; c < len(rulesArray); c++ {
		fmt.Println(rulesArray[c])
	}
}
