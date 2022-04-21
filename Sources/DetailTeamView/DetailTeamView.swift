import SwiftUI

struct DetailTeamView: View {
    
    @StateObject
    var viewModel = DetailTeamViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.team?.players ?? []) { item in
                Text("gsg")
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text(viewModel.team?.name ?? ""))
    }
}


struct DetailTeamView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTeamView()
    }
}

