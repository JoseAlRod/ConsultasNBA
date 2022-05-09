//
//  RegionLanguageController.swift
//  NBA
//
//  Created by Jose Alberto on 9/5/22.
//

import Foundation

struct RegionController {
    let region: RegionEnum?
    let description: String?
    
    init?() {
        guard let regionUnw = Locale.preferredLanguages.first else { return nil }
        switch(regionUnw) {
        case "en-US":
            self.region = RegionEnum.us
            self.description = "United States"
        case "en-GB":
            self.region = RegionEnum.uk
            self.description = "United Kingdom"
        default:
            self.region = nil
            self.description = nil
        }
    }
    
    enum RegionEnum {
        case us
        case uk
    }
}

struct LanguageController {
    let language: LanguageEnum?
    let description: String?
    
    
    init() {
        switch(Locale.current.languageCode) {
        case "en":
            self.language = LanguageEnum.english
            self.description = "English"
        case "es":
            self.language = LanguageEnum.spanish
            self.description = "Spanish"
        default:
            self.language = nil
            self.description = nil
        }
    }
    
    enum LanguageEnum {
        case spanish
        case english
    }
}


