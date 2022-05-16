import SwiftUI

struct StandingsView: View {
    
    @StateObject
    var viewModel = StandingsViewModel()
    
    var body: some View {
        VStack() {
            ScrollView {
                Section {
                    ScrollView([.horizontal], showsIndicators: false) {
                        ScrollViewReader {
                            proxy in
                            HeaderView()
                                .id(0)
                                .padding()
                            Divider()
                            ForEach(self.viewModel.dataSourceStandingsWestModelView ?? []) { item in
                                TeamStandingsRow(standing: item)
                                    .padding()
                                Divider()
                            }
                            .onAppear {
                                proxy.scrollTo(0, anchor: .topLeading)
                            }
                        }
                    }
                    
                } header: {
                    Text("westernConference")
                        .font(.title)
                        .fontWeight(.bold)
                }
    
                Section {
                    ScrollView([.horizontal], showsIndicators: false) {
                        ScrollViewReader { proxy in
                            HeaderView()
                                .id(0)
                                .padding()
                            Divider()
                            ForEach(self.viewModel.dataSourceStandingsEastModelView ?? []) { item in
                                TeamStandingsRow(standing: item)
                                    .padding()
                                Divider()
                            }
                            .onAppear {
                                proxy.scrollTo(0, anchor: .topLeading)
                            }
                        }
                    }
                } header: {
                    Text("easternConference")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
            
        }
        .onAppear {
            self.viewModel.fetchData()
        }
    }
}

struct HeaderView: View {
    
    var headerAttributes = [String(localized: "rank"), String(localized: "team"), String(localized: "logo"), String(localized: "wins"), String(localized: "losses"), String(localized: "winningPercentage"), String(localized: "streak")]
    
    var body: some View {
        LazyHStack() {
            ForEach(headerAttributes, id: \.self) { value in

                HeaderCell(tag: value)
                
            }
        }
    }
}

struct TeamStandingsRow: View {
    
    @ObservedObject
    var imageLoader = ImageLoader()
    
    var standing: StandingsModelView
    
    init(standing: StandingsModelView) {
        self.standing = standing
        self.imageLoader.loadImage(with: standing.logoUrl)
    }
    
    var body: some View {
        GeometryReader { metrics in
            HStack() {
                Text(standing.rank ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(standing.teamCode ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32, alignment: .leading)
                }
                else {
                    ProgressView()
                }
                Text(standing.wins ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(standing.losses ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(standing.winningPercentage ?? "")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text(standing.fullStreak ?? "")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}

struct HeaderCell: View {
    
    var tag: String
    
    var body: some View {
        Text(tag)
    }
}


struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsView()
    }
}

