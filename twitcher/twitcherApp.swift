//
//  twitcherApp.swift
//  twitcher
//
//  Created by John Pill on 02/09/2022.
//

import SwiftUI

@main
struct twitcherApp: App {
    
    @StateObject var birdsVM = BirdsViewModel()
    
    var body: some Scene {
        WindowGroup {
            TwitcherView(viewModel: birdsVM)
        }
    }
}
