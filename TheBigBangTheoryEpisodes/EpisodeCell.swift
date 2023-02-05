//
//  EpisodeCell.swift
//  TheBigBangTheoryEpisodes
//
//  Created by Aitor Salgado on 27/1/23.
//

import SwiftUI

struct EpisodeCell: View {
    let episode: BigBang
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(episode.name)
                    .font(.headline)
                Text("Season: \(episode.season) Episode: \(episode.number)")
                    .font(.subheadline)
                HStack {
                    Text("\(episode.runtime)m")
                    Text(episode.airdate)
                }
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(.top)
            }
            Spacer()
            Image(episode.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .cornerRadius(10)
        }
    }
}

struct EpisodeCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EpisodeCell(episode: .episodeTest)
                .previewLayout(.fixed(width: 390, height: 100))
            EpisodeCell(episode: .episodeTest)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 390, height: 100))
        }
    }
}
