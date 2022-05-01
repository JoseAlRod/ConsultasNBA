import Foundation


//Input del interactor
protocol DetailPlayerInteractorInputProtocol: BaseInteractorInputProtocol {
   func fetchDataDetailPlayerInteractor()
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
    func transformDataResultToDetailPlayerModelView(data: [ResultDetailPlayer]?) -> DetailPlayerModelView? {
        var dataSourceDetailPlayerModelView: DetailPlayerModelView?
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
                minutesTotal = minutesTotal + (Utils.formattedMinutes(min: game.min ?? "") ?? 0.0)
                fieldGoalPercentageTotal = fieldGoalPercentageTotal + (Double(game.fgp ?? "") ?? 0.0)
                threePercentageTotal = threePercentageTotal + (Double(game.tpp ?? "") ?? 0.0)
                plusMinusTotal = plusMinusTotal + (Double(game.plusMinus ?? "") ?? 0.0)
                foulsTotal = foulsTotal + Double(game.pFouls ?? 0)
                turnoversTotal = turnoversTotal + Double(game.turnovers ?? 0)
            }
            let totalGames = Double(dataUnw.count)
            
            let pointsAvg = String(format: "%.2f", pointsTotal/totalGames)
            let assistsAvg = String(format: "%.2f", assistsTotal/totalGames)
            let reboundsAvg = String(format: "%.2f", reboundsTotal/totalGames)
            let stealsAvg = String(format: "%.2f", stealsTotal/totalGames)
            let blocksAvg = String(format: "%.2f", blocksTotal/totalGames)
            let minutesAvg = String(format: "%.2f", minutesTotal/totalGames)
            let fieldGoalPercentageAvg = String(format: "%.2f", fieldGoalPercentageTotal/totalGames)
            let threePercentageAvg = String(format: "%.2f", threePercentageTotal/totalGames)
            let plusMinusAvg = String(format: "%.2f", plusMinusTotal/totalGames)
            let foulsAvg = String(format: "%.2f", foulsTotal/totalGames)
            let turnoversAvg = String(format: "%.2f", turnoversTotal/totalGames)
            
            dataSourceDetailPlayerModelView = DetailPlayerModelView(points: pointsAvg,
                                                                    rebounds: reboundsAvg,
                                                                    assists: assistsAvg,
                                                                    steals: stealsAvg,
                                                                    blocks: blocksAvg,
                                                                    minutes: minutesAvg,
                                                                    fieldGoalPercentage: fieldGoalPercentageAvg,
                                                                    threePercentage: threePercentageAvg,
                                                                    plusMinus: plusMinusAvg,
                                                                    fouls: foulsAvg,
                                                                    turnovers: turnoversAvg)
            
        }
        return dataSourceDetailPlayerModelView
    }
    
}


//Input del interactor
extension DetailPlayerInteractor: DetailPlayerInteractorInputProtocol {
    func fetchDataDetailPlayerInteractor() {
        self.provider?.fetchDataDetailPlayerProvider()
    }
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

