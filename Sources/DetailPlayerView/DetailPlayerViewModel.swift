import Foundation

//Output del interactor
protocol DetailPlayerInteractorOutputProtocol: BaseInteractorOutputProtocol {
    
}

final class DetailPlayerViewModel: BaseViewModel, ObservableObject {
    
    // MARK: -Dependedecies injection
    var interactor: DetailPlayerInteractorInputProtocol? {
        super.baseInteractor as? DetailPlayerInteractorInputProtocol
    }
    
    // MARK: -Variables
    @Published
    var player: PlayersModelView?
    
    // MARK: -Métodos públicos para View
    
   
}

//Output del interactor
extension DetailPlayerViewModel: DetailPlayerInteractorOutputProtocol {
    
}
