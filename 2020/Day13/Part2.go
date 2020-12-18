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
	var intBusTime []int
	var inds []int
	temp := inputArray[1]
	busTime := strings.Split(temp, ",")
	for c := range busTime {
		if busTime[c] != "x" {
			temp, _ := strconv.Atoi(busTime[c])
			intBusTime = append(intBusTime, temp)
			inds = append(inds, c)
		} else {
			intBusTime = append(intBusTime, 0)
		}
	}
	x := 0
	lcm := 1
	for c := range inds {
		for foundIt := 0; foundIt != 1; {
			fmt.Println("What solution I am checking", x)
			//fmt.Println("What modulus I am looking for", (inds[c]-(len(intBusTime)-1))*-1)
			//fmt.Println("Bus ID", intBusTime[inds[c]])
			//fmt.Println("Index of Bus ID I am on", inds[c])
			//fmt.Println(((x + inds[c]) % intBusTime[inds[c]]))
			//bufio.NewReader(os.Stdin).ReadBytes('\n')
			if inds[c] == 0 {
				if (((x % intBusTime[inds[c]]) - inds[c]) * -1) == (inds[c]) {
					fmt.Println((((x % intBusTime[inds[c]]) - inds[c]) * -1))
					foundIt = 1
					lcm = lcm * intBusTime[inds[c]]
					fmt.Println(lcm)
				}
			} else if ((x + inds[c]) % intBusTime[inds[c]]) == 0 {
				//fmt.Println((((x % intBusTime[inds[c]]) - inds[c]) * -1))
				foundIt = 1
				lcm = lcm * intBusTime[inds[c]]
				//fmt.Println(lcm)
			}

			x = x + lcm
		}
	}
	fmt.Println(x - lcm)
}
