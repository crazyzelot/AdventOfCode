package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
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
	firstCheck := "shiny gold bags"
	bagRules := make(map[string][]string)
	for c := range inputArray {
		temp := strings.Split(inputArray[c], " contain ")
		temp[1] = strings.Replace(temp[1], ".", "", -1)
		tmp := strings.Split(temp[1], ", ")
		removeS := regexp.MustCompile("s$")
		for i := range tmp {
			if removeS.FindStringIndex(tmp[i]) == nil {
				tmp[i] = tmp[i] + "s"
			}
			bagRules[temp[0]] = append(bagRules[temp[0]], tmp[i])
		}

	}

	result := bagLoop(bagRules, firstCheck)
	fmt.Println(result)
}

func bagLoop(bagRules map[string][]string, firstCheck string) int {
	contents, found := bagRules[firstCheck]
	sum := 0
	if found {
		fmt.Println(contents)
		for c := range contents {
			if contents[c] == "no other bags" {
				fmt.Println("The", firstCheck, "contains no other bags.")
				sum = 0
			} else {
				fmt.Println("The", firstCheck, "contains", contents[c])
				temp := strings.SplitN(contents[c], " ", 2)
				count, _ := strconv.Atoi(temp[0])
				fmt.Println("My current sum for the", firstCheck, "is", sum, "and count is", count)
				deeper := bagLoop(bagRules, temp[1])
				fmt.Println("Currently deeper is", deeper)
				sum = sum + count + (count * deeper)
				fmt.Println("       My current sum for the", firstCheck, "is", sum)
			}
			fmt.Println("The final count of bags in the", firstCheck, "is", sum)
		}
		return sum
	} else {
		return 0
	}
}
