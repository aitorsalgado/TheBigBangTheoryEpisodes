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
        TabView {
            NavigationStack {
                List {
                    ForEach(episodesVM.episodesSeasonSection, id: \.self) { episodesPerSeason in
                        Section {
                            ForEach(episodesPerSeason) { episode in
                                    NavigationLink(value: episode) {
                                        EpisodeCell(episode: episode)
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
            .tabItem {
                Label("Episodes", systemImage: "list.and.film")
            }
            Text("Favorites View")
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EpisodesViewModel())
    }
}


