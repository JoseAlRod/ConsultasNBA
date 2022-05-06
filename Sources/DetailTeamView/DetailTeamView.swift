import SwiftUI

struct DetailTeamView: View {
    
    @StateObject
    var viewModel = DetailTeamViewModel()
    
    @ObservedObject
    var seasonsController = SeasonsController()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.team?.players ?? []) { item in
                    NavigationLink {
                        DetailPlayerCoordinator.view(dto: DetailPlayerCoordinatorDTO(player: item, season: viewModel.selectedSeason, team: viewModel.team))
                    } label: {
                        PlayerOverviewCard(player: item)
                    }

                }
            }
            .listStyle(PlainListStyle())
            List {
                Picker("season", selection: $viewModel.selectedSeason) {
                    ForEach(seasonsController.seasons) { season in
                        Text("\(season.description)").tag(season)
                    }
                }
            }
        }
        .navigationTitle(Text(viewModel.team?.name ?? ""))
        .onAppear {
            self.viewModel.fetchData()
        }
    }
}

struct PlayerOverviewCard: View {
    
    @ObservedObject
    var imageLoader = ImageLoader()
    
    private var player: PlayersModelView
    
    init(player: PlayersModelView) {
        self.player = player
        self.imageLoader.loadImage(with: player.imageUrl)
    }
    
    var body: some View {
        HStack() {
            if imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image ?? UIImage(named: "player_placeholder.png")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 64, height: 64)
            }
            else {
                ProgressView()
            }
            Spacer()
            Text("\(self.player.firstName ?? "") \(self.player.lastName ?? "")")
        }
    }
    
}


struct DetailTeamView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTeamView()
    }
}

