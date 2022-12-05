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


