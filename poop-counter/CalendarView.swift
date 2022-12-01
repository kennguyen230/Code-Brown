//
//  CalendarView.swift
//  poop-counter
//
//  Created by Ken Nguyen on 11/23/22.
//

import SwiftUI

struct CalendarView: View {
    
    private var data: [Int] = Array(1...12)
//    private var data: [Int] = [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    private let colors: [Color] = [.red, .green, .blue, .yellow]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    private let flexibleColumns = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: flexibleColumns, spacing: 30) {
                    ForEach(data, id: \.self) { number in
                        ZStack {
                            Rectangle()
                                .frame(width: 115, height: 100)
                                .foregroundColor(colors[number%4])
                                .cornerRadius(30)
                            Text("\(number)")
                                .foregroundColor(.white)
                                .font(.system(size: 80, weight: .medium, design: .rounded))
                        
                        }
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    }
                }
            }
        }
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
