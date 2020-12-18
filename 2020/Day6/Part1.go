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
	answers := ""
	solution := 0
	for c := 0; c < len(inputArray); c++ {
		if inputArray[c] != "" {
			answers = answers + inputArray[c]
			if c+1 < len(inputArray) {
				if inputArray[c+1] == "" {
				} else {
					answers = answers + " "
				}

			}
		} else {
			//
			a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z := 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
			for inc := 0; inc < len(answers); inc++ {
				if string(answers[inc]) == "a" {
					a = a + 1
				} else if string(answers[inc]) == "b" {
					b = b + 1
				} else if string(answers[inc]) == "c" {
					c = c + 1
				} else if string(answers[inc]) == "d" {
					d = d + 1
				} else if string(answers[inc]) == "e" {
					e = e + 1
				} else if string(answers[inc]) == "f" {
					f = f + 1
				} else if string(answers[inc]) == "g" {
					g = g + 1
				} else if string(answers[inc]) == "h" {
					h = h + 1
				} else if string(answers[inc]) == "i" {
					i = i + 1
				} else if string(answers[inc]) == "j" {
					j = j + 1
				} else if string(answers[inc]) == "k" {
					k = k + 1
				} else if string(answers[inc]) == "l" {
					l = l + 1
				} else if string(answers[inc]) == "m" {
					m = m + 1
				} else if string(answers[inc]) == "n" {
					n = n + 1
				} else if string(answers[inc]) == "o" {
					o = o + 1
				} else if string(answers[inc]) == "p" {
					p = p + 1
				} else if string(answers[inc]) == "q" {
					q = q + 1
				} else if string(answers[inc]) == "r" {
					r = r + 1
				} else if string(answers[inc]) == "s" {
					s = s + 1
				} else if string(answers[inc]) == "t" {
					t = t + 1
				} else if string(answers[inc]) == "u" {
					u = u + 1
				} else if string(answers[inc]) == "v" {
					v = v + 1
				} else if string(answers[inc]) == "w" {
					w = w + 1
				} else if string(answers[inc]) == "x" {
					x = x + 1
				} else if string(answers[inc]) == "y" {
					y = y + 1
				} else if string(answers[inc]) == "z" {
					z = z + 1
				}
			}
			answerList := strings.Split(answers, " ")
			af := a / len(answerList)
			bf := b / len(answerList)
			cf := c / len(answerList)
			df := d / len(answerList)
			ef := e / len(answerList)
			ff := f / len(answerList)
			gf := g / len(answerList)
			hf := h / len(answerList)
			iff := i / len(answerList)
			jf := j / len(answerList)
			kf := k / len(answerList)
			lf := l / len(answerList)
			mf := m / len(answerList)
			nf := n / len(answerList)
			of := o / len(answerList)
			pf := p / len(answerList)
			qf := q / len(answerList)
			rf := r / len(answerList)
			sf := s / len(answerList)
			tf := t / len(answerList)
			uf := u / len(answerList)
			vf := v / len(answerList)
			wf := w / len(answerList)
			xf := x / len(answerList)
			yf := y / len(answerList)
			zf := z / len(answerList)
			tmp := 0
			if af == 1 {
				tmp = tmp + af
			}
			if bf == 1 {
				tmp = tmp + bf
			}
			if cf == 1 {
				tmp = tmp + cf
			}
			if df == 1 {
				tmp = tmp + df
			}
			if ef == 1 {
				tmp = tmp + ef
			}
			if ff == 1 {
				tmp = tmp + ff
			}
			if gf == 1 {
				tmp = tmp + gf
			}
			if hf == 1 {
				tmp = tmp + hf
			}
			if iff == 1 {
				tmp = tmp + iff
			}
			if jf == 1 {
				tmp = tmp + jf
			}
			if kf == 1 {
				tmp = tmp + kf
			}
			if lf == 1 {
				tmp = tmp + lf
			}
			if mf == 1 {
				tmp = tmp + mf
			}
			if nf == 1 {
				tmp = tmp + nf
			}
			if of == 1 {
				tmp = tmp + of
			}
			if pf == 1 {
				tmp = tmp + pf
			}
			if qf == 1 {
				tmp = tmp + qf
			}
			if rf == 1 {
				tmp = tmp + rf
			}
			if sf == 1 {
				tmp = tmp + sf
			}
			if tf == 1 {
				tmp = tmp + tf
			}
			if uf == 1 {
				tmp = tmp + uf
			}
			if vf == 1 {
				tmp = tmp + vf
			}
			if wf == 1 {
				tmp = tmp + wf
			}
			if xf == 1 {
				tmp = tmp + xf
			}
			if yf == 1 {
				tmp = tmp + yf
			}
			if zf == 1 {
				tmp = tmp + zf
			}
			fmt.Println(tmp)
			solution = solution + tmp
			answers = ""
		}
	}
	fmt.Println(solution)
}
