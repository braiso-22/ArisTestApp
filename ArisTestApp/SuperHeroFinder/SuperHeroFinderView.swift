//
//  SuperHeroFinderView.swift
//  ArisTestApp
//
//  Created by Brais Fernández Vázquez on 26/1/25.
//

import SwiftUI

struct HeroItem: Identifiable {
    let id: String
    let name: String
    let imageUrl: String
    let powerstats: HeroPowerstats?
}

struct HeroPowerstats {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

struct SuperHeroFinderView: View {
    @State private var searchText = ""
    @State private var searchIsActive = false
    
    @State private var isLoading: Bool = false
    
    @State private var superHeroes: [HeroItem] = []
    
    var body: some View {
        NavigationStack{
            if(isLoading){
                ProgressView()
            }
            if(!isLoading && superHeroes.isEmpty){
                Text("Search for an existing super hero")
            }
            List(superHeroes){ hero in
                NavigationLink(destination: {
                    SuperHeroDetailView(url:hero.imageUrl,name: hero.name,powerStats:hero.powerstats)
                }){
                    Text(hero.name)
                }
            }
            .navigationTitle("Super hero finder")
            .searchable(
                text: $searchText,
                // this is a bug in swift ui
                placement: .navigationBarDrawer(displayMode: .always)
            )
            .onSubmit(of: .search, runSearch)
            
        }
    }
    
    func runSearch(){
        Task{
            do{
                isLoading = true
                let test = try await SuperHeroApi().getHeroesByQuery(query:searchText)
                superHeroes = test.results.map{ result in
                    result.toHeroItem()
                }
                isLoading = false
            } catch {
                isLoading = false
                print("error \(error)")
            }
        }
    }
}


#Preview {
    SuperHeroFinderView()
}
