//
//  HeroResultParser.swift
//  ArisTestApp
//
//  Created by Brais Fernández Vázquez on 30/1/25.
//

import Foundation

extension Result{
    func toHeroItem() -> HeroItem {
        return HeroItem(
            id: id,
            name: name,
            imageUrl: image.url,
            powerstats: powerstats.toUi()
        )
    }
}
