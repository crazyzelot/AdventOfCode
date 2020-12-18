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
	for c := 0; c < len(inputArray); c++ {
		fmt.Println(inputArray[c])
	}
	arrivalTime, _ := strconv.Atoi(inputArray[0])
	temp := inputArray[1]
	busTime := strings.Split(temp, ",")
	solution := ""
	timeDifference := 999999999999999
	for c := range busTime {
		if busTime[c] != "x" {
			temp, _ := strconv.Atoi(busTime[c])
			timeDif := arrivalTime % temp
			timeDif = ((timeDif - temp) * -1)
			if timeDifference > timeDif {
				solution = busTime[c]
				timeDifference = timeDif
			}
		}
	}
}
