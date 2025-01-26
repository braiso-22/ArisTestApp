//
//  BMIView.swift
//  ArisTestApp
//
//  Created by Brais Fernández Vázquez on 25/1/25.
//

import SwiftUI

enum Sex: String, CaseIterable {
    case man, woman
}

struct BMIView: View {
    @State var selectedSex: Sex = .man
    @State var height: Double = 175
    @State var weight: Double = 75
    @State var age: Int = 25
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("BMI calculator")){
                    Picker(selection: $selectedSex) {
                        Text("Man").tag(Sex.man)
                        Text("Woman").tag(Sex.woman)
                    } label: {
                        Text("Gender:")
                    }
                    
                    VStack{
                        Text("Height: \(String(format: "%.1f", height)) cm.")
                        Slider(
                            value: $height,
                            in: 60...250,
                            step: 0.5
                        ){
                            Text("Height:")
                        } minimumValueLabel: {
                            Text("60")
                        } maximumValueLabel: {
                            Text("250")
                        }
                    }
                    
                    Stepper (
                        value:$age,
                        in: 2...150,
                        step: 1
                    ){
                        Text("Age: \(age) years old")
                    }
                    
                    Stepper (
                        value:$weight,
                        in: 11...300,
                        step: 1
                    ){
                        Text("Weight: \(Int(weight.rounded())) kg.")
                    }
                    
                    NavigationLink(destination: BMIResultView(bmi:getBMI(
                        heightInCm: height,
                        weightInKg: weight),
                                                              idealWeight: getIdealWeight(heightInCm: height)
                    )){
                        Text("Calculate")
                    }
                }
            }
        }
    }
}

func getBMI(heightInCm: Double, weightInKg: Double) -> Double {
    let weight = weightInKg
    let height = heightInCm / 100
    let bmi = weight / (height * height)
    return bmi
}

func getIdealWeight(heightInCm: Double) -> Double {
    let height = heightInCm / 100
    let idealWeight = 24 * height * height
    return idealWeight
}


#Preview {
    BMIView()
}
