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

func main() {
	var inputArray []int
	var temp int
	file, err := os.Open("./input.txt")
	check(err)
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		temp, err = strconv.Atoi(scanner.Text())
		check(err)
		inputArray = append(inputArray, temp)
	}
	maxValue := len(inputArray)
	for outer := 0; outer < maxValue; outer++ {
		middle := outer
		for ; middle < maxValue; middle++ {
			inner := middle
			for ; inner < maxValue; inner++ {
				if inputArray[outer]+inputArray[inner]+inputArray[middle] == 2020 {
					answer := inputArray[outer] * inputArray[inner] * inputArray[middle]
					fmt.Println(inputArray[outer], inputArray[inner], answer)
				}
			}
		}
	}
}
