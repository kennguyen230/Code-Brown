//
//  ArrayBuilder.swift
//  poop-counter
//
//  Created by Ken Nguyen on 12/4/22.
//

import Foundation

func strToInt (strArr: Array<String>) -> Array<Int> {
    var intArr = strArr.map { Int($0)! }
    return intArr
}

func intToStr (intArr: Array<Int>) -> Array<String> {
    var strArr = intArr.map { String($0) }
    return strArr
}

//func create2D(data1: [Int], data2: [Int], data3: [Int]) -> [[Int]] {
//    var dataGrouped = [[Int]]()
//    dataGrouped.append(data1)
//    dataGrouped.append(data2)
//    dataGrouped.append(data3)
//    return dataGrouped
//}

