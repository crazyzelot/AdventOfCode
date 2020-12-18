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
	wayPointNS := 1
	wayPointEW := 10
	for c := 0; c < len(inputArray); c++ {
		direction = append(direction, string(inputArray[c][0]))
		temp, _ := strconv.Atoi(string(inputArray[c][1:]))
		distance = append(distance, temp)
	}
	for c := 0; c < len(direction); c++ {
		if direction[c] == "F" {
			for i := 0; i < distance[c]; i++ {
				northSouth = northSouth + wayPointNS
				eastWest = eastWest + wayPointEW
			}

		} else if direction[c] == "L" {
			if distance[c] == 90 {
				temp := -1 * wayPointNS
				wayPointNS = wayPointEW
				wayPointEW = temp
			} else if distance[c] == 180 {
				wayPointNS = -1 * wayPointNS
				wayPointEW = -1 * wayPointEW
			} else if distance[c] == 270 {
				temp := wayPointNS
				wayPointNS = -1 * wayPointEW
				wayPointEW = temp

			}
		} else if direction[c] == "R" {
			if distance[c] == 270 {
				temp := -1 * wayPointNS
				wayPointNS = wayPointEW
				wayPointEW = temp
			} else if distance[c] == 180 {
				wayPointNS = -1 * wayPointNS
				wayPointEW = -1 * wayPointEW
			} else if distance[c] == 90 {
				temp := wayPointNS
				wayPointNS = -1 * wayPointEW
				wayPointEW = temp

			}
		} else {
			wayPointNS, wayPointEW, facing = setDistance(direction[c], distance[c], wayPointNS, wayPointEW, facing)
		}
	}
	fmt.Println(northSouth, ", ", eastWest)
	fmt.Println(wayPointNS, ", ", wayPointEW)

}

func setDistance(direction string, distance int, wayPointNS int, wayPointEW int, facing string) (int, int, string) {
	if direction == "N" {
		wayPointNS = wayPointNS + distance
		return wayPointNS, wayPointEW, facing
	} else if direction == "S" {
		wayPointNS = wayPointNS - distance
		return wayPointNS, wayPointEW, facing
	} else if direction == "E" {
		wayPointEW = wayPointEW + distance
		return wayPointNS, wayPointEW, facing
	} else if direction == "W" {
		wayPointEW = wayPointEW - distance
		return wayPointNS, wayPointEW, facing
	}
	fmt.Println("ERROR", direction)
	return 0, 0, "ERROR"
}
