package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
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
	firstCheck := ".shiny gold*"
	solution := bagLoop(inputArray, firstCheck)
	encountered := map[string]bool{}
	result := []string{}
	for v := range solution {
		if encountered[solution[v]] == true {

		} else {
			encountered[solution[v]] = true
			result = append(result, solution[v])
		}
	}
	for v := range result {
		fmt.Println(result[v])
	}
}

func bagLoop(bagCheck []string, regE string) []string {
	var resultsArray []string
	for c := 0; c < len(bagCheck); c++ {
		test, secondCheck := bagChecker(bagCheck, regE, c)
		if test != "0" && test != "9" {
			//fmt.Println(secondCheck)
			result := bagLoop(bagCheck, secondCheck)
			result = append(result, test)
			for i := 0; i < len(result); i++ {
				resultsArray = append(resultsArray, result[i])
			}
			//fmt.Println("HERE", resultsArray)
		} else if test == "9" {
			fmt.Println("ERROR")
		}
	}
	//fmt.Println(resultsArray)
	return resultsArray
}

func bagChecker(bagCheck []string, regE string, index int) (string, string) {
	var newBags []string
	nextCheck := ""
	re := regexp.MustCompile(regE)
	if re.FindStringIndex(bagCheck[index]) != nil {
		newBags = strings.Split(bagCheck[index], "contain")
		nextCheck = newBags[0]
		nextCheck = nextCheck[0 : len(nextCheck)-2]

	}
	if newBags == nil {
		return "0", ""
	} else if newBags != nil {
		//fmt.Println(string(regE[1 : len(regE)-1]))
		//fmt.Println("Next Check: ", nextCheck)
		return nextCheck, "." + nextCheck + "*"
	} else {
		return "9", "ERROR"
	}
}
