//
//  ContentView.swift
//  BMICalculator
//
//  Created by Anthony Roushdy on 11/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var weight: String = ""
    @State var height: String = ""
    @State var BMI_String: String = ""
    @State var category: String = "Category appears here..."
    var body: some View {
        Form {
            VStack { //VStack = vertical stack to design the label and the font
                Text("BMI Calculator App")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .padding(.top, 50)
                HStack { //Horizontal Stack, stacks organize the code
                    Text("Your weight(kg):")
                    TextField("Please enter here...", text: $weight)
                        .padding(.bottom)
                        .padding(.top)
                    HStack {
                        Text("Your height (cm): ")
                        TextField("Please enter your height here...", text: $height)
                    }
                }.padding(.bottom, 50) // We are specifying the padding to be put.
                Button(action: {
                    let weight_float = Float(self.weight)
                    let height_float = Float(self.height)
                    let BMI = weight_float!/pow((height_float! / 100),2)//We have the BMI formula
                    self.BMI_String = String(BMI)
                    switch BMI {
                    case 1..<15:
                        self.category = "Very severely underweight"
                    case 15...16:
                        self.category = "Severely underweight"
                    case 16..<18.5:
                        self.category = "Underweight"
                    case 18.5..<25:
                        self.category = "Normal"
                    case 25..<30:
                        self.category = "Overweight"
                    case 30..<40:
                        self.category = "Moderately obese"
                    case 40..<60:
                        self.category = "Very severely obese"
                    default:
                        return
                    }
                }) {
                    Text("Calculate my BMI!")
                        .fontWeight(.bold)
                        .font(.title)
                }.background(Color.white)
                    .padding(.bottom, 50)
                HStack {
                    Text("Your BMI is: ").foregroundColor(Color.blue)
                        .font(.title)
                    Text(BMI_String).font(.title)
                }.padding(.bottom, 25)
                Text(self.category)
                    .fontWeight(.bold)
                    .font(.title)
                    .background(Color.yellow)
            }
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

