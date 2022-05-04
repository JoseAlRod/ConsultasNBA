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
    let height: Height?
    let weight: Weight?
    let position: String?
    let jerseyNumber: String?
    let college: String?
    let birthDate: String?
    let birthCountry: String?
    let image: String?
    
    var imageUrl: URL {
        return URL(string: self.image ?? "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png")!
    }
    
    var fullPosition: String.LocalizationValue {
        switch(self.position) {
        case "C":
            return "C"
        case "C-F":
            return "C-F"
        case "F":
            return "F"
        case "F-C":
            return "F-C"
        case "F-G":
            return "F-G"
        case "G":
            return "G"
        case "G-F":
            return "G-F"
        default:
            return "unknown"
        }
    }
}
