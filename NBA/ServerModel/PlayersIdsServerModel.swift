// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let playersIdsServerModel = try? newJSONDecoder().decode(PlayersIdsServerModel.self, from: jsonData)

import Foundation

// MARK: - PlayersIdsServerModel
struct PlayersIdsServerModel: Codable {
    let league: League?

    enum CodingKeys: String, CodingKey {
        case league
    }
}

// MARK: - League
struct League: Codable {
    let standard: [Sacramento]?

    enum CodingKeys: String, CodingKey {
        case standard
    }
}

// MARK: - Sacramento
struct Sacramento: Codable {
    let firstName: String?
    let lastName: String?
    let temporaryDisplayName: String?
    let personId: String?
    let teamId: String?
    let jersey: String?
    let isActive: Bool?
    let pos: PosIds?
    let weightPounds: String?
    let weightKilograms: String?
    let dateOfBirthUTC: String?
    let nbaDebutYear: String?
    let yearsPro: String?
    let collegeName: String?
    let lastAffiliation: String?
    let country: String?
    let isallStar: Bool?

    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case temporaryDisplayName
        case personId
        case teamId
        case jersey
        case isActive
        case pos
        case weightPounds
        case weightKilograms
        case dateOfBirthUTC
        case nbaDebutYear
        case yearsPro
        case collegeName
        case lastAffiliation
        case country
        case isallStar
    }
}


enum PosIds: String, Codable {
    case c = "C"
    case cF = "C-F"
    case empty = ""
    case f = "F"
    case fC = "F-C"
    case fG = "F-G"
    case g = "G"
    case gF = "G-F"
    case gf = "GF"
    case pg = "PG"
}


enum PosFull: String, Codable {
    case center = "Center"
    case centerForward = "Center-Forward"
    case empty = ""
    case forward = "Forward"
    case forwardCenter = "Forward-Center"
    case forwardGuard = "Forward-Guard"
    case guardForward = "Guard-Forward"
    case posFullGuard = "Guard"
}

