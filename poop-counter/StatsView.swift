//
//  StatsView.swift
//  poop-counter
//
//  Created by Ken Nguyen on 11/23/22.
//

import SwiftUI

struct StatsView: View {
    
    // TEMPORARY DATA
    @State var data: [Int] = [50, 10, 0, 69, 3, 71, 0, 45, 2, 34, 100, 0]
    @State var data2020: [Int] = [50, 10, 0, 69, 3, 71, 0, 45, 2, 34, 100, 0]
    @State var data2021: [Int] = [50, 10, 0, 69, 3, 71, 0, 45, 2, 34, 100, 0]
    @State var data2022: [Int] = [50, 10, 0, 69, 3, 71, 0, 45, 2, 34, 100, 0]
    @State var dataGrouped = [[Int]]() //TODO: FIND OUT HOW TO GROUP DATA
    @State var dataAsString = [String]()
    private let months: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    var body: some View {
        NavigationStack {
            ScrollView () {
                VStack {
                    // Cumulative poops this year
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width:350, height: 100)
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.8), radius: 10)
                        VStack {
                            Text("\(calcCumulativeYr(data:data))")
                                .font(.custom("Handjet-Regular", fixedSize: 45))
                                .foregroundColor(.black)
                                .frame(maxWidth: 315, alignment: .leading)
//                                .font(.system(size:45, weight:.medium, design:.rounded))
                            Text("Cumulative poops this year")
                                .foregroundColor(.black)
                                .font(.system(size:14, weight:.medium, design:.rounded))
                                .frame(maxWidth: 315, alignment: .leading)
                        }
                    }
                    
                    // Cumulative poops all time
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width:350, height: 100)
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.8), radius: 10)
                        VStack {
                            Text("n/a")
                                .foregroundColor(.black)
                                .frame(maxWidth: 315, alignment: .leading)
//                                .font(.system(size:45, weight:.medium, design:.rounded))
                                .font(.custom("Handjet-Regular", fixedSize: 45))
                            Text("Cumulative poops all time")
                                .foregroundColor(.black)
                                .font(.system(size:14, weight:.medium, design:.rounded))
                                .frame(maxWidth: 315, alignment: .leading)
                        }
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        // Avg poops this year
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width:165, height: 100)
                                .foregroundColor(.white)
                                .shadow(color: Color.black.opacity(0.8), radius: 10)
                            VStack {
                                Text("\(avgPoopsYr(data:data))")
                                    .foregroundColor(.black)
                                    .frame(maxWidth: 125, alignment: .leading)
//                                    .font(.system(size:25, weight:.medium, design:.rounded))
                                    .font(.custom("Handjet-Regular", fixedSize: 35))
                                Text("Avg poops this year")
                                    .foregroundColor(.black)
                                    .font(.system(size:15, weight:.medium, design:.rounded))
                                    .frame(maxWidth: 125, alignment: .leading)
                            }
                        }
                        
                        Spacer().frame(width:20)
                        
                        // Avg poops all time
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width:165, height: 100)
                                .foregroundColor(.white)
                                .shadow(color: Color.black.opacity(0.8), radius: 10)
                            VStack {
                                Text("n/a")
                                    .foregroundColor(.black)
                                    .frame(maxWidth: 125, alignment: .leading)
//                                    .font(.system(size:25, weight:.medium, design:.rounded))
                                    .font(.custom("Handjet-Regular", fixedSize: 35))
                                Text("Avg poops all time")
                                    .foregroundColor(.black)
                                    .font(.system(size:15, weight:.medium, design:.rounded))
                                    .frame(maxWidth: 125, alignment: .leading)
                            }
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width:350, height: 100)
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.8), radius: 10)
                        VStack {
                            Text("\(maxPoopYr(data:data))")
                                .foregroundColor(.black)
                                .frame(maxWidth: 315, alignment: .leading)
//                                .font(.system(size:35, weight:.medium, design:.rounded))
                                .font(.custom("Handjet-Regular", fixedSize: 45))
                            Text("Best month this year")
                                .foregroundColor(.black)
                                .font(.system(size:14, weight:.medium, design:.rounded))
                                .frame(maxWidth: 315, alignment: .leading)
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width:350, height: 100)
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.8), radius: 10)
                        VStack {
                            Text("n/a")
                                .foregroundColor(.black)
                                .frame(maxWidth: 315, alignment: .leading)
//                                .font(.system(size:35, weight:.medium, design:.rounded))
                                .font(.custom("Handjet-Regular", fixedSize: 45))
                            Text("Best month all time")
                                .foregroundColor(.black)
                                .font(.system(size:14, weight:.medium, design:.rounded))
                                .frame(maxWidth: 315, alignment: .leading)
                        }
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .navigationTitle("Stats")
            .background(Color("MintGreen"))
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
