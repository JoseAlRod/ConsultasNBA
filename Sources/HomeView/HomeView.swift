//
//  HomeView.swift
//  NBA
//
//  Created by Jose Alberto on 16/4/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject
    private var viewModel = HomeViewModel()
    
    var body: some View {
        TabView(selection: self.$viewModel.selectedTabItem) {
            ForEach(self.viewModel.tabItemViewModel, id: \.self) { item in
                tabItem(tabItemType: item.type)
                    .tabItem {
                        Image(item.imageName)
                        Text(item.title)
                    }
                    .tag(item.type)
            }
        }
        .accentColor(.orange)
        .environment(\.colorScheme, .light)
    }
    
    @ViewBuilder
    func tabItem(tabItemType: TabItemViewModel.TabItemType) -> some View {
        switch tabItemType {
        case .teams:
            TeamsCoordinator.navigation()
        case .games:
            GamesCoordinator.navigation()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
