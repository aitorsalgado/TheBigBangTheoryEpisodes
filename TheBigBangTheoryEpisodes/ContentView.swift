//
//  ContentView.swift
//  TheBigBangTheoryEpisodes
//
//  Created by Aitor Salgado on 24/1/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var episodesVM:EpisodesViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(episodesVM.episodesSeasonSection, id: \.self) { episodesPerSeason in
                    Section {
                        ForEach(episodesPerSeason) { episode in
                                NavigationLink(value: episode) {
                                    EpisodeCell(episode: episode)
                                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                            Button {
                                                episodesVM.toggleFavorite(idEpisode: episode.id)
                                            } label: {
                                                if episodesVM.isFavoriteEpisode(idEpisode: episode.id) {
                                                    Label("Delete Favorite", systemImage: "star")
                                                } else {
                                                    Label("Add Favorite", systemImage: "star.fill")
                                                }
                                            }
                                            .tint(episodesVM.isFavoriteEpisode(idEpisode: episode.id) ? .red : .yellow)
                                        }
                                }
                        }
                    } header: {
                        //TODO: if our search doesn't find seasons, it returns 0.
                        HStack {
                            Text("Season: \(episodesPerSeason.first?.season ?? 0)")
                                .font(.headline)
                            Spacer()
                            Image("season\(episodesPerSeason.first?.season ?? 0)")
                                .cornerRadius(20)
                        }
                        .padding()
                    }
                }
            }
            .listStyle(.grouped)
            .navigationDestination(for: BigBang.self) { episode in
                EpisodeDetailView(episode: episode)
                
            }
            .navigationTitle("Episodes")
            .searchable(text: $episodesVM.searchEpisodes)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EpisodesViewModel())
    }
}


