import Foundation

//Output del interactor
protocol DetailPlayerInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInformationDetailPlayerViewModel(data: DetailPlayerModelView?)
}

final class DetailPlayerViewModel: BaseViewModel, ObservableObject {
    
    // MARK: -Dependedecies injection
    var interactor: DetailPlayerInteractorInputProtocol? {
        super.baseInteractor as? DetailPlayerInteractorInputProtocol
    }
    
    // MARK: -Variables
    @Published
    var player: PlayersModelView?
    
    @Published
    var detailPlayer: DetailPlayerModelView?
    
    // MARK: -Métodos públicos para View
    func fetchData() {
        self.interactor?.fetchDataDetailPlayerInteractor()
    }
   
}

//Output del interactor
extension DetailPlayerViewModel: DetailPlayerInteractorOutputProtocol {
    func setInformationDetailPlayerViewModel(data: DetailPlayerModelView?) {
        self.detailPlayer = nil
        self.detailPlayer = data
    }
}
