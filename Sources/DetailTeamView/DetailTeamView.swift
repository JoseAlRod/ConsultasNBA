import SwiftUI

struct DetailTeamView: View {
    
    @StateObject
    var viewModel = DetailTeamViewModel()
    
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.team?.players ?? []) { item in
                    NavigationLink {
                        DetailPlayerCoordinator.view(dto: DetailPlayerCoordinatorDTO.init(
                            player: item,
                            season: viewModel.selectedSeason,
                            team: viewModel.team))
                    } label: {
                        PlayerOverviewCard(player: item)
                    }

                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(Text(viewModel.team?.name ?? ""))
            .onAppear {
                self.viewModel.fetchData()
            }
            List {
                Picker("Season", selection: $viewModel.selectedSeason) {
                    ForEach(Utils.seasons) { season in
                        Text("\(season.description)").tag(season)
                    }
                }
                .onChange(of: viewModel.selectedSeason) { season in
                    viewModel.selectedSeason = season
                    self.viewModel.fetchData()
                }
            }
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
            Image(uiImage: self.imageLoader.image ?? UIImage(named: "player_placeholder.png")!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 64, height: 64)
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

