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
	var direction []string
	var distance []int
	northSouth := 0
	eastWest := 0
	facing := "E"
	for c := 0; c < len(inputArray); c++ {
		direction = append(direction, string(inputArray[c][0]))
		temp, _ := strconv.Atoi(string(inputArray[c][1:]))
		distance = append(distance, temp)
	}
	for c := 0; c < len(direction); c++ {
		if direction[c] == "F" {
			direction[c] = facing
			northSouth, eastWest, facing = setDistance(direction[c], distance[c], northSouth, eastWest, facing)
		} else if direction[c] == "L" {
			if distance[c] == 90 {
				if facing == "N" {
					facing = "W"
				} else if facing == "S" {
					facing = "E"
				} else if facing == "E" {
					facing = "N"
				} else if facing == "W" {
					facing = "S"
				}
			} else if distance[c] == 180 {
				if facing == "N" {
					facing = "S"
				} else if facing == "S" {
					facing = "N"
				} else if facing == "E" {
					facing = "W"
				} else if facing == "W" {
					facing = "E"
				}
			} else if distance[c] == 270 {
				if facing == "N" {
					facing = "E"
				} else if facing == "S" {
					facing = "W"
				} else if facing == "E" {
					facing = "S"
				} else if facing == "W" {
					facing = "N"
				}
			}
		} else if direction[c] == "R" {
			if distance[c] == 270 {
				if facing == "N" {
					facing = "W"
				} else if facing == "S" {
					facing = "E"
				} else if facing == "E" {
					facing = "N"
				} else if facing == "W" {
					facing = "S"
				}
			} else if distance[c] == 180 {
				if facing == "N" {
					facing = "S"
				} else if facing == "S" {
					facing = "N"
				} else if facing == "E" {
					facing = "W"
				} else if facing == "W" {
					facing = "E"
				}
			} else if distance[c] == 90 {
				if facing == "N" {
					facing = "E"
				} else if facing == "S" {
					facing = "W"
				} else if facing == "E" {
					facing = "S"
				} else if facing == "W" {
					facing = "N"
				}
			}
		} else {
			northSouth, eastWest, facing = setDistance(direction[c], distance[c], northSouth, eastWest, facing)
		}
	}
	fmt.Println(northSouth, ", ", eastWest)

}

func setDistance(direction string, distance int, northSouth int, eastWest int, facing string) (int, int, string) {
	if direction == "N" {
		northSouth = northSouth + distance
		return northSouth, eastWest, facing
	} else if direction == "S" {
		northSouth = northSouth - distance
		return northSouth, eastWest, facing
	} else if direction == "E" {
		eastWest = eastWest + distance
		return northSouth, eastWest, facing
	} else if direction == "W" {
		eastWest = eastWest - distance
		return northSouth, eastWest, facing
	}
	fmt.Println("ERROR", direction)
	return 0, 0, "ERROR"
}
