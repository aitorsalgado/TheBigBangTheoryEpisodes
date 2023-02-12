//
//  ModelPersistance.swift
//  TheBigBangTheoryEpisodes
//
//  Created by Aitor Salgado on 24/1/23.
//

import Foundation

extension URL {
    static let episodesInitDataURL = Bundle.main.url(forResource: "BigBang", withExtension: "json")!
    static let episodesDocDataURL = URL.documentsDirectory.appending(component: "espisodesBigBangData").appendingPathExtension("json")
}

final class ModelPersistance {
    func loadEpisodes() -> [BigBang] {
        do {
            var urlDocData = URL.episodesDocDataURL
            if !FileManager.default.fileExists(atPath: urlDocData.path()) {
                urlDocData = URL.episodesInitDataURL
            }
            let data = try Data(contentsOf: urlDocData)
            return try JSONDecoder().decode([BigBang].self, from: data)
        } catch {
            print("Error load json data: \(error)")
            return []
        }
    }
    
    func saveEpisodes(episodes: [BigBang]) {
        let url = URL.episodesDocDataURL
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
