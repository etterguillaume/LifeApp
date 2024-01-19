//
//  UserInputView.swift
//  Life
//
//  Created by Guillaume Etter on 2024-01-18.
//

import Foundation
import SwiftUI


struct UserInputView: View {
    @Binding var currentAge : Float
    @Binding var expectancy : Double
    @Binding var birthday : Date
    @Binding var isSmoker : Bool
    @Binding var isOverweight : Bool
    
    var body: some View {
        VStack{
            Text("Birthdate")
                .font(.custom("Jost-Medium", size:24))
                .foregroundColor(.white)
            
            DatePicker("Birthday",
                       selection: $birthday,
                       displayedComponents: [.date])
            .datePickerStyle(.wheel)
            .accentColor(.tomatoRed)
            .colorScheme(.dark)
            .frame(width:200, height:200)
            .onChange(of: birthday){
                expectancy = computeExpectancy(birthday, isSmoker, isOverweight)
            }
            HStack{
                Toggle(isOn: $isSmoker)
                {
                    Label("Smoker", systemImage: "lungs.fill")
                        .font(.custom("Jost-Medium", size:18))
                }
                    .toggleStyle(.button)
                    .onChange(of: isSmoker){
                        expectancy = computeExpectancy(birthday, isSmoker, isOverweight)
                    }
                    .foregroundColor(.deepOrange)
                
                
                Toggle(isOn: $isOverweight)
                {
                    Label("Overweight", systemImage: "scalemass.fill")
                        .font(.custom("Jost-Medium", size:18))
                }
                    .toggleStyle(.button)
                    .onChange(of: isOverweight){
                        expectancy = computeExpectancy(birthday, isSmoker, isOverweight)
                    }
                    .foregroundColor(.niceGreen)
            }
        }
        .padding(10)
    }
}


#Preview {
    ContentView()
}
