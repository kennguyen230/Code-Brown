//
//  CalcStats.swift
//  poop-counter
//
//  Created by Ken Nguyen on 12/4/22.
//

import Foundation

/*
 
    For 'all time' functions the data will be multiple arrays,
    each representing each year (data2019, data2020, etc).
 
    List of functions:
        1. Cumulative poops this year
        2. Cumulative poops all time
        3. Avg poops this year
        4. Avg poops all time
        5. Max poop this year
        6. Max poop all time
        
 */

func calcCumulativeYr(data: [Int]) -> Int {
    return data.reduce(0,+)
}

/*
    data2019 = [1,2,3,4,5,6,7,8,9,10,11,12]
    data2020 = [2,4,6,8,10,12,14,16,18,20,24,26]
    data2021 = [3,6,9,12,15,18,21,24,27,30,36,39]
    dataAT = [[data2019], [data2020], [data2021]]
 */
func calcCumulativeAT(data: [[Int]]) -> Int {
    var total = 0
    data.forEach { year in
        total += year.reduce(0,+)
    }
    return total
}

func avgPoopsYr(data: [Int]) -> Int {
    return data.reduce(0,+)/data.count
}

func avgPoopsAT(data: [[Int]]) -> Int {
    return calcCumulativeAT(data: data)/(data.count*12)
}

func maxPoopYr(data: [Int]) -> Int {
    return data.max() ?? 0
}

func maxPoopAT(data: [[Int]]) -> Int {
    var max = 0
    data.forEach { year in
        var temp = maxPoopYr(data: year)
        if(temp > max) {
            max = temp
        }
    }
    return max
}







