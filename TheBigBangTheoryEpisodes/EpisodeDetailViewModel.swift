//
//  EpisodeDetailViewModel.swift
//  TheBigBangTheoryEpisodes
//
//  Created by Aitor Salgado on 30/1/23.
//

import SwiftUI

final class EpisodeDetailViewModel:ObservableObject {
    @Published var episodeNotes: String = ""
    @Published var episodeRating: Int = 0
    
    func initDetailEpisode(episode:BigBang) {
        episodeNotes = episode.episodeNotes ?? ""
        episodeRating = episode.episodeRating ?? 0 
    }
    
    func saveEpisode(episode:BigBang) -> BigBang {
        BigBang(id: episode.id, url: episode.url, name: episode.name, season: episode.season, number: episode.number, airdate: episode.airdate, runtime: episode.runtime, image: episode.image, summary: episode.summary, episodeNotes: episodeNotes, episodeRating: episodeRating)
    }
}
