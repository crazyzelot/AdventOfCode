package main

import (
	"fmt"
	"strconv"
	"strings"
)

func main() {
	input := "0,3,6"
	temp := strings.Split(input, ",")
	var game []int
	spoken := make(map[int]int)
	for i := range temp {
		tmp, _ := strconv.Atoi(temp[i])
		game = append(game, tmp)
	}
	fmt.Println(game)
	for i := 0; i < 6; i++ {
		index := i % 3
		fmt.Println("Number spoken", game[index])
		_, found := spoken[game[index]]
		if found {
			
		} else {
			fmt.Println("here")
			spoken[game[index]] = i
		}
	}
}
