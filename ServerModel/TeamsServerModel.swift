//
//  TeamsServerModel.swift
//  NBA
//
//  Created by Jose Alberto on 17/4/22.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let teamsServerModel = try? newJSONDecoder().decode(TeamsServerModel.self, from: jsonData)

import Foundation

// MARK: - TeamsServerModel
struct TeamsServerModel: Codable {
    let teamsServerModelGet: String?
    let results: Int?
    let response: [ResultTeams]?

    enum CodingKeys: String, CodingKey {
        case teamsServerModelGet
        case results
        case response
    }
}


// MARK: - Result
struct ResultTeams: Codable, Identifiable {
    let id: Int?
    let name: String?
    let nickname: String?
    let code: String?
    let city: String?
    let logo: String?
    let allStar: Bool?
    let nbaFranchise: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case nickname
        case code
        case city
        case logo
        case allStar
        case nbaFranchise
    }
}
