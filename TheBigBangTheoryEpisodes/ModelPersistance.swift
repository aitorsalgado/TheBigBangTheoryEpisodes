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
    static let episodesFavIdsDocURL = URL.documentsDirectory.appending(component: "espisodesFavoritesBigBangData").appendingPathExtension("json")
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
    
    func loadFavorites() -> FavoritesEpisodes? {
        do {
            var urlFavData = URL.episodesFavIdsDocURL
            let data = try Data(contentsOf: urlFavData)
            return try JSONDecoder().decode(FavoritesEpisodes.self, from: data)
        } catch {
            print("Error loading Favorites from JSON data: \(error)")
            return nil
        }
    }
    
    func saveFavorites(favorites:FavoritesEpisodes) {
        let urlSaveFavorites = URL.episodesFavIdsDocURL
        do {
            let dataSave = try JSONEncoder().encode(favorites)
            try dataSave.write(to: urlSaveFavorites, options: [.atomic,.completeFileProtection])
        } catch {
            print("Error save JSON favorites data: \(error)")
        }
    }
}
