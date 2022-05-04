//
//  TeamsView.swift
//  NBA
//
//  Created by Jose Alberto on 16/4/22.
//

import SwiftUI

struct TeamsView: View {
    
    @StateObject
    var viewModel = TeamsViewModel()
    
    var body: some View {
        List {
            Section {
                ForEach(viewModel.dataSourceWesternTeams) { item in
                    NavigationLink {
                        DetailTeamCoordinator.view(dto: DetailTeamCoordinatorDTO(team: item))
                    } label: {
                        TeamCard(team: item)
                    }
                }
            } header: {
                Text("westernConference")
            }
            Section {
                ForEach(viewModel.dataSourceEasternTeams) { item in
                    NavigationLink {
                        DetailTeamCoordinator.view(dto: DetailTeamCoordinatorDTO(team: item))
                    } label: {
                        TeamCard(team: item)
                    }
                }
            } header: {
                Text("easternConference")
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text("teams"))
        .onAppear {
            self.viewModel.fetchData()
        }
    }
}

struct TeamCard: View {
    
    @ObservedObject
    var imageLoader = ImageLoader()
    
    private var team: TeamsModelView
    
    init(team: TeamsModelView) {
        self.team = team
        self.imageLoader.loadImage(with: team.logoUrl)
    }
    
    var body: some View {
        HStack(spacing: 4) {
            if self.imageLoader.image != nil {
                Image(uiImage: (self.imageLoader.image!))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                    
            }
            else {
               ProgressView()
                    
            }
            Text(self.team.name ?? "")
        }
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
