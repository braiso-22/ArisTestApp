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
                NavigationLink(destination: Text("Destination")) {
                    Text("BMI calculator")
                }
            }.navigationBarTitle("Test collection")
        }
    }
}

#Preview {
    ContentView()
}
