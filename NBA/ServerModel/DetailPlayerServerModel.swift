//
//  DetailPlayerServerModel.swift
//  NBA
//
//  Created by Jose Alberto on 30/4/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailPlayerServerModel = try? newJSONDecoder().decode(DetailPlayerServerModel.self, from: jsonData)

import Foundation

// MARK: - DetailPlayerServerModel
struct DetailPlayerServerModel: Codable {
    let detailPlayerServerModelGet: String?
    let results: Int?
    let response: [ResultDetailPlayer]?

    enum CodingKeys: String, CodingKey {
        case detailPlayerServerModelGet
        case results
        case response
    }
}


// MARK: - Response
struct ResultDetailPlayer: Codable {
    let points: Int?
    let min: String?
    let fgm: Int?
    let fga: Int?
    let fgp: String?
    let ftm: Int?
    let fta: Int?
    let ftp: String?
    let tpm: Int?
    let tpa: Int?
    let tpp: String?
    let offReb: Int?
    let defReb: Int?
    let totReb: Int?
    let assists: Int?
    let pFouls: Int?
    let steals: Int?
    let turnovers: Int?
    let blocks: Int?
    let plusMinus: String?
    let comment: String?

    enum CodingKeys: String, CodingKey {
        case points
        case min
        case fgm
        case fga
        case fgp
        case ftm
        case fta
        case ftp
        case tpm
        case tpa
        case tpp
        case offReb
        case defReb
        case totReb
        case assists
        case pFouls
        case steals
        case turnovers
        case blocks
        case plusMinus
        case comment
    }
}
