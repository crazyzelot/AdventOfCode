package main

import (
	"bufio"
	"fmt"
	"os"
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
	preLoop := inputArray
	var postLoop []string
	changed := 1
	for changed != 0 {
		changed = 0
		for r := range preLoop {
			row := ""
			for c := range preLoop[r] {
				assignment := "."
				if r == 0 && c == 0 {
					if string(preLoop[r][c]) == "L" {
						assignment = "#"
					} else {
						assignment = string(preLoop[r][c])
					}
				} else if r == len(preLoop)-1 && c == len(preLoop[r])-1 {
					if string(preLoop[r][c]) == "L" {
						assignment = "#"
					} else {
						assignment = string(preLoop[r][c])
					}
				} else if r == len(preLoop)-1 && c == 0 {
					if string(preLoop[r][c]) == "L" {
						assignment = "#"
					} else {
						assignment = string(preLoop[r][c])
					}
				} else if r == 0 && c == len(preLoop[r])-1 {
					if string(preLoop[r][c]) == "L" {
						assignment = "#"
					} else {
						assignment = string(preLoop[r][c])
					}
				} else {
					if string(preLoop[r][c]) == "L" || string(preLoop[r][c]) == "#" {
						adj := 0
						adj = adj + checkLeft(preLoop, r, c)
						adj = adj + checkLeftUp(preLoop, r, c)
						adj = adj + checkUp(preLoop, r, c)
						adj = adj + checkRightUp(preLoop, r, c)
						adj = adj + checkRight(preLoop, r, c)
						adj = adj + checkRightDown(preLoop, r, c)
						adj = adj + checkDown(preLoop, r, c)
						adj = adj + checkLeftDown(preLoop, r, c)
						if string(preLoop[r][c]) == "#" && adj > 4 {
							assignment = "L"
							changed++
						} else if string(preLoop[r][c]) == "L" && adj == 0 {
							assignment = "#"
							changed++
						} else {
							assignment = string(preLoop[r][c])
						}
					}
				}
				row = row + assignment
			}
			postLoop = append(postLoop, row)
		}
		preLoop = nil
		preLoop = postLoop
		postLoop = nil
		//fmt.Println(len(preLoop), len(inputArray))
		for i := range preLoop {
			fmt.Println(preLoop[i])
		}
		bufio.NewReader(os.Stdin).ReadBytes('\n')
	}
	solution := 0

	for i := range preLoop {
		for j := range preLoop[i] {
			if string(preLoop[i][j]) == "#" {
				solution++
			}
		}
	}
	fmt.Println(solution)
}

func checkRight(preLoop []string, row int, column int) int {
	for c := column + 1; c < len(preLoop[row]); c++ {
		if string(preLoop[row][c]) == "L" {
			return 0
		} else if string(preLoop[row][c]) == "#" {
			return 1
		}
	}
	return 0
}
func checkRightUp(preLoop []string, row int, column int) int {
	r := row - 1
	for c := column + 1; c < len(preLoop[row]); c++ {
		if r == -1 {
			return 0
		}
		if string(preLoop[r][c]) == "L" {
			return 0
		} else if string(preLoop[r][c]) == "#" {
			return 1
		}
		r--
	}
	return 0
}
func checkUp(preLoop []string, row int, column int) int {
	for r := row - 1; r > -1; r-- {
		if string(preLoop[r][column]) == "L" {
			return 0
		} else if string(preLoop[r][column]) == "#" {
			return 1
		}
	}
	return 0
}
func checkLeftUp(preLoop []string, row int, column int) int {
	r := row - 1
	for c := column - 1; c > -1; c-- {
		if r == -1 {
			return 0
		}
		if string(preLoop[r][c]) == "L" {
			return 0
		} else if string(preLoop[r][c]) == "#" {
			return 1
		}
		r--
	}
	return 0
}
func checkLeft(preLoop []string, row int, column int) int {
	for c := column - 1; c > -1; c-- {
		if string(preLoop[row][c]) == "L" {
			return 0
		} else if string(preLoop[row][c]) == "#" {
			return 1
		}
	}
	return 0
}
func checkLeftDown(preLoop []string, row int, column int) int {
	r := row + 1
	for c := column - 1; c > -1; c-- {
		if r == len(preLoop) {
			return 0
		}
		if string(preLoop[r][c]) == "L" {
			return 0
		} else if string(preLoop[r][c]) == "#" {
			return 1
		}
		r++
	}
	return 0
}
func checkDown(preLoop []string, row int, column int) int {
	for r := row + 1; r < len(preLoop); r++ {
		if string(preLoop[r][column]) == "L" {
			return 0
		} else if string(preLoop[r][column]) == "#" {
			return 1
		}
	}
	return 0
}
func checkRightDown(preLoop []string, row int, column int) int {
	r := row + 1
	for c := column + 1; c < len(preLoop[row]); c++ {

		if r == len(preLoop) {
			return 0
		}
		if string(preLoop[r][c]) == "L" {
			return 0
		} else if string(preLoop[r][c]) == "#" {
			//fmt.Println(r, c)
			return 1
		}
		r++
	}

	return 0
}
