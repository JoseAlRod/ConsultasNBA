//
//  TeamsViewModel.swift
//  NBA
//
//  Created by Jose Alberto on 16/4/22.
//

import Foundation

//Output del interactor
protocol TeamsInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInformationWesternTeamsViewModel(data: [TeamsModelView]?)
    func setInformationEasternTeamsViewModel(data: [TeamsModelView]?)
}

final class TeamsViewModel: BaseViewModel, ObservableObject {
    
    // MARK: -Dependedecies injection
    var interactor: TeamsInteractorInputProtocol? {
        super.baseInteractor as? TeamsInteractorInputProtocol
    }
    
    // MARK: -Variables
    @Published
    var dataSourceWesternTeams: [TeamsModelView] = []
    
    @Published
    var dataSourceEasternTeams: [TeamsModelView] = []
   
    
    // MARK: -Métodos públicos para View
    func fetchData() {
        self.interactor?.fetchDataWesternTeamsInteractor()
        self.interactor?.fetchDataEasternTeamsInteractor()
    }
   
}

//Output del interactor
extension TeamsViewModel: TeamsInteractorOutputProtocol {
    func setInformationWesternTeamsViewModel(data: [TeamsModelView]?) {
        self.dataSourceWesternTeams.removeAll()
        self.dataSourceWesternTeams = data ?? []
    }
    
    func setInformationEasternTeamsViewModel(data: [TeamsModelView]?) {
        self.dataSourceEasternTeams.removeAll()
        self.dataSourceEasternTeams = data ?? []
    }
}
