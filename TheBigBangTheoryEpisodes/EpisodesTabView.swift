//
//  EpisodesTabView.swift
//  TheBigBangTheoryEpisodes
//
//  Created by Aitor Salgado on 14/2/23.
//

import SwiftUI

struct EpisodesTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Episodes", systemImage: "list.and.film")
                }
            EpisodesFavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

struct EpisodesTabView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesTabView()
            .environmentObject(EpisodesViewModel())
    }
}
