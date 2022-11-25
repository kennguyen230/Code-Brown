//
//  ContentView.swift
//  poop-counter
//
//  Created by Ken Nguyen on 11/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("Background")
            VStack{
                
                // For the two buttons at the top
                HStack{
                    Image(systemName: "chart.bar.xaxis")
                        .resizable()
                        .frame(width:28, height:28)
                        .padding(.leading, 25)
                    Spacer()
                    Image(systemName: "calendar.circle.fill")
                        .resizable()
                        .frame(width:28, height:28)
                        .padding(.trailing, 25)
                }
                
                // For the month & day
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 225, height: 50)
                            .foregroundColor(Color.gray)
                        Text("Month x, day y")
                    }
                }
                
                Spacer()
                
                // For the plus button, minus button, and counter
                HStack{
                    Spacer()
                    Image(systemName:"minus.circle")
                        .resizable()
                        .frame(width:28, height:28)
                        .opacity(0.7)
                    Spacer()
                    Text("46")
                        .font(.system(size: 96))
                    Spacer()
                    Image(systemName:"plus.circle")
                        .resizable()
                        .frame(width:28, height:28)
                        .opacity(0.7)
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
