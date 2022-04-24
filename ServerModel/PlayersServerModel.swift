//
//  PlayersServerModel.swift
//  NBA
//
//  Created by Jose Alberto on 24/4/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let playersServerModel = try? newJSONDecoder().decode(PlayersServerModel.self, from: jsonData)

import Foundation

// MARK: - PlayersServerModel
struct PlayersServerModel: Codable {
    let playersServerModelGet: String?
    let results: Int?
    let response: [ResultPlayers]?

    enum CodingKeys: String, CodingKey {
        case playersServerModelGet
        case results
        case response
    }
}


// MARK: - Response
struct ResultPlayers: Codable {
    let id: Int?
    let firstname: String?
    let lastname: String?
    let birth: Birth?
    let nba: Nba?
    let height: Height?
    let weight: Weight?
    let college: String?
    let affiliation: String?
    let leagues: Leagues?

    enum CodingKeys: String, CodingKey {
        case id
        case firstname
        case lastname
        case birth
        case nba
        case height
        case weight
        case college
        case affiliation
        case leagues
    }
}

// MARK: - Birth
struct Birth: Codable {
    let date: String?
    let country: Country?

    enum CodingKeys: String, CodingKey {
        case date
        case country
    }
}

enum Country: String, Codable {
    case france = "France"
    case southSudan = "South Sudan"
    case usa = "USA"
}

// MARK: - Height
struct Height: Codable {
    let feets: String?
    let inches: String?
    let meters: String?

    enum CodingKeys: String, CodingKey {
        case feets
        case inches
        case meters
    }
}

// MARK: - Leagues
struct Leagues: Codable {
    let standard: Standard?

    enum CodingKeys: String, CodingKey {
        case standard
    }
}

// MARK: - Sacramento
struct Standard: Codable {
    let jersey: Int?
    let active: Bool?
    let pos: Pos?

    enum CodingKeys: String, CodingKey {
        case jersey
        case active
        case pos
    }
}

enum Pos: String, Codable {
    case c = "C"
    case cF = "C-F"
    case f = "F"
    case fC = "F-C"
    case fG = "F-G"
    case g = "G"
    case gF = "G-F"
}

// MARK: - Nba
struct Nba: Codable {
    let start: Int?
    let pro: Int?

    enum CodingKeys: String, CodingKey {
        case start
        case pro
    }
}

// MARK: - Weight
struct Weight: Codable {
    let pounds: String?
    let kilograms: String?

    enum CodingKeys: String, CodingKey {
        case pounds
        case kilograms
    }
}
