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
	finalMap := make(map[int64]int64)
	for c := 0; c < len(inputArray); c++ {
		temp := strings.Split(inputArray[c], " = ")
		key := temp[0]
		value := temp[1]
		intValue, _ := strconv.ParseInt(temp[1], 10, 64)
		if key == "mask" {
			mask = value
			//fmt.Println(mask)
		} else {
			tmp := strings.Split(key, "[")
			key, _ := strconv.Atoi(string(tmp[1][:len(tmp[1])-1]))
			temp, _ := strconv.ParseInt(string(tmp[1][:len(tmp[1])-1]), 10, 64)
			value := strconv.FormatInt(temp, 2)
			memMap[key] = value
			dif := 0
			dif = len(mask) - len(memMap[key])
			var newValue string
			for i := 0; i < len(mask); i++ {
				if i-dif < 0 {
					if string(mask[i]) == "X" {
						newValue = newValue + "X"
					} else {
						newValue = newValue + string(mask[i])
					}
				} else {
					if string(mask[i]) == "X" {
						//fmt.Println(string(memMap[key][i-dif]))
						newValue = newValue + "X"
					} else if string(mask[i]) == "1" || string(memMap[key][i-dif]) == "1" {
						newValue = newValue + "1"
					} else {
						newValue = newValue + "0"
					}
				}

			}
			var a []string
			a = bitCheck(newValue)
			fmt.Println()
			for c := range a {
				fmt.Println(a[c])
				decimal, _ := strconv.ParseInt(a[c], 2, 64)
				finalMap[decimal] = intValue
			}

		}
	}
	var solution int64
	//fmt.Println(finalMap)
	for c := range finalMap {
		//conversion, _ := strconv.ParseInt(finalMap[c], 2, 64)
		solution = solution + finalMap[c]
	}
	//fmt.Println(solution)
}

func bitCheck(input string) []string {
	var a []string
	//fmt.Println(input)
	index := strings.IndexRune(input, 'X')
	if index != -1 {
		zero := string(input[:index]) + "0" + input[index+1:]
		z := bitCheck(zero)
		for c := range z {
			//fmt.Println(input)
			a = append(a, z[c])
		}
		one := string(input[:index]) + "1" + input[index+1:]
		o := bitCheck(one)
		for c := range o {

			a = append(a, o[c])
		}
		if !strings.Contains(zero, "X") {
			a = append(a, zero)
		}
		if !strings.Contains(one, "X") {
			a = append(a, one)
		}
	} else {
		a = append(a, input)
	}
	return a
}

//
//
//	conversion, _ := strconv.ParseInt(finalMap[c], 2, 64)
//	solution = solution + conversion
//
//fmt.Println(solution)
