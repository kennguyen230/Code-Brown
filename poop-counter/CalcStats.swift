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

func calcCumulativeYr2(data: [String:Int]) -> Int {
    return data.values.reduce(0,+)
}

func calcCumulativeAT(data: [[Int]]) -> Int {
    var total = 0
    data.forEach { year in
        total += year.reduce(0,+)
    }
    return total
}

func calcCumulativeAT2(data: [String : [String:Int] ]) -> Int {
    var total = 0
    data.values.forEach { year in
        year.forEach { month in
            total += month.value
        }
    }
    return total
}

func avgPoopsYr(data: [Int]) -> Int {
    return data.reduce(0,+)/data.count
}

func avgPoopsYr2(data: [String:Int]) -> Int {
    return data.values.reduce(0,+)/data.values.count
}

func avgPoopsAT(data: [[Int]]) -> Int {
    return calcCumulativeAT(data: data)/(data.count*12)
}

func avgPoopsAT2(data: [String : [String:Int] ]) -> Int {
    return calcCumulativeAT2(data: data)/(data.values.count*12)
}

func maxPoopYr(data: [Int]) -> Int {
    return data.max() ?? 0
}

func maxPoopYr2(data: [String:Int]) -> Int {
    return data.values.max() ?? 0
}

func maxPoopAT(data: [[Int]]) -> Int {
    var max = 0
    data.forEach { year in
        let temp = maxPoopYr(data: year)
        if(temp > max) {
            max = temp
        }
    }
    return max
}

func maxPoopAT2(data: [String : [String:Int] ]) -> Int {
    var max = 0
    data.values.forEach { year in
        year.forEach { month in
            let temp = month.value
            if (temp > max) {
                max = temp
            }
        }
    }
    return max
}
