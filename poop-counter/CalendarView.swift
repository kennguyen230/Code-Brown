//
//  CalendarView.swift
//  poop-counter
//
//  Created by Ken Nguyen on 11/23/22.
//

import SwiftUI

struct CalendarView: View {
    
    // TEMPORARY DATA
    @State var data: [Int] = [50, 10, 0, 69, 3, 71, 0, 45, 2, 34, 100, 0]
    @State var dataAsString = [String]()
    @State var dataMap: [String:Int] = [
        "January":51,
        "February":10,
        "March":0,
        "April":69,
        "May":3,
        "June":71,
        "July":0,
        "August":45,
        "September":2,
        "October":34,
        "November":100,
        "December":0
    ]
    
    @State var showSave = false
    @State var isEditing = false
    private let months: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    private let flexibleColumns = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100))
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("CreamColor"), Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    HStack {
                        Spacer()
                        Button {
                            self.isEditing.toggle()
                            self.showSave.toggle()
                            dataAsString = intToStr(intArr: data)
                        } label: {
                            if(!showSave) {
                                Image(systemName: "pencil.circle")
                                    .resizable()
                                    .frame(width:35, height:35)
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Button {
                            self.isEditing.toggle()
                            data = strToInt(strArr: dataAsString)
                            self.showSave.toggle()
                        } label: {
                            if(showSave) {
                                Text("Save")
                                    .font(.system(size: 28.5)).fontWeight(.light)
                                    .foregroundColor(Color.blue)
                                    .opacity(showSave ? 1:0)
                            }
                        }
                    }
                    .padding(.trailing, 15)
                }
                .padding(.bottom, 10)
                
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
                                    //TODO: MAKE IT SO THAT YOU CAN EDIT INVISIBLE MONTHS
                                    Text("\(data[index])")
                                        .foregroundColor(.black)
                                        .font(.system(size: 40, weight: .medium, design: .rounded))
                                        .multilineTextAlignment(.center)
                                        .opacity(0)
                                }
                                else {
                                    if (isEditing) {
                                        TextField("Name", text: $dataAsString[index])
                                            .foregroundColor(.black)
                                            .font(.system(size: 40, weight: .medium, design: .rounded))
                                            .multilineTextAlignment(.center)
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
                        Text("\(calcCumulativeYr2(data: dataMap))")
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
        //TODO: Change animation to something more poppy
    }
    
    
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}




