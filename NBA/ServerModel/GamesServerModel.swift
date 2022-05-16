//
//  GamesServerModel.swift
//  NBA
//
//  Created by Jose Alberto on 27/4/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gamesServerModel = try? newJSONDecoder().decode(GamesServerModel.self, from: jsonData)

import Foundation

// MARK: - GamesServerModel
struct GamesServerModel: Codable {
    let gamesServerModelGet: String?
    let results: Int?
    let response: [ResultGames]?

    enum CodingKeys: String, CodingKey {
        case gamesServerModelGet
        case results
        case response
    }
}

// MARK: - Response
struct ResultGames: Codable {
    let id: Int?
    let league: String?
    let season: Int?
    let date: DateClass?
    let stage: Int?
    let status: Status?
    let periods: Periods?
    let arena: Arena?
    let teams: Teams?
    let scores: Scores?
    let officials: [String]?
    let timesTied: Int?
    let leadChanges: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case league
        case season
        case date
        case stage
        case status
        case periods
        case arena
        case teams
        case scores
        case officials
        case timesTied
        case leadChanges
    }
}

// MARK: - Arena
struct Arena: Codable {
    let name: String?
    let city: String?
    let state: String?
    let country: String?

    enum CodingKeys: String, CodingKey {
        case name
        case city
        case state
        case country
    }
}

// MARK: - DateClass
struct DateClass: Codable {
    let start: String?
    let end: String?
    let duration: String?

    enum CodingKeys: String, CodingKey {
        case start
        case end
        case duration
    }
}

// MARK: - Periods
struct Periods: Codable {
    let current: Int?
    let total: Int?
    let endOfPeriod: Bool?

    enum CodingKeys: String, CodingKey {
        case current
        case total
        case endOfPeriod
    }
}

// MARK: - Scores
struct Scores: Codable {
    let visitors: ScoresHome?
    let home: ScoresHome?

    enum CodingKeys: String, CodingKey {
        case visitors
        case home
    }
}

// MARK: - ScoresHome
struct ScoresHome: Codable {
    let win: Int?
    let loss: Int?
    let series: Series?
    let linescore: [String]?
    let points: Int?

    enum CodingKeys: String, CodingKey {
        case win
        case loss
        case series
        case linescore
        case points
    }
}

// MARK: - Series
struct Series: Codable {
    let win: Int?
    let loss: Int?

    enum CodingKeys: String, CodingKey {
        case win
        case loss
    }
}

// MARK: - Status
struct Status: Codable {
    let halftime: Bool?
    let short: Int?
    let long: String?

    enum CodingKeys: String, CodingKey {
        case halftime
        case short
        case long
    }
}

// MARK: - Teams
struct Teams: Codable {
    let visitors: TeamsHome?
    let home: TeamsHome?

    enum CodingKeys: String, CodingKey {
        case visitors
        case home
    }
}

// MARK: - TeamsHome
struct TeamsHome: Codable {
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
