//
//  ContentView.swift
//  poop-counter
//
//  Created by Ken Nguyen on 11/23/22.
//

import SwiftUI

var months:[String:Int] = [
    "January":0,
    "February":1,
    "March":2,
    "April":3,
    "May":4,
    "June":5,
    "July":6,
    "August":7,
    "September":8,
    "October":9,
    "November":10,
    "December":11
]

struct ContentView: View {
    
//    @State private var data:[Int] = [65,52,69,65,52,52,67,81,66,83,90,16]
    @State var savedData:[Int] = ((UserDefaults.standard.array(forKey:"USER_DATA") as? [Int] ?? [0,0,0,0,0,0,0,0,0,0,0,0]))
    
    init() {
        print(savedData)
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    // Homescreen background
                    Image("bg-summer")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height,
                               alignment: .center)
                        .opacity(1.0)
                    
                    VStack {
                        // For the two buttons at the top
                        HStack {
                            NavigationLink {
                                StatsView(data: $savedData)
                            } label: {
                                Image(systemName: "chart.bar.xaxis")
                                    .resizable()
                                    .frame(width:30, height:30)
                                    .background(
                                    Circle()
                                        .foregroundColor(.white)
                                        .frame(width:47, height: 47)
                                    )
                                    .padding(.leading, 25)
                                    .padding(.top, 25)
                            }
                            
                            Spacer()
                            
                            NavigationLink {
                                CalendarView(data: $savedData)
                            } label: {
                                Image(systemName: "calendar")
                                    .resizable()
                                    .frame(width:30, height:30)
                                    .background(
                                    Circle()
                                        .foregroundColor(.white)
                                        .frame(width:47, height: 47)
                                    )
                                    .padding(.trailing, 25)
                                    .padding(.top, 25)
                            }
                        }
                        
                        Spacer().frame(height:80)
                        
                        // For the month & day
                        HStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 275, height: 50)
                                    .foregroundColor(.white)
                                
                                Text(Date()
                                    .formatted(
                                    .dateTime
                                        .year(.twoDigits)
                                        .month()
                                        .day()
                                        .weekday()
                                ))
                                .font(.custom("Heebo-Regular_Light", size: 25))
                            }
                        }
                        
                        Spacer().frame(height:125)
                        
                        // For the plus button, minus button, and counter
                        HStack{
                            Spacer()
                            
                            // Minus button
                            Button{
                                if(savedData[getMonth()] == 0){
                                    return
                                } else {
                                    savedData[getMonth()]-=1
                                    UserDefaults.standard.set(savedData, forKey:"USER_DATA")
                                    print("Minus")
                                }
                            } label: {
                                Image(systemName:"minus.circle")
                                    .resizable()
                                    .frame(width:40, height:40)
                                    .foregroundColor(.accentColor)
                                    .opacity(1.0)
                            }
                            
                            Spacer()
                            
                            // Counter
                            Text(String("\(savedData[getMonth()])"))
                                .font(.custom("Heebo-Regular_Medium",size: 96))
                                .foregroundColor(.accentColor)
                                .glowBorder(color: .white, lineWidth: 1)
                            
                            Spacer()
                            
                            // Plus button
                            Button{
                                savedData[getMonth()] += 1
                                UserDefaults.standard.set(savedData, forKey:"USER_DATA")
                                print("Plus")
                            } label: {
                                Image(systemName:"plus.circle")
                                    .resizable()
                                    .frame(width:40, height:40)
                                    .foregroundColor(.accentColor)
                                    .opacity(1.0)
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func getMonth() -> Int {
    var month = 99
    let m = Date()
        .formatted(
        .dateTime
            .month(.wide)
        )
    months.forEach() { mo in
        if(m == mo.key) {
            month = mo.value
        }
    }
    return month
}
