package main

import (
	"fmt"
	"strconv"
	"strings"
)

func main() {
	input := "1,12,0,20,8,16"
	temp := strings.Split(input, ",")
	inputLength := len(temp)
	var game []int
	spoken := make(map[int]int)
	for i := range temp {
		tmp, _ := strconv.Atoi(temp[i])
		game = append(game, tmp)
	}
	fmt.Println(game)
	nextNumber := 0
	for i := 0; i < 30000000; i++ {
		index := i % inputLength
		//fmt.Println(i)
		_, found := spoken[nextNumber]
		if i < inputLength {
			//fmt.Println("Init")
			spoken[game[index]] = i
			if i == inputLength-1 {
				nextNumber = 0
			} else {
				nextNumber = game[(index+1)%inputLength]
			}

		} else if !found {
			//fmt.Println("NewNumber. The next number spoken should be 0.")
			spoken[nextNumber] = i
			nextNumber = 0
		} else {
			//fmt.Println("Number was found. Next number spoken will be", i, "-", spoken[nextNumber], "=", i-spoken[nextNumber])
			tmp := i - spoken[nextNumber]
			spoken[nextNumber] = i
			nextNumber = tmp
		}
		if i > 29999990 {
			fmt.Println("Number was found. Next number spoken will be", i, "-", spoken[nextNumber], "=", i-spoken[nextNumber])
			fmt.Println(nextNumber)
		}
		//bufio.NewReader(os.Stdin).ReadBytes('\n')

	}

	fmt.Println(nextNumber)
}
