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
	mask := ""
	memMap := make(map[int]string)
	finalMap := make(map[int]string)
	for c := 0; c < len(inputArray); c++ {
		temp := strings.Split(inputArray[c], " = ")
		key := temp[0]
		value := temp[1]
		if key == "mask" {
			mask = value
			//fmt.Println(mask)
		} else {
			tmp := strings.Split(key, "[")
			key, _ := strconv.Atoi(string(tmp[1][:len(tmp[1])-1]))
			temp, _ := strconv.ParseInt(temp[1], 10, 64)
			value := strconv.FormatInt(temp, 2)
			memMap[key] = value
			dif := 0
			dif = len(mask) - len(memMap[key])
			var newValue string
			for i := 0; i < len(mask); i++ {
				if i-dif < 0 {
					if string(mask[i]) == "X" {
						newValue = newValue + "0"
					} else {
						newValue = newValue + string(mask[i])
					}
					fmt.Print("0")
				} else {
					if string(mask[i]) == "X" {
						newValue = newValue + string(memMap[key][i-dif])
					} else {
						newValue = newValue + string(mask[i])
					}
					fmt.Print(string(memMap[key][i-dif]))
				}

			}
			fmt.Println("")
			fmt.Println(mask)
			for i := range newValue {
				fmt.Print(string(newValue[i]))
			}
			finalMap[key] = newValue
			fmt.Println("")
			fmt.Println("")
		}
	}

	//addition
	var solution int64
	fmt.Println(finalMap)
	for c := range finalMap {
		conversion, _ := strconv.ParseInt(finalMap[c], 2, 64)
		solution = solution + conversion
	}
	fmt.Println(solution)
}
