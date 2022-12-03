//
//  ContentView.swift
//  poop-counter
//
//  Created by Ken Nguyen on 11/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var poop = 0
    
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
                                StatsView()
                            } label: {
                                Image(systemName: "chart.bar.xaxis")
                                    .resizable()
                                    .frame(width:30, height:30)
                                    .background(
                                    Circle()
                                        .foregroundColor(.white)
                                        .frame(width:50, height: 50)
                                    )
                                    .padding(.leading, 25)
                                    .padding(.top, 25)
                            }
                            
                            Spacer()
                            
                            NavigationLink {
                                CalendarView()
                            } label: {
                                Image(systemName: "calendar")
                                    .resizable()
                                    .frame(width:30, height:30)
                                    .background(
                                    Circle()
                                        .foregroundColor(.white)
                                        .frame(width:50, height: 50)
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
                                    .frame(width: 250, height: 50)
                                    .foregroundColor(.white)
                                
                                Text(Date().formatted(
                                    .dateTime
                                        .year(.twoDigits)
                                        .month()
                                        .day()
                                        .weekday()
                                ))
                            }
                        }
                        
                        Spacer().frame(height:125)
                        
                        // For the plus button, minus button, and counter
                        HStack{
                            Spacer()
                            
                            // Minus button
                            Button{
                                if(poop == 0){
                                    return
                                } else {
                                    poop-=1
                                }
                            } label: {
                                Image(systemName:"minus.circle")
                                    .resizable()
                                    .frame(width:40, height:40)
                                    .foregroundColor(.accentColor)
                                    .opacity(1.0)
//                                    .glowBorder(color: .white, lineWidth: 4)
                                
                            }
                            
                            Spacer()
                            
                            // Counter
                            Text(String(poop))
                                .font(.system(size: 96, weight: .medium, design: .rounded))
//                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                                .glowBorder(color: .white, lineWidth: 2)
                            
                            
                            Spacer()
                            
                            // Plus button
                            Button{
                                poop+=1
                            } label: {
                                Image(systemName:"plus.circle")
                                    .resizable()
                                    .frame(width:40, height:40)
                                    .foregroundColor(.accentColor)
                                    .opacity(1.0)
//                                    .glowBorder(color: .white, lineWidth: 4)
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
