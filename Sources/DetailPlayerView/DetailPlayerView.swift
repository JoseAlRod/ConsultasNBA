import SwiftUI

struct DetailPlayerView: View {
    
    @StateObject
    var viewModel = DetailPlayerViewModel()
    
    var body: some View {
        Text("\(viewModel.player?.firstName ?? "") \(viewModel.player?.lastName ?? "")")
    }
}


struct DetailPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPlayerView()
    }
}

