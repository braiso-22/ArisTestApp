//
//  PowerStatsParser.swift
//  ArisTestApp
//
//  Created by Brais Fernández Vázquez on 30/1/25.
//

import Foundation

func nullStringToInt(_ string: String?) -> Int {
    return Int(string ?? "0") ?? 0
}

extension Powerstats {
    func toUi() -> HeroPowerstats? {
        let intelligence = nullStringToInt(intelligence)
        let strength = nullStringToInt(strength)
        let speed = nullStringToInt(speed)
        let durability = nullStringToInt(durability)
        let power = nullStringToInt(power)
        let combat = nullStringToInt(combat)
        
        // If all values are 0, return nil
        if intelligence == 0 && strength == 0 && speed == 0 &&
           durability == 0 && power == 0 && combat == 0 {
            return nil
        }
        
        return HeroPowerstats(
            intelligence: intelligence,
            strength: strength,
            speed: speed,
            durability: durability,
            power: power,
            combat: combat
        )
    }
}
