//
//  GlobalParameter.swift
//  PremierLeagueInfo
//
//  Created by Djaka Permana on 29/05/23.
//

import Foundation

class TeamParameter {
    
    static let shared = TeamParameter()
    
    private var team: Team? = nil
    
    func setTeamSelected(with team: Team) {
        self.team = team
    }
    
    func getTeamSelected() -> Team? {
        return self.team
    }
}
