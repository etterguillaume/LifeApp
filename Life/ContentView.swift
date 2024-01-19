//
//  ContentView.swift
//  Life
//
//  Created by Guillaume Etter on 2024-01-17.
//

import SwiftUI

struct ContentView: View {
    @State var currentAge : Float = 25.0
    @State var expectancy = 1.0
    @State var birthday : Date = Date()
    @State var isSmoker : Bool = false
    @State var isOverweight : Bool = false
    
    var body: some View {
        ZStack{
            Color(.background)
                .ignoresSafeArea()
            VStack {
                ExpectancyView(
                    currentAge: $currentAge,
                    expectancy: $expectancy,
                    birthday: $birthday
                )
                Spacer(minLength:50)
                UserInputView(
                    currentAge: $currentAge,
                    expectancy: $expectancy,
                    birthday: $birthday,
                    isSmoker: $isSmoker,
                    isOverweight: $isOverweight)
            }
        }
    }
}



func computeExpectancy(_ birthday : Date, _ isSmoker : Bool, _ isOverweight : Bool) -> Double {
    let now = Date()
    let calendar = Calendar.current
    let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
    let age = ageComponents.year!
    var avgExpectancy = 75.0
    if isSmoker{
        avgExpectancy -= 13
    }
    if isOverweight{
        avgExpectancy -= 7
    }
    
    let expectancy = min(1-(Double(age)/avgExpectancy), 1.0)
    return expectancy
}


#Preview {
    ContentView()
}
