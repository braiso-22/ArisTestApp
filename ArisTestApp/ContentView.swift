//
//  ContentView.swift
//  ArisTestApp
//
//  Created by Brais Fernández Vázquez on 25/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: BMIView()) {
                    Text("BMI calculator")
                }
                NavigationLink(destination: SuperHeroFinderView()) {
                    Text("Super hero finder")
                }
                NavigationLink(destination: Maps()){
                    Text("Maps")
                }
            }.navigationBarTitle("Test collection")
        }
    }
}

#Preview {
    ContentView()
}
