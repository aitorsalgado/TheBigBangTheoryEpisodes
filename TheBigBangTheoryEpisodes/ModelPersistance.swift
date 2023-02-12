//
//  ModelPersistance.swift
//  TheBigBangTheoryEpisodes
//
//  Created by Aitor Salgado on 24/1/23.
//

import Foundation

final class ModelPersistance {
    func loadEpisodes() -> [BigBang] {
        guard let url = Bundle.main.url(forResource: "BigBang", withExtension: "json") else { return [] }
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([BigBang].self, from: data)
        } catch {
            print("Error load json data: \(error)")
            return []
        }
    }
    
    func saveEpisodes(episodes: [BigBang]) {
        let url = URL.documentsDirectory.appending(component: "espisodesBigBangData").appendingPathExtension("json")
        do {
            let encoder = JSONEncoder() 
            encoder.outputFormatting = .prettyPrinted
            let data = try encoder.encode(episodes)
            try data.write(to: url, options: [.atomic,.completeFileProtection])
        } catch {
            print("Error save json data: \(error)")
        }
    }
}
