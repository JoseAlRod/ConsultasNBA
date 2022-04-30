//
//  PlayersModelView.swift
//  NBA
//
//  Created by Jose Alberto on 21/4/22.
//

import Foundation

struct PlayersModelView: Identifiable {
    let id: Int?
    let firstName: String?
    let lastName: String?
    let height: String?
    let weight: String?
    let image: String?
    
    var imageUrl: URL {
        return URL(string: self.image ?? "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png")!
    }
}
