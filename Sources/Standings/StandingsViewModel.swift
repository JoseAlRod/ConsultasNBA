import Foundation

//Output del interactor
protocol StandingsInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInformationStandingsWestViewModel(data: [StandingsModelView]?)
    func setInformationStandingsEastViewModel(data: [StandingsModelView]?)
}

final class StandingsViewModel: BaseViewModel, ObservableObject {
    
    // MARK: -Dependedecies injection
    var interactor: StandingsInteractorInputProtocol? {
        super.baseInteractor as? StandingsInteractorInputProtocol
    }
    
    // MARK: -Variables
    
    @Published
    var dataSourceStandingsWestModelView: [StandingsModelView]? = []
    
    @Published
    var dataSourceStandingsEastModelView: [StandingsModelView]? = []
   
    
    // MARK: -Métodos públicos para View
    func fetchData() {
        self.interactor?.fetchDataStandingsWestInteractor()
        self.interactor?.fetchDataStandingsEastInteractor()
    }
   
}

//Output del interactor
extension StandingsViewModel: StandingsInteractorOutputProtocol {
    func setInformationStandingsWestViewModel(data: [StandingsModelView]?) {
        self.dataSourceStandingsWestModelView?.removeAll()
        self.dataSourceStandingsWestModelView = data ?? []
    }
    
    func setInformationStandingsEastViewModel(data: [StandingsModelView]?) {
        self.dataSourceStandingsEastModelView?.removeAll()
        self.dataSourceStandingsEastModelView = data ?? []
    }
}
