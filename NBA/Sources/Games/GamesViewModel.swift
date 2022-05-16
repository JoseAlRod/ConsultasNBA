import Foundation

//Output del interactor
protocol GamesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInformationGamesViewModel(data: [GamesModelView]?)
}

final class GamesViewModel: BaseViewModel, ObservableObject {
    
    // MARK: -Dependedecies injection
    var interactor: GamesInteractorInputProtocol? {
        super.baseInteractor as? GamesInteractorInputProtocol
    }
    
    // MARK: -Variables
    @Published
    var dataSourceGamesModelView: [GamesModelView]? = []
   
    
    // MARK: -Métodos públicos para View
    func fetchData() {
        self.interactor?.fetchDataGamesInteractor()
    }
   
}

//Output del interactor
extension GamesViewModel: GamesInteractorOutputProtocol {
    func setInformationGamesViewModel(data: [GamesModelView]?) {
        self.dataSourceGamesModelView?.removeAll()
        self.dataSourceGamesModelView = data
    }
}
