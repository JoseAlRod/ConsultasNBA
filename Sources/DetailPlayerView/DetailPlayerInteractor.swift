import Foundation


//Input del interactor
protocol DetailPlayerInteractorInputProtocol: BaseInteractorInputProtocol {
   
}

//Output del provider
protocol DetailPlayerProviderOutputProtocol: BaseProviderOutputProtocol {
    
}

final class DetailPlayerInteractor: BaseInteractor {
    
    weak var viewModel: DetailPlayerInteractorOutputProtocol? {
        super.baseViewModel as? DetailPlayerInteractorOutputProtocol
    }
    
    var provider: DetailPlayerProviderInputProtocol? {
        super.baseProvider as? DetailPlayerProviderInputProtocol
    }
    
    // Métodos de transformación de modelo de datos
    
}


//Input del interactor
extension DetailPlayerInteractor: DetailPlayerInteractorInputProtocol {
    
}

//Output del provider
extension DetailPlayerInteractor: DetailPlayerProviderOutputProtocol {
    
}

