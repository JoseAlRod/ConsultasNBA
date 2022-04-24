//
//  TeamsModelView.swift
//  NBA
//
//  Created by Jose Alberto on 17/4/22.
//

import Foundation

struct TeamsModelView: Identifiable {
    let id: Int?
    let name: String?
    let city: String?
    let logo: String?
    var players: [PlayersModelView]? = []
    
    var logoUrl: URL {
        return URL(string: self.logo ?? "")!
    }
}
