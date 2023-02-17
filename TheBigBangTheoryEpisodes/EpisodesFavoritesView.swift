//
//  EpisodesFavoritesView.swift
//  TheBigBangTheoryEpisodes
//
//  Created by Aitor Salgado on 14/2/23.
//

import SwiftUI

struct EpisodesFavoritesView: View {
    @EnvironmentObject var episodesVM:EpisodesViewModel
    let favoriteColumns:[GridItem] = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        if episodesVM.favoritesEpisodes.favoritesIDs.isEmpty {
            Text("Add favorites from episodes list \nby right swapping in each episode.")
                .multilineTextAlignment(.center)
                .bold()
        }
        else {
            ScrollView {
                LazyVGrid(columns: favoriteColumns) {
                    ForEach(episodesVM.favoritesEpisodes.favoritesIDs, id:\.self) { favorite in
                        if let episode = episodesVM.episodeById(episodeId: favorite) {
                            Image(decorative: episode.image)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct EpisodesFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesFavoritesView()
            .environmentObject(EpisodesViewModel())
    }
}
