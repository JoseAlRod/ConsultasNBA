// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let playersIdsServerModel = try? newJSONDecoder().decode(PlayersIdsServerModel.self, from: jsonData)

import Foundation

// MARK: - PlayersIdsServerModel
struct PlayersIdsServerModel: Codable {
    let playersIdsServerModelInternal: Internal?
    let league: League?

    enum CodingKeys: String, CodingKey {
        case playersIdsServerModelInternal
        case league
    }
}

// MARK: - League
struct League: Codable {
    let standard: [Sacramento]?
    let sacramento: [Sacramento]?
    let vegas: [Sacramento]?
    let utah: [Sacramento]?

    enum CodingKeys: String, CodingKey {
        case standard
        case sacramento
        case vegas
        case utah
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
    let heightFeet: String?
    let heightInches: String?
    let heightMeters: HeightMeters?
    let weightPounds: String?
    let weightKilograms: String?
    let dateOfBirthUTC: String?
    let teamSitesOnly: TeamSitesOnly?
    let teams: [Team]?
    let draft: Draft?
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
        case heightFeet
        case heightInches
        case heightMeters
        case weightPounds
        case weightKilograms
        case dateOfBirthUTC
        case teamSitesOnly
        case teams
        case draft
        case nbaDebutYear
        case yearsPro
        case collegeName
        case lastAffiliation
        case country
        case isallStar
    }
}

// MARK: - Draft
struct Draft: Codable {
    let teamId: String?
    let pickNum: String?
    let roundNum: String?
    let seasonYear: String?

    enum CodingKeys: String, CodingKey {
        case teamId
        case pickNum
        case roundNum
        case seasonYear
    }
}

enum HeightMeters: String, Codable {
    case empty = ""
    case the102 = "1.02"
    case the175 = "1.75"
    case the178 = "1.78"
    case the18 = "1.8"
    case the183 = "1.83"
    case the185 = "1.85"
    case the188 = "1.88"
    case the19 = "1.9"
    case the193 = "1.93"
    case the196 = "1.96"
    case the198 = "1.98"
    case the201 = "2.01"
    case the203 = "2.03"
    case the206 = "2.06"
    case the208 = "2.08"
    case the211 = "2.11"
    case the213 = "2.13"
    case the216 = "2.16"
    case the218 = "2.18"
    case the221 = "2.21"
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
}

// MARK: - TeamSitesOnly
struct TeamSitesOnly: Codable {
    let playerCode: String?
    let posFull: PosFull?
    let displayAffiliation: String?
    let freeAgentCode: String?

    enum CodingKeys: String, CodingKey {
        case playerCode
        case posFull
        case displayAffiliation
        case freeAgentCode
    }
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

// MARK: - Team
struct Team: Codable {
    let teamId: String?
    let seasonStart: String?
    let seasonEnd: String?

    enum CodingKeys: String, CodingKey {
        case teamId
        case seasonStart
        case seasonEnd
    }
}

// MARK: - Internal
struct Internal: Codable {
    let pubDateTime: String?
    let igorPath: String?
    let xslt: String?
    let xsltForceRecompile: String?
    let xsltInCache: String?
    let xsltCompileTimeMillis: String?
    let xsltTransformTimeMillis: String?
    let consolidatedDomKey: String?
    let endToEndTimeMillis: String?

    enum CodingKeys: String, CodingKey {
        case pubDateTime
        case igorPath
        case xslt
        case xsltForceRecompile
        case xsltInCache
        case xsltCompileTimeMillis
        case xsltTransformTimeMillis
        case consolidatedDomKey
        case endToEndTimeMillis
    }
}
