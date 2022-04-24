import SwiftUI

struct DetailTeamView: View {
    
    @StateObject
    var viewModel = DetailTeamViewModel()
    
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.team?.players ?? []) { item in
                    Text("\(item.firstName ?? "") \(item.lastName ?? "")")
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
                }
            }
        }
    }
}


struct DetailTeamView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTeamView()
    }
}

