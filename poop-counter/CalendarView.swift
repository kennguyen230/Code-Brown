//
//  CalendarView.swift
//  poop-counter
//
//  Created by Ken Nguyen on 11/23/22.
//

import SwiftUI

struct CalendarView: View {
    
    @State var isEditing = false
    @State var data: [Int] = [50, 10, 0, 69, 3, 71, 0, 45, 2, 34, 100, 0]
    private let colors: [Color] = [.red, .green, .blue, .yellow]
    private let months: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
   
    private let flexibleColumns = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100))
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
//                Color("CreamColor")
//                    .ignoresSafeArea()
                LinearGradient(gradient: Gradient(colors: [Color("CreamColor"), Color.white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
//                        Spacer()
                        Button {
                        // TODO: Add functionality to edit button
                            self.isEditing.toggle()
                        } label: {
                            Image(systemName: "pencil.circle")
                                .resizable()
                                .frame(width:30, height:30)
//                                .padding(.trailing, 20)
                                .padding(.leading, 20)
                                .foregroundColor(.black)
                                .opacity(0.75)
                        }
                        Spacer()
                    }
                    
                    LazyVGrid(columns: flexibleColumns, spacing: 30) {
                        ForEach(data.indices) { index in
                            VStack {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 95, height: 80)
                                        .foregroundColor(.white)
                                        .cornerRadius(25)
                                        .shadow(color: .gray, radius: 8.0)
                                    
                                    if (data[index] == 0) {
                                        Text("\(data[index])")
                                            .hidden()
                                    }
                                    else {
                                        if (isEditing) {
                                            TextField("Name", text: $data[index])
                                                
                                        }
                                        else {
                                            Text("\(data[index])")
                                                .foregroundColor(.black)
                                                .font(.system(size: 40, weight: .medium, design: .rounded))
                                        }
                                        
                                    }
                                }
                                .aspectRatio(contentMode: .fit)
                                .padding(.trailing, 50)
                                .padding(.leading, 50)
                                
                                Text(months[Int(index)])
                                
                            }
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .frame(width:350, height: 85)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                            .shadow(color: .gray, radius:10.0)
                        VStack {
                            Text("\(calcCumulative(data: data))")
                                .foregroundColor(.black)
                                .frame(maxWidth: 315, alignment: .leading)
                                .font(.system(size:45, weight:.medium, design:.rounded))
                            Text("Cumulative score")
                                .foregroundColor(.black)
                                .font(.system(size:14, weight:.medium, design:.rounded))
                                .frame(maxWidth: 315, alignment: .leading)
                            
                        }
                    }
                }
            }
            .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive)).animation(Animation.spring())
            
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
