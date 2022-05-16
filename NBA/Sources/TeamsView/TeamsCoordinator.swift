//
//  TeamsCoordinator.swift
//  NBA
//
//  Created by Jose Alberto on 16/4/22.
//

import Foundation
import SwiftUI

final class TeamsCoordinator: BaseCoordinator {
    
    typealias ContentView = TeamsView
    typealias ViewModel = TeamsViewModel
    typealias Interactor = TeamsInteractor
    typealias Provider = TeamsProvider
    
    static func navigation() -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }
    
    static func view() -> ContentView {
        let vip  = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                               interactor: Interactor.self,
                                               provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
}
