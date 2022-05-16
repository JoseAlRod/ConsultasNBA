//
//  StandingsServerModel.swift
//  NBA
//
//  Created by Jose Alberto on 5/5/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let standingsServerModel = try? newJSONDecoder().decode(StandingsServerModel.self, from: jsonData)

import Foundation

// MARK: - StandingsServerModel
struct StandingsServerModel: Codable {
    let response: [ResultStandings]?

    enum CodingKeys: String, CodingKey {
        case response
    }
}

enum ConferenceEnumEast: String, Codable {
    case atlantic = "atlantic"
    case central = "central"
    case east = "east"
    case southeast = "southeast"
}

enum ConferenceEnumWest: String, Codable {
    case northwest = "northwest"
    case pacific = "pacific"
    case southwest = "southwest"
    case west = "west"
}



// MARK: - Response
struct ResultStandings: Codable {
    let season: Int?
    let team: TeamStandings?
    let conference: ConferenceClass?
    let win: GameResult?
    let loss: GameResult?
    let gamesBehind: String?
    let streak: Int?
    let winStreak: Bool?

    enum CodingKeys: String, CodingKey {
        case season
        case team
        case conference
        case win
        case loss
        case gamesBehind
        case streak
        case winStreak
    }
}

// MARK: - ConferenceClass
struct ConferenceClass: Codable {
    let nameE: ConferenceEnumEast?
    let nameW: ConferenceEnumWest?
    let rank: Int?
    let win: Int?
    let loss: Int?
    let gamesBehind: String?

    enum CodingKeys: String, CodingKey {
        case nameE
        case nameW
        case rank
        case win
        case loss
        case gamesBehind
    }
}


// MARK: - GameResult
struct GameResult: Codable {
    let home: Int?
    let away: Int?
    let total: Int?
    let percentage: String?
    let lastTen: Int?

    enum CodingKeys: String, CodingKey {
        case home
        case away
        case total
        case percentage
        case lastTen
    }
}

// MARK: - Team
struct TeamStandings: Codable {
    let id: Int?
    let name: String?
    let nickname: String?
    let code: String?
    let logo: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case nickname
        case code
        case logo
    }
}

