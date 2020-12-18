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
	var commandArray []string
	var valueArray []int
	for c := range inputArray {
		temp := strings.Split(inputArray[c], " ")
		commandArray = append(commandArray, temp[0])
		tempV, _ := strconv.Atoi(temp[1])
		valueArray = append(valueArray, tempV)
	}
	//commandIndex := 0
	//valueIndex := 0
	accumulator := 0
	visitedIndex := make(map[int]int)
	for c := 0; c < len(inputArray); {
		_, found := visitedIndex[c]
		if !found {
			if commandArray[c] == "nop" {
				fmt.Println("nop")
				visitedIndex[c] = 1
				c++
			} else if commandArray[c] == "acc" {
				fmt.Println("acc")
				accumulator = accumulator + valueArray[c]
				visitedIndex[c] = 1
				c++
			} else if commandArray[c] == "jmp" {
				fmt.Println("jmp")
				visitedIndex[c] = 1
				c = c + valueArray[c]
			}
		} else {
			fmt.Println("Value in the accumulator is", accumulator)
			break
		}
	}
}
