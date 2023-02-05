//
//  EpisodesViewModel.swift
//  TheBigBangTheoryEpisodes
//
//  Created by Aitor Salgado on 24/1/23.
//

import SwiftUI

final class EpisodesViewModel: ObservableObject {
    let persistance = ModelPersistance()
    @Published var episodes:[BigBang]
    @Published var searchEpisodes = ""
    
    var filteredEpisodes: [BigBang] {
        if searchEpisodes.isEmpty {
            return episodes
        }
        else {
            return episodes.filter {
                $0.name.lowercased().contains(searchEpisodes.lowercased())
            }
        }
    }
    
    var episodesSeasonSection:[[BigBang]] {
        //Al realizar la ordenación del diccionaro, ya se devuelve automáticamente el tipo array de temporadas.
        //Array<[BigBang]>(Dictionary(grouping: episodes) { episode in
        //    episode.season
        //}.values)
        
        Dictionary(grouping: episodes) { episode in
            episode.season
        }.values.sorted { firstEpisodesGroup, secondEpisodesGroup in
            firstEpisodesGroup.first?.season ?? 0 < secondEpisodesGroup.first?.season ?? 0
        }
        .map { episodeMapped in
            episodeMapped.filter {
                if searchEpisodes.isEmpty {
                    return true
                }
                else {
                    return $0.name.lowercased().contains(searchEpisodes.lowercased())
                }
            }
        }
    }
    
    init () {
        self.episodes = persistance.loadEpisodes()
    }
    
    func updateEpisode(episode:BigBang)  {
        if let indexEpisodeUpdate = episodes.firstIndex(where: { $0.id == episode.id } ) {
            episodes[indexEpisodeUpdate] = episode
        }
    }
}
