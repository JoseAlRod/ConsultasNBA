import SwiftUI

struct DetailTeamView: View {
    
    @StateObject
    var viewModel = DetailTeamViewModel()
    
    @ObservedObject
    var seasonsController = SeasonsController()
    
    @State
    var didAppear = false
    
    var body: some View {
        VStack {
            if !(viewModel.team?.players?.isEmpty ?? true) {
                List {
                    ForEach(viewModel.team?.players ?? []) { item in
                        NavigationLink() {
                            DetailPlayerCoordinator.view(dto: DetailPlayerCoordinatorDTO(player: item, season: viewModel.selectedSeason, team: viewModel.team))
                        } label: {
                            PlayerOverviewCard(player: item)
                        }

                    }
                }
                .listStyle(PlainListStyle())
            }
            else {
                List {
                    PlayerOverviewCard()
                    PlayerOverviewCard()
                    PlayerOverviewCard()
                    PlayerOverviewCard()
                    PlayerOverviewCard()
                    PlayerOverviewCard()
                    PlayerOverviewCard()
                    PlayerOverviewCard()
                    PlayerOverviewCard()
                    PlayerOverviewCard()
                }
                .listStyle(PlainListStyle())
                .redacted(reason: .placeholder)
            }
            List {
                Picker("season", selection: $viewModel.selectedSeason) {
                    ForEach(seasonsController.seasons) { season in
                        Text("\(season.description)").tag(season)
                    }
                }
                .onChange(of: viewModel.selectedSeason) { _ in
                    self.viewModel.fetchData()
                }
            }
        }
        .navigationTitle(Text(viewModel.team?.name ?? ""))
        .onAppear {
            if !self.didAppear {
                self.viewModel.fetchData()
            }
            self.didAppear = true
        }
    }
}

struct PlayerOverviewCard: View {
    
    @ObservedObject
    var imageLoader = ImageLoader()
    
    private var player: PlayersModelView?
    
    init(player: PlayersModelView? = nil) {
        guard let playerUnw = player else {return}
        self.player = playerUnw
        self.imageLoader.loadImage(with: playerUnw.imageUrl)
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
            Text("\(self.player?.firstName ?? "Player First Name") \(self.player?.lastName ?? "Player Last Name")")
        }
    }
    
}


struct DetailTeamView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTeamView()
    }
}

