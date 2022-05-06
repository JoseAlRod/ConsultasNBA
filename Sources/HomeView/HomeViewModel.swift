//
//  HomeViewModel.swift
//  NBA
//
//  Created by Jose Alberto on 16/4/22.
//


import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published
    var selectedTabItem: TabItemViewModel.TabItemType = .teams
    
    let tabItemViewModel = [
        TabItemViewModel(imageName: "team", title: String(localized: "teams"), type: .teams),
        TabItemViewModel(imageName: "game", title: String(localized: "games"), type: .games),
        TabItemViewModel(imageName: "standings", title: String(localized: "standings"), type: .standings)
    ]
}

struct TabItemViewModel: Hashable {
    let imageName: String
    let title: String
    let type: TabItemType
    
    enum TabItemType {
        case teams
        case games
        case standings
    }
}

