//
//  StandingsModelView.swift
//  NBA
//
//  Created by Jose Alberto on 5/5/22.
//

import Foundation

struct StandingsModelView: Identifiable {
    let id: Int?
    let rank: String?
    let teamCode: String?
    let teamLogo: String?
    let wins: String?
    let losses: String?
    let winningPercentage: String?
    let streak: String?
    let winningStreak: Bool?
    
    
    var logoUrl: URL {
        return URL(string: self.teamLogo ?? "")!
    }
    
    var fullStreak: String? {
        guard let winningStreakUnw = self.winningStreak else {return nil}
        guard let streakUnw = self.streak else {return nil}
        return winningStreakUnw ? "\(streakUnw)\(String(localized: "winStreak"))" : "\(streakUnw)\(String(localized: "lossStreak"))"
    }
}
