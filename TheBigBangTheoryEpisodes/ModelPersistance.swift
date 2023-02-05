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
            print("Error en la carga del json de datos: \(error)")
            return []
        }
    }
    
    func saveEpisodes(episodes: [BigBang]) {
        
    }
}
