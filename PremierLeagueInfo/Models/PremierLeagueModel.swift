//
// PremierLeagueModel.swift
// PremierLeagueInfo
//
// Created by Djaka Permana on 28/05/23.
//

import Foundation

struct PremierLeagueModel: Codable {
    var teams : [Team]? = []

    enum CodingKeys: String, CodingKey {
        case teams = "teams"
    }
}

struct Team: Codable {
    var idTeam: String? = nil
    var idSoccerXML: String? = nil
    var idAPIfootball: String? = nil
    var intLoved: String? = nil
    var strTeam: String? = nil
    var strTeamShort: String? = nil
    var strAlternate: String? = nil
    var intFormedYear: String? = nil
    var strSport: String? = nil
    var strLeague: String? = nil
    var idLeague: String? = nil
    var strLeague2: String? = nil
    var idLeague2: String? = nil
    var strLeague3: String? = nil
    var idLeague3: String? = nil
    var strLeague4: String? = nil
    var idLeague4: String? = nil
    var strLeague5: String? = nil
    var idLeague5: String? = nil
    var strLeague6: String? = nil
    var idLeague6: String? = nil
    var strLeague7: String? = nil
    var idLeague7: String? = nil
    var strDivision: String? = nil
    var strStadium: String? = nil
    var strKeywords: String? = nil
    var strRSS: String? = nil
    var strStadiumThumb: String? = nil
    var strStadiumDescription: String? = nil
    var strStadiumLocation: String? = nil
    var intStadiumCapacity: String? = nil
    var strWebsite: String? = nil
    var strFacebook: String? = nil
    var strTwitter: String? = nil
    var strInstagram: String? = nil
    var strDescriptionEN: String? = nil
    var strDescriptionDE: String? = nil
    var strDescriptionFR: String? = nil
    var strDescriptionCN: String? = nil
    var strDescriptionIT: String? = nil
    var strDescriptionJP: String? = nil
    var strDescriptionRU: String? = nil
    var strDescriptionES: String? = nil
    var strDescriptionPT: String? = nil
    var strDescriptionSE: String? = nil
    var strDescriptionNL: String? = nil
    var strDescriptionHU: String? = nil
    var strDescriptionNO: String? = nil
    var strDescriptionIL: String? = nil
    var strDescriptionPL: String? = nil
    var strKitColour1: String? = nil
    var strKitColour2: String? = nil
    var strKitColour3: String? = nil
    var strGender: String? = nil
    var strCountry: String? = nil
    var strTeamBadge: String? = nil
    var strTeamJersey: String? = nil
    var strTeamLogo: String? = nil
    var strTeamFanart1: String? = nil
    var strTeamFanart2: String? = nil
    var strTeamFanart3: String? = nil
    var strTeamFanart4: String? = nil
    var strTeamBanner: String? = nil
    var strYoutube: String? = nil
    var strLocked: String? = nil

    enum CodingKeys: String, CodingKey {
        case idTeam = "idTeam"
        case idSoccerXML = "idSoccerXML"
        case idAPIfootball = "idAPIfootball"
        case intLoved = "intLoved"
        case strTeam = "strTeam"
        case strTeamShort = "strTeamShort"
        case strAlternate = "strAlternate"
        case intFormedYear = "intFormedYear"
        case strSport = "strSport"
        case strLeague = "strLeague"
        case idLeague = "idLeague"
        case strLeague2 = "strLeague2"
        case idLeague2 = "idLeague2"
        case strLeague3 = "strLeague3"
        case idLeague3 = "idLeague3"
        case strLeague4 = "strLeague4"
        case idLeague4 = "idLeague4"
        case strLeague5 = "strLeague5"
        case idLeague5 = "idLeague5"
        case strLeague6 = "strLeague6"
        case idLeague6 = "idLeague6"
        case strLeague7 = "strLeague7"
        case idLeague7 = "idLeague7"
        case strDivision = "strDivision"
        case strStadium = "strStadium"
        case strKeywords = "strKeywords"
        case strRSS = "strRSS"
        case strStadiumThumb = "strStadiumThumb"
        case strStadiumDescription = "strStadiumDescription"
        case strStadiumLocation = "strStadiumLocation"
        case intStadiumCapacity = "intStadiumCapacity"
        case strWebsite = "strWebsite"
        case strFacebook = "strFacebook"
        case strTwitter = "strTwitter"
        case strInstagram = "strInstagram"
        case strDescriptionEN = "strDescriptionEN"
        case strDescriptionDE = "strDescriptionDE"
        case strDescriptionFR = "strDescriptionFR"
        case strDescriptionCN = "strDescriptionCN"
        case strDescriptionIT = "strDescriptionIT"
        case strDescriptionJP = "strDescriptionJP"
        case strDescriptionRU = "strDescriptionRU"
        case strDescriptionES = "strDescriptionES"
        case strDescriptionPT = "strDescriptionPT"
        case strDescriptionSE = "strDescriptionSE"
        case strDescriptionNL = "strDescriptionNL"
        case strDescriptionHU = "strDescriptionHU"
        case strDescriptionNO = "strDescriptionNO"
        case strDescriptionIL = "strDescriptionIL"
        case strDescriptionPL = "strDescriptionPL"
        case strKitColour1 = "strKitColour1"
        case strKitColour2 = "strKitColour2"
        case strKitColour3 = "strKitColour3"
        case strGender = "strGender"
        case strCountry = "strCountry"
        case strTeamBadge = "strTeamBadge"
        case strTeamJersey = "strTeamJersey"
        case strTeamLogo = "strTeamLogo"
        case strTeamFanart1 = "strTeamFanart1"
        case strTeamFanart2 = "strTeamFanart2"
        case strTeamFanart3 = "strTeamFanart3"
        case strTeamFanart4 = "strTeamFanart4"
        case strTeamBanner = "strTeamBanner"
        case strYoutube = "strYoutube"
        case strLocked = "strLocked"
    }
}
