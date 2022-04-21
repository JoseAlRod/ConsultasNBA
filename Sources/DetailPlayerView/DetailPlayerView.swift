import SwiftUI

struct DetailPlayerView: View {
    
    @StateObject
    var viewModel = DetailPlayerViewModel()
    
    var body: some View {
        Text("Hello world")
    }
}


struct DetailPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPlayerView()
    }
}

