//
//  LeagueTableViewCell.swift
//  PremierLeagueInfo
//
//  Created by Djaka Permana on 28/05/23.
//

import UIKit

class ClubTableViewCell: UITableViewCell {
    @IBOutlet weak var clubImage: UIImageView!
    @IBOutlet weak var clubLabel: UILabel!
    @IBOutlet weak var loadingImage: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(team: Team) {
        self.clubLabel.text = team.strTeam
        self.clubImage.getImage(from: team.strTeamBadge ?? "", onLoading: {[weak self] in
            self?.loadingImage.isHidden = false
        }, onSuccess: {[weak self] in
            self?.loadingImage.isHidden = true
        })
    }
}
