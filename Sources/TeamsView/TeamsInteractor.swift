//
//  TeamsInteractor.swift
//  NBA
//
//  Created by Jose Alberto on 16/4/22.
//

import Foundation

//Input del interactor
protocol TeamsInteractorInputProtocol: BaseInteractorInputProtocol {
   func fetchDataWesternTeamsInteractor()
    func fetchDataEasternTeamsInteractor()
}

//Output del provider
protocol TeamsProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationWesternTeams(completion: Result<[ResultTeams]?, NetworkError>)
    func setInformationEasternTeams(completion: Result<[ResultTeams]?, NetworkError>)
}

final class TeamsInteractor: BaseInteractor {
    
    weak var viewModel: TeamsInteractorOutputProtocol? {
        super.baseViewModel as? TeamsInteractorOutputProtocol
    }
    
    var provider: TeamsProviderInputProtocol? {
        super.baseProvider as? TeamsProviderInputProtocol
    }
    
    // Métodos de transformación de modelo de datos
    
    func filterNbaFranchises(data: [ResultTeams]?) -> [ResultTeams]? {
        return data?.filter{ team in return team.nbaFranchise ?? false && !(team.allStar ?? true)}
    }
        
    
    func transformDataResultToTeamsModelView(data: [ResultTeams]?) -> [TeamsModelView] {
        var dataSourceTeamsModelView: [TeamsModelView] = []
        let filteredData = self.filterNbaFranchises(data: data)
        if let filteredDataUnw = filteredData {
            for team in filteredDataUnw {
                let object = TeamsModelView(id: team.id,
                                            name: team.name,
                                            city: team.city,
                                            logo: team.logo)
                dataSourceTeamsModelView.append(object)
            }
        }
        return dataSourceTeamsModelView
    }
}


//Input del interactor
extension TeamsInteractor: TeamsInteractorInputProtocol {
    func fetchDataWesternTeamsInteractor() {
        self.provider?.fetchDataWesternTeamsProvider()
    }
    
    func fetchDataEasternTeamsInteractor() {
        self.provider?.fetchDataEasternTeamsProvider()
    }
}

//Output del provider
extension TeamsInteractor: TeamsProviderOutputProtocol {
    func setInformationWesternTeams(completion: Result<[ResultTeams]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInformationWesternTeamsViewModel(data: self.transformDataResultToTeamsModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationEasternTeams(completion: Result<[ResultTeams]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInformationEasternTeamsViewModel(data: self.transformDataResultToTeamsModelView(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
}
