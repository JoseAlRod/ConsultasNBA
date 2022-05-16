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
        case playersNba
    }
    
    // Webservice
    //Teams
    
    //Western
    static let endpointWesternTeams = "teams?conference=West"
    
    //Eastern
    static let endpointEasternTeams = "teams?conference=East"
    
    
    //Players
    static let endpointPlayersByTeamAndSeason = "players?team=%@&season=%@"
    static let endpointDetailPlayer = "/players/statistics?id=%@&team=%@&season=%@"
    
    //Games
    static let endpointGamesToday = "games?date=\(Utils.todayDate)"
    
    //Standings
    static let endpointStandingsWest = "standings?season=\(Utils.currentSeason.seasonYear)&conference=west&league=standard"
    
    static let endpointStandingsEast = "standings?season=\(Utils.currentSeason.seasonYear)&conference=east&league=standard"
    
    
    //NBA
    
    static let endpointPlayers = "data/10s/prod/v1/%@/players.json"
    
    
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
        case .playersNba:
            switch self.environmentDefault {
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return "http://data.nba.net/"
                
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
        case .playersNba:
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

class SeasonsController: ObservableObject {
    @Published var seasons: [Season] = []

    init() {
        seasons = Utils.seasons
    }
}

final class Utils {
    
    private static var currentSeasonYear: Int {
        return Calendar.current.component(.year, from: Date()) - 1
    }
    
    
    private static var numberOfSeasons: Int {
        return currentSeasonYear - 2015
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
    
    static let urlPlayerImage = "https://ak-static.cms.nba.com/wp-content/uploads/headshots/nba/latest/260x190/%@.png"
    
    static var todayDate: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    static func formattedMinutes(min: String) -> Double? {
        let aux = min.split(separator: ":")
        if aux.count == 2 {
            guard let minutesUnw = aux.first else {return nil}
            if let minutes = Double(minutesUnw) {
                if let seconds = Double(aux[1]) {
                    return (minutes + seconds/60)
                }
                else {
                    return nil
                }
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    static func formattedDate(date: String?, language: LanguageController.LanguageEnum) -> String? {
        guard let dateUnw = date else {return nil}
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let dateFormatterPrint = DateFormatter()
        switch(language) {
        case .spanish:
            dateFormatterPrint.dateFormat = "MMM dd,yyyy"
            dateFormatterPrint.dateFormat = "dd-MM-yyyy"
        case .english:
            dateFormatterPrint.dateFormat = "MM-dd-yyyy"
       
        }
        guard let dateObjectFormatted = dateFormatterGet.date(from: dateUnw) else {return nil}
        return dateFormatterPrint.string(from: dateObjectFormatted)
    }
    
    static func formattedDateTime(dateTime: String?, language: LanguageController.LanguageEnum) -> String? {
        guard let dateTimeUnw = dateTime else {return nil}
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let dateFormatterPrint = DateFormatter()
        switch(language) {
        case .spanish:
            dateFormatterGet.locale = .init(identifier: "es_ES")
            dateFormatterPrint.dateFormat = "dd MMMM yyyy HH:mm"
        case .english:
            dateFormatterGet.locale = .init(identifier: "en_EN")
            dateFormatterPrint.dateFormat = "MMMM dd yyyy HH:mm"
        }
        guard let dateTimeObjectFormatted = dateFormatterGet.date(from: dateTimeUnw) else {return nil}
        return dateFormatterPrint.string(from: dateTimeObjectFormatted)
    }
}

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
