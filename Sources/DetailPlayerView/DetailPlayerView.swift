import SwiftUI

struct DetailPlayerView: View {
    
    @StateObject
    var viewModel = DetailPlayerViewModel()
    
    
    var body: some View {
        VStack(alignment: .leading) {
            if self.viewModel.player != nil && viewModel.detailPlayer != nil {
                DetailPlayerCard(player: viewModel.player!, detailPlayer: self.viewModel.detailPlayer!)
            }
        }
        .onAppear {
            self.viewModel.fetchData()
        }
    }
}

struct DetailPlayerCard: View {
    
    var player: PlayersModelView
    var detailPlayer: DetailPlayerModelView
    
    @ObservedObject
    var imageLoader = ImageLoader()
    
    
    init(player : PlayersModelView, detailPlayer: DetailPlayerModelView) {
        self.player = player
        self.detailPlayer = detailPlayer
        self.imageLoader.loadImage(with: player.imageUrl)
    }
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            if imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
            }
            ZStack {
                Image("jersey")
                Text(player.jerseyNumber ?? "")
            }
            Section {
                HStack {
                    Text("\(player.firstName ?? "") \(player.lastName ?? "")")
                }
                switch(Locale.current.languageCode) {
                case "es":
                    Text("height \(player.height?.meters ?? String(localized: "unknown"))")
                    Text("weight \(player.weight?.kilograms ?? String(localized: "unknown"))")
                    Text("birthDate \(Utils.formattedDate(date: player.birthDate, languageCode: "es") ?? String(localized: "unknown"))")
                default:
                    Text("height \(player.height?.feets ?? String(localized: "unknown"))")
                    Text("weight \(player.weight?.pounds ?? String(localized: "unknown"))")
                    Text("birthDate \(Utils.formattedDate(date: player.birthDate, languageCode: "en") ?? String(localized: "unknown"))")
                }
                HStack {
                    Text("position \(String(localized: player.fullPosition))")
                }
               
                
                Text("college \(player.college ?? String(localized: "unknown"))")
                Text("birthCountry \(player.birthCountry ?? String(localized: "unknown"))")
            } header: {
                Text("about")
                    .font(.title)
                    .padding()
            }
            Divider().padding()
            Section {
                Text("ppg \(detailPlayer.points ?? "0")")
                Text("apg \(detailPlayer.assists ?? "0")")
                Text("rpg \(detailPlayer.rebounds ?? "0")")
                Text("fgp \(detailPlayer.fieldGoalPercentage ?? "0")")
                Text("tpp \(detailPlayer.threePercentage ?? "0")")
                Text("bpg \(detailPlayer.blocks ?? "0")")
                Text("spg \(detailPlayer.steals ?? "0")")
                Text("fpg \(detailPlayer.fouls ?? "0")")
                Text("tpg \(detailPlayer.turnovers ?? "0")")
                Text("mpg \(detailPlayer.minutes ?? "0")")
                
            } header: {
                Text("stats")
                    .font(.title)
                    .padding()
            }
        }
        
    }
}


struct DetailPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPlayerView()
    }
}

