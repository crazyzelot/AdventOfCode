package main

import (
	"bufio"
	"fmt"
	"os"
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
	individualPassport := ""
	passportCount := 0
	solution := 0
	for c := 0; c < len(inputArray); c++ {
		if inputArray[c] != "" {
			individualPassport = individualPassport + inputArray[c]
			if c+1 < len(inputArray) {
				if inputArray[c+1] == "" {
				} else {
					individualPassport = individualPassport + " "
				}

			}

		} else {
			passportCheck := strings.Split(individualPassport, " ")
			byr := 0
			iyr := 0
			eyr := 0
			hgt := 0
			hcl := 0
			ecl := 0
			pid := 0
			cid := 0
			for i := 0; i < len(passportCheck); i++ {
				pair := strings.Split(passportCheck[i], ":")
				if pair[0] == "byr" {
					byr = 1
				} else if pair[0] == "iyr" {
					iyr = 1
				} else if pair[0] == "eyr" {
					eyr = 1
				} else if pair[0] == "hgt" {
					hgt = 1
				} else if pair[0] == "hcl" {
					hcl = 1
				} else if pair[0] == "ecl" {
					ecl = 1
				} else if pair[0] == "pid" {
					pid = 1
				} else if pair[0] == "cid" {
					cid = 1
				}
			}
			if byr == 1 && iyr == 1 && eyr == 1 && hgt == 1 && hcl == 1 && ecl == 1 && pid == 1 && (cid == 1 || cid == 0) {
				fmt.Println(solution, byr, iyr, eyr, hgt, hcl, ecl, pid, cid, len(passportCheck))
				solution++
			} else {
				fmt.Println(passportCheck)
			}
			passportCount++
			individualPassport = ""
		}

	}
	fmt.Println("Solution should be:", solution)
}

//between 238 and 294
