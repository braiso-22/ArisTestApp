//
//  BMIResultView.swift
//  ArisTestApp
//
//  Created by Brais Fernández Vázquez on 26/1/25.
//

import SwiftUI

struct BMIResultView: View {
    
    @State var bmi: Double
    @State var idealWeight: Double
    
    var body: some View {
        List {
            Section(header: Text("Result")){
                Text("Your BMI is: \(String(format: "%.2f", bmi)).")
                Text("You are: \(getCategory(bmi:bmi)).")
                Text("Your ideal weight is: \(Int(idealWeight))kg.")
            }
        }
        
    }
}

func getCategory(bmi: Double) -> String {
    return if bmi < 18.5 {
        "Underweight"
    } else if bmi < 25 {
        "Normal"
    } else if bmi < 30 {
        "Overweight"
    } else {
        "Obese"
    }
}
#Preview {
    BMIResultView(bmi:22, idealWeight:70)
}
