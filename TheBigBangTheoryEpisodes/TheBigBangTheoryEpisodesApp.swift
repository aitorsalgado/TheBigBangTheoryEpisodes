//
//  TheBigBangTheoryEpisodesApp.swift
//  TheBigBangTheoryEpisodes
//
//  Created by Aitor Salgado on 24/1/23.
//

import SwiftUI

@main
struct TheBigBangTheoryEpisodesApp: App {
    @StateObject var episodesVM = EpisodesViewModel()
    var body: some Scene {
        WindowGroup {
            EpisodesTabView()
                .environmentObject(episodesVM)
        }
    }
}
