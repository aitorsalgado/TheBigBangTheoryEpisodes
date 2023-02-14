//
//  ModelDefinition.swift
//  TheBigBangTheoryEpisodes
//
//  Created by Aitor Salgado on 24/1/23.
//

import Foundation

struct BigBang: Codable, Identifiable, Hashable {
    let id: Int
    let url: URL
    let name: String
    let season, number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
    var episodeNotes: String?
    var episodeRating: Int?
}

extension BigBang {
    static let episodeTest = BigBang(id: 2961, url: URL(string: "https://www.tvmaze.com/episodes/2961/the-big-bang-theory-3x09-the-vengeance-formulation")!, name: "The Vengeance Formulation", season: 3, number: 9, airdate: "2009-11-23", runtime: 30, image: "12474", summary: "After he's humiliated on National Public Radio, Sheldon vows to destroy Kripke, while Wolowitz tries not to destroy his new relationship with Bernadette.\n")
}

struct FavoritesEpisodes: Codable {
    let favoritesIDs:[Int]
}
