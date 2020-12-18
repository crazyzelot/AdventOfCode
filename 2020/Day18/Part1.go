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
	solution := 0
	for c := 0; c < len(inputArray); c++ {
		solution = solution + parsing(inputArray[c])
	}
	fmt.Println(solution)
}

func parsing(input string) int {
	var parsedArray []string
	solution := 0
	for i := 0; i < len(input); i++ {
		if string(input[i]) == "(" {
			parsedArray = append(parsedArray, "(")
		} else if string(input[i]) == ")" {
			parsedArray = append(parsedArray, ")")
		} else if string(input[i]) == "+" {
			parsedArray = append(parsedArray, "+")
		} else if string(input[i]) == "*" {
			parsedArray = append(parsedArray, "*")
		} else if string(input[i]) != " " {
			parsedArray = append(parsedArray, string(input[i]))
		}
	}
	index := 0
	solution, index = badMaths(parsedArray, index)
	return solution
}

func badMaths(parsedArray []string, index int) (int, int) {
	solution := 0
	for index < len(parsedArray) {
		fmt.Println(parsedArray)
		if parsedArray[index] == "(" {
			fmt.Println("I found a (")
			index = index + 1
			tmp := 0
			tmp, index = badMaths(parsedArray, index)
			solution = solution + tmp
		} else if parsedArray[index] == ")" {
			fmt.Println("I found a )")
			index++
			return solution, index
		} else {
			if solution == 0 {
				fmt.Print("Loading my first element: ")
				temp, _ := strconv.Atoi(parsedArray[index])
				solution = temp
				fmt.Println(solution)
				index++
			}
			if parsedArray[index] == "+" {
				fmt.Println("I found a +", solution)
				index++
				if parsedArray[index] == "(" {
					fmt.Println("I found a (", solution)
					index = index + 1
					tmp := 0
					tmp, index = badMaths(parsedArray, index)
					solution = solution + tmp
					fmt.Println("I now have solution: ", solution, index)

				} else {
					fmt.Println(parsedArray[index])
					temp, _ := strconv.Atoi(parsedArray[index])
					solution = solution + temp
					index++
				}
			} else if parsedArray[index] == "*" {
				fmt.Println("I found a *")
				index++
				if parsedArray[index] == "(" {
					fmt.Println("I found a (")
					index = index + 1
					tmp := 0
					tmp, index = badMaths(parsedArray, index)
					solution = solution * tmp
				} else {
					fmt.Println(parsedArray[index])
					temp, _ := strconv.Atoi(parsedArray[index])
					solution = solution * temp
					fmt.Println("I just finished Multipling and now have this is a solution: ", solution)
					index++
				}
			}
		}
	}
	return solution, index
}
