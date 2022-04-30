import Foundation


//Input del interactor
protocol DetailPlayerInteractorInputProtocol: BaseInteractorInputProtocol {
   
}

//Output del provider
protocol DetailPlayerProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationDetailPlayer(completion: Result<[ResultDetailPlayer]?, NetworkError>)
}

final class DetailPlayerInteractor: BaseInteractor {
    
    weak var viewModel: DetailPlayerInteractorOutputProtocol? {
        super.baseViewModel as? DetailPlayerInteractorOutputProtocol
    }
    
    var provider: DetailPlayerProviderInputProtocol? {
        super.baseProvider as? DetailPlayerProviderInputProtocol
    }
    
    // Métodos de transformación de modelo de datos
    func transformDataResultToDetailPlayerModelView(data: [ResultDetailPlayer]?) -> [DetailPlayerModelView] {
        var dataSourcePlayersModelView: [DetailPlayerModelView] = []
        if let dataUnw = data {
            var pointsTotal: Double = 0.0
            var assistsTotal: Double = 0.0
            var reboundsTotal: Double = 0.0
            var stealsTotal: Double = 0.0
            var blocksTotal: Double = 0.0
            var minutesTotal: Double = 0.0
            var fieldGoalPercentageTotal: Double = 0.0
            var threePercentageTotal: Double = 0.0
            var plusMinusTotal: Double = 0.0
            var foulsTotal: Double = 0.0
            var turnoversTotal: Double = 0.0
            for game in dataUnw {
                pointsTotal = pointsTotal + Double(game.points ?? 0)
                assistsTotal = assistsTotal + Double(game.assists ?? 0)
                reboundsTotal = reboundsTotal + Double(game.totReb ?? 0)
                stealsTotal = stealsTotal + Double(game.steals ?? 0)
                blocksTotal = blocksTotal + Double(game.blocks ?? 0)
                minutesTotal = minutesTotal + Double(game.min ?? 0)
                pointsTotal = pointsTotal + Double(game.points ?? 0)
                pointsTotal = pointsTotal + Double(game.points ?? 0)
            }
        }
        return dataSourcePlayersModelView
    }
    
}


//Input del interactor
extension DetailPlayerInteractor: DetailPlayerInteractorInputProtocol {
    
}

//Output del provider
extension DetailPlayerInteractor: DetailPlayerProviderOutputProtocol {
    func setInformationDetailPlayer(completion: Result<[ResultDetailPlayer]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInformationDetailPlayerViewModel(data: self.transformDataResultToDetailPlayerModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
}

