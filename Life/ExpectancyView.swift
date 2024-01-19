//
//  ExpectancyView.swift
//  Life
//
//  Created by Guillaume Etter on 2024-01-18.
//

import Foundation
import SwiftUI

struct ExpectancyView: View {
    @Binding var currentAge : Float
    @Binding var expectancy : Double
    @Binding var birthday : Date
    
    var body: some View {
        VStack
        {
            Text("Time left on earth")
                .foregroundColor(.white)
                .font(.custom("Jost-Medium", size:24))
                .padding(10)
            
            ZStack{
                Circle()
                    .stroke(lineWidth: 40.0)
                    .opacity(0.1)
                    .foregroundColor(.coolBlue)
//                    .frame(width: 200.0, height: 200.0)
                    .padding(20.0)
                
                Circle()
                    .trim(from:0.0, to: expectancy)
                    .stroke(style: StrokeStyle(lineWidth: 40.0, lineCap: .round, lineJoin: .round))
                    .animation(.easeOut(duration:0.3), value: expectancy)
                    .foregroundColor(.tomatoRed)
//                    .frame(width: 200.0, height: 200.0)
                    .padding(20.0)
                    .rotationEffect(Angle(degrees: 270.0))
                
            }
        }
    }
}

#Preview {
    ContentView()
}
