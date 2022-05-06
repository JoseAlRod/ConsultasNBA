import Foundation


//Input del interactor
protocol StandingsInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataStandingsWestInteractor()
     func fetchDataStandingsEastInteractor()
}

//Output del provider
protocol StandingsProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationStandingsWest(completion: Result<[ResultStandings]?, NetworkError>)
    func setInformationStandingsEast(completion: Result<[ResultStandings]?, NetworkError>)
}

final class StandingsInteractor: BaseInteractor {
    
    weak var viewModel: StandingsInteractorOutputProtocol? {
        super.baseViewModel as? StandingsInteractorOutputProtocol
    }
    
    var provider: StandingsProviderInputProtocol? {
        super.baseProvider as? StandingsProviderInputProtocol
    }
    
    // Métodos de transformación de modelo de datos
    
    func transformDataResultToStandingsModelView(data: [ResultStandings]?) -> [StandingsModelView] {
        var dataSourceStandingsModelView: [StandingsModelView] = []
        var sortedStandings: [ResultStandings]
        
        if let dataUnw = data {
            sortedStandings = sortStandingsByRank(standings: dataUnw)
            for item in sortedStandings {
                let object = StandingsModelView(id: item.team?.id,
                                                rank: item.conference?.rank?.description,
                                                teamCode: item.team?.code,
                                                teamLogo: item.team?.logo,
                                                wins: item.win?.total?.description,
                                                losses: item.loss?.total?.description,
                                                winningPercentage: item.win?.percentage,
                                                streak: item.streak?.description,
                                                winningStreak: item.winStreak)
                dataSourceStandingsModelView.append(object)
            }
        }
        return dataSourceStandingsModelView
    }
    
    
    func sortStandingsByRank(standings: [ResultStandings]) -> [ResultStandings] {
        return standings.sorted(by: {$0.conference?.rank ?? 0 < $1.conference?.rank ?? 0})
    }
    
}


//Input del interactor
extension StandingsInteractor: StandingsInteractorInputProtocol {
    func fetchDataStandingsWestInteractor() {
        self.provider?.fetchDataStandingsWestProvider()
    }
    
    func fetchDataStandingsEastInteractor() {
        self.provider?.fetchDataStandingsEastProvider()
    }
}

//Output del provider
extension StandingsInteractor: StandingsProviderOutputProtocol {
    func setInformationStandingsWest(completion: Result<[ResultStandings]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInformationStandingsWestViewModel(data: self.transformDataResultToStandingsModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationStandingsEast(completion: Result<[ResultStandings]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInformationStandingsEastViewModel(data: self.transformDataResultToStandingsModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
}

