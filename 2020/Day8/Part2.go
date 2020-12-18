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

	nopArray, jmpArray, success := prog(commandArray, valueArray)
	//fmt.Println(len(nopArray), nopArray, len(jmpArray), jmpArray)
	for loop := 0; success != 1 && loop < 2; loop++ {
		//fmt.Println("Checking my nop to jmp changes.")
		//nop check loop
		//count := 0
		for c := 0; success != 1 && c < len(nopArray); c++ {
			temp := nopArray[c]
			commandArray[temp] = "jmp"
			_, _, success = prog(commandArray, valueArray)
			//fmt.Println(success, temp)
			commandArray[temp] = "nop"
			//count = c
		}
		//fmt.Println("I checked", count, "nop changes. Now checking my jmp to nop changes.")
		//jmp check loop
		//count = 0
		for c := 0; success != 1 && c < len(jmpArray); c++ {
			temp := jmpArray[c]
			commandArray[temp] = "nop"
			_, _, success = prog(commandArray, valueArray)
			//fmt.Println(success, temp)
			commandArray[temp] = "jmp"
			//count = c
		}
		//fmt.Println("I checked", count, "jmp changes.")
		if success == 9 {
			fmt.Println("WEIRD")
		}
	}
	//fmt.Println(nopArray, jmpArray, success)
}

func prog(commandArray []string, valueArray []int) ([]int, []int, int) {
	accumulator := 0
	visitedIndex := make(map[int]int)
	var nopArray []int
	var jmpArray []int
	for c := 0; c < len(commandArray); {
		_, found := visitedIndex[c]
		if !found {
			if commandArray[c] == "nop" {
				//fmt.Println("nop", valueArray[c])
				visitedIndex[c] = 1
				nopArray = append(nopArray, c)
				c++
			} else if commandArray[c] == "acc" {
				//fmt.Println("acc", valueArray[c])
				accumulator = accumulator + valueArray[c]
				visitedIndex[c] = 1
				c++
			} else if commandArray[c] == "jmp" {
				//fmt.Println("jmp", valueArray[c])
				jmpArray = append(jmpArray, c)
				visitedIndex[c] = 1
				c = c + valueArray[c]
			}
		} else {
			//fmt.Println("Value in the accumulator is", accumulator, "my repeated index is", c, commandArray[c], valueArray[c])
			return nopArray, jmpArray, 0
		}
	}

	fmt.Println("Value in the accumulator is", accumulator, "my program completed")
	return nopArray, jmpArray, 1
}
