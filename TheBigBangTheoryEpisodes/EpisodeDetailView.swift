//
//  EpisodeDetailView.swift
//  TheBigBangTheoryEpisodes
//
//  Created by Aitor Salgado on 27/1/23.
//

import SwiftUI

struct EpisodeDetailView: View {
    @EnvironmentObject var episodesVM:EpisodesViewModel
    @ObservedObject var episodeDetailVM = EpisodeDetailViewModel()
    @Environment (\.dismiss) var dismiss
    
    let episode:BigBang
    private let maxRating = 5
    
    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading) {
                    Image(episode.image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                    HStack {
                        Text("\(episode.number): \(episode.name)")
                            .font(.headline)
                    }
                    Spacer()
                    HStack() {
                        Text("\(episode.runtime) MIN")
                            .font(.subheadline)
                        Text("\(episode.airdate) MIN")
                            .font(.subheadline)
                    }
                    Text(episode.summary)
                        .font(.caption)
                }
            } header: {
                Text("Episode Data")
            }
            Section {
                VStack(alignment: .leading) {
                    Text("Episode notes")
                        .font(.headline)
                    TextField("Write some notes for this episode", text: $episodeDetailVM.episodeNotes, axis: .vertical)
                        //.textFieldStyle(.roundedBorder)
                        .lineLimit(3)
                    VStack(alignment: .leading) {
                        Text("Episode rating")
                            .font(.headline)
                            .padding(2)
                        HStack(alignment: .center) {
                            ForEach(1..<maxRating + 1, id: \.self) { starImageIndex in
                                typeOfStarImage(starImageIndex: starImageIndex)
                                    .foregroundColor(.yellow)
                                    .onTapGesture {
                                        if (starImageIndex == 1 && episodeDetailVM.episodeRating == 1) {
                                            episodeDetailVM.episodeRating = 0
                                        } else {
                                            episodeDetailVM.episodeRating = starImageIndex
                                        }
                                    }
                            }
                            Text("\(episodeDetailVM.episodeRating) / \(maxRating)")
                        }
                    }
                }
            } header: {
                Text("My own data")
            }
        }
        .navigationTitle(episode.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    episodesVM.updateEpisode(episode: episodeDetailVM.saveEpisode(episode: episode))
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
        .onAppear {
            episodeDetailVM.initDetailEpisode(episode: episode)
        }
    }
    
    private func typeOfStarImage(starImageIndex: Int) -> some View {
        starImageIndex <= episodeDetailVM.episodeRating ? Image(systemName: "star.fill") : Image(systemName: "star")
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EpisodeDetailView(episode: .episodeTest)
                .environmentObject(EpisodesViewModel())
        }
    }
}
