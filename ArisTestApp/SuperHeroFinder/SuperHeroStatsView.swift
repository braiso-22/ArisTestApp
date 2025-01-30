//
//  SuperHeroStatsView.swift
//  ArisTestApp
//
//  Created by Brais Fernández Vázquez on 30/1/25.
//

import SwiftUI
import Charts

struct SuperHeroStatsView: View {
    @State var stats: HeroPowerstats?
    var body: some View {
        if let stats = stats {
            Chart {
                heroSector(name: "Combat", value: stats.combat)
                heroSector(name: "Durability", value: stats.durability)
                heroSector(name: "Intelligence", value: stats.intelligence)
                heroSector(name: "Power", value: stats.power)
                heroSector(name: "Speed", value: stats.speed)
                heroSector(name: "Strength", value: stats.strength)
            }
        } else {
            Text("No stats data")
        }
        
    }
    private func heroSector(name: String, value: Int) -> some ChartContent {
        SectorMark(angle: .value(name, value),innerRadius: .ratio(0.4), angularInset: 2)
            .foregroundStyle(by: .value("Category", name))
    }
}

#Preview {
    SuperHeroStatsView(
        stats: HeroPowerstats(intelligence: 0, strength: 2, speed: 5, durability: 1, power: 3, combat: 1)
    )
}
