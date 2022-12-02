//
//  CalendarView.swift
//  poop-counter
//
//  Created by Ken Nguyen on 11/23/22.
//

import SwiftUI

struct CalendarView: View {
    
    private var data: [Int] = [50, 0, 56, 69, 3, 71, 33, 45, 2, 34, 100, 3]
    private let colors: [Color] = [.red, .green, .blue, .yellow]
    private let months: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
   
    private let flexibleColumns = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100))
    ]
    
    var body: some View {
        NavigationStack {
            
            HStack {
                Spacer()
                Button {
                // TODO: Add functionality to edit button
                    print("Edit mode")
                } label: {
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .frame(width:30, height:30)
                        .padding(.trailing, 20)
                }
            }
            
            Spacer()
                .frame(height:30)
            
            LazyVGrid(columns: flexibleColumns, spacing: 30) {
                ForEach(data.indices) { index in
//                ForEach(Array(data.enumerated()), id: \.1) { (number,index) in
                    VStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 105, height: 95)
                                .foregroundColor(colors[index%4])
                                .cornerRadius(25)
                                .shadow(color: .gray, radius: 10.0)
                            Text("\(data[index])")
                                .foregroundColor(.white)
                                .font(.system(size: 45, weight: .medium, design: .rounded))
                            
                        }
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing, 50)
                        .padding(.leading, 50)
                        
                        Text(months[Int(index)])
                        
                    }
                }
            }
            
            Spacer()
                .frame(height:20)
            
            ZStack {
                Rectangle()
                    .frame(width:360, height: 85)
                    .foregroundColor(.blue)
                    .cornerRadius(25)
                    .shadow(color: .gray, radius:10.0)
                VStack {
                    Text("\(calcCumulative(data: data))")
                        .foregroundColor(.white)
                        .font(.system(size:45, weight:.medium, design:.rounded))
                        .frame(maxWidth: 315, alignment: .leading)
                    Text("Cumulative score")
                        .foregroundColor(.white)
                        .font(.system(size:14, weight:.medium, design:.rounded))
                        .frame(maxWidth: 315, alignment: .leading)
                        
                    
                }
            }
            
            Spacer()
            
        }
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

func calcCumulative(data: Array<Int>) -> Int {
    var cumulative: Int = 0
    for i in 0..<(data.count) {
        cumulative += data[i]
    }
    return cumulative
}
