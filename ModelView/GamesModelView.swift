//
//  GamesModelView.swift
//  NBA
//
//  Created by Jose Alberto on 27/4/22.
//

import Foundation

struct GamesModelView: Identifiable {
    let id: Int?
    let visitorTeam: TeamsModelView
    let homeTeam: TeamsModelView
    let arena: String?
    let status: String?
    let homeScore: String?
    let visitorScore: String?
    let dateTime: String?
    
}
