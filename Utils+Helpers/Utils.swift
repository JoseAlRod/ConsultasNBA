//
//  Utils.swift
//  NBA
//
//  Created by Jose Alberto on 16/4/22.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    case options = "OPTIONS"
}

enum TargetEnvironment: Int {
    case DEV = 0
    case PRE = 1
    case PRO = 3
}

struct RequestDTO {
    var params: [String: AnyObject]?
    var arrayParams: [[String: AnyObject]]?
    var method: HTTPMethods
    var endpoint: String
    var urlContext: URLEnpoint.BaseUrlContext
    
    init(params: [String: AnyObject]?, method: HTTPMethods, endpoint: String, urlContext: URLEnpoint.BaseUrlContext) {
        self.params = params
        self.method = method
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
    
    init(arrayParams: [[String: AnyObject]]?, method: HTTPMethods, endpoint: String, urlContext: URLEnpoint.BaseUrlContext) {
        self.arrayParams = arrayParams
        self.method = method
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
}

struct URLEnpoint {
    
    #if DEV
    static let environmentDefault: TargetEnvironment = TargetEnvironment.DEV
    #elseif PRE
    static let environmentDefault: TargetEnvironment = TargetEnvironment.PRE
    #else
    static let environmentDefault: TargetEnvironment = TargetEnvironment.PRO
    #endif
    
    enum BaseUrlContext {
        case backend
        case webService
        case heroku
    }

    
    //Teams
    
    //Western
    static let endpointWesternTeams = "teams?conference=West"
    
    //Eastern
    static let endpointEasternTeams = "teams?conference=East"
    
    
    //Players
    static let endpointPlayersByTeamAndSeason = "players?team=%@&season=%@"
    
}


extension URLEnpoint {
    static func getUrlBase(urlContext: BaseUrlContext) -> String {
        switch urlContext {
            case .backend:
                switch self.environmentDefault {
                    case .DEV:
                        return ""
                    case .PRE:
                        return ""
                    case .PRO:
                        return ""
                }
            case .webService:
                switch self.environmentDefault {
                    case .DEV:
                        return ""
                    case .PRE:
                        return ""
                    case .PRO:
                        return "https://api-nba-v1.p.rapidapi.com/"
                }
            case .heroku:
                switch self.environmentDefault {
                    case .DEV:
                        return ""
                    case .PRE:
                        return ""
                    case .PRO:
                        return ""
            }
        }
    }
    
    static func getHttpHeaders(urlContext: BaseUrlContext) -> [String:String] {
        switch urlContext {
            case .backend:
                switch self.environmentDefault {
                    case .DEV:
                    return ["":""]
                    case .PRE:
                    return ["":""]
                    case .PRO:
                        return ["":""]
                }
            case .webService:
                switch self.environmentDefault {
                    case .DEV:
                        return ["":""]
                    case .PRE:
                        return ["":""]
                    case .PRO:
                        return ["X-RapidAPI-Host":"api-nba-v1.p.rapidapi.com",
                                "X-RapidAPI-Key": "\(Obfuscator().reveal(key: Constants.Api.apiKey))"]
                }
            case .heroku:
                switch self.environmentDefault {
                    case .DEV:
                        return ["":""]
                    case .PRE:
                        return ["":""]
                    case .PRO:
                        return ["":""]
            }
        }
    }
}

struct Season: Identifiable, Hashable {
    var seasonYear: Int
    var description: String
    var id: Int {seasonYear}
    
    init(seasonYear: Int, description: String) {
        self.seasonYear = seasonYear
        self.description = description
    }
}

final class Utils {
    
    private static var currentSeasonYear: Int {
        return Calendar.current.component(.year, from: Date()) - 1
    }

    
    private static var numberOfSeasons: Int {
        return currentSeasonYear - 2012
    }
    
    static var currentSeason: Season {
        return Season(seasonYear: currentSeasonYear, description: "\(currentSeasonYear.description)/\(currentSeasonYear + 1)")
    }
    
    static var seasons: [Season] {
        var seasons: [Season] = []
        for i in 0...numberOfSeasons {
            let season = Season(seasonYear: currentSeasonYear - i, description: "\((currentSeasonYear - i).description)/\(currentSeasonYear - i + 1)")
            seasons.append(season)
        }
        return seasons
    }
}
