//
//  SuperHeroApi.swift
//  ArisTestApp
//
//  Created by Brais Fernández Vázquez on 26/1/25.
//

import Foundation

class SuperHeroApi {
    func getHeroesByQuery(query: String) async throws -> Welcome{
        let urlString = "https://superheroapi.com/api/d28fc824f20e4f38a242ddedbeb80ae2/search/\(query)"
        let url = URL(string: urlString)!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let welcome = try JSONDecoder().decode(Welcome.self, from: data)
        return welcome
    }
}
