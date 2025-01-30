//
//  SuperHeroDetail.swift
//  ArisTestApp
//
//  Created by Brais Fernández Vázquez on 29/1/25.
//

import SwiftUI

struct SuperHeroDetailView: View {
    
    @State var url: String
    @State var name: String
    @State var powerStats:HeroPowerstats?
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .failure:
                Text("Couldn't load image")
            case .success(let image):
                image.resizable()
            default:
                ProgressView()
            }
        }
        .frame(width: 256, height: 256)
        .clipShape(.rect(cornerRadius: 25))
        Text(name)
        SuperHeroStatsView(stats: powerStats).frame(width: 256, height: 256)
    }
}

#Preview {
    SuperHeroDetailView(url:"https://picsum.photos/200",name: "random", powerStats: HeroPowerstats(intelligence: 10, strength: 1, speed: 1, durability: 1, power: 1, combat: 1))
}
