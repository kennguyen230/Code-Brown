//
//  CalcStats.swift
//  poop-counter
//
//  Created by Ken Nguyen on 12/4/22.
//

import Foundation

func calcCumulative(data: Array<Int>) -> Int {
    var cumulative: Int = 0
    for i in 0..<(data.count) {
        cumulative += data[i]
    }
    return cumulative
}


