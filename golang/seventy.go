package main

import (
    "fmt"
    "sort"
)

type values [][6]int
var g_list values

func (a values) Len() int { return len(a) }
func (a values) Swap(i, j int) { a[i], a[j] = a[j], a[i] }
func (a values) Less(i, j int) bool { 
    for k:=0; k<6; k++ {
        switch {
        case a[i][k] < a[j][k]:
            return true
        case a[i][k] > a[j][k]:
            return false
        }
    }
    return false
}

func branch(l [6]int, index, count, sum int) {
    if sum == 70 && count == 6 {
        g_list = append(g_list, l)
        return
    }
    if sum > 70 || count >= 6 || index > 45 {
        return
    }
    branch(l, index + 1, count, sum)
    l[count] = index
    branch(l, index + 1, count + 1, sum + index)
}

func main() {
    g_list = make([][6]int, 0, 10240)

    branch([6]int{0, 0, 0, 0, 0, 0}, 1, 0, 0)
    sort.Sort(values(g_list))
    for k, v := range g_list {
        fmt.Printf("%d : %d %d %d %d %d %d\n", k + 1, v[0], v[1], v[2], v[3], v[4], v[5])
    }
}
