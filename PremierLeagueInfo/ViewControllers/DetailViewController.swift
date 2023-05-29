//
//  DetailViewController.swift
//  PremierLeagueInfo
//
//  Created by Djaka Permana on 28/05/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var teamBannerImage: UIImageView!
    @IBOutlet weak var teamTitleLabel: UILabel!
    @IBOutlet weak var teamDetailLabel: UILabel!
    @IBOutlet weak var socialFacebookButton: UIButton!
    @IBOutlet weak var socialTwitterButton: UIButton!
    @IBOutlet weak var socialInstagramButton: UIButton!
    @IBOutlet weak var loadingImage: UIActivityIndicatorView!
    
    private let teamSelected = TeamParameter.shared.getTeamSelected()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.backgroundColor = UIColor(hex: "#401152")
        navigationController?.navigationBar.tintColor = UIColor(hex: "#FFFFFF")
        
        teamBannerImage.getImage(from: teamSelected?.strTeamFanart1 ?? "", onLoading: {[weak self] in
            self?.loadingImage.isHidden = false
        }, onSuccess: {[weak self] in
            self?.loadingImage.isHidden = true
        })
        teamBannerImage.contentMode = .scaleAspectFill
        
        teamTitleLabel.text = teamSelected?.strAlternate
        teamDetailLabel.text = teamSelected?.strDescriptionEN
        
        configureButtonFacebook()
        configureButtonTwitter()
        configureButtonInstagram()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func configureButtonFacebook() {
        if let facebookUrl = teamSelected?.strFacebook {
            socialFacebookButton.setTitle(facebookUrl, for: .normal)
            socialFacebookButton.addTarget(self, action: #selector(actionOpenUrl(_:)), for: .touchUpInside)
        } else {
            socialFacebookButton.isHidden = true
        }
    }
    
    func configureButtonTwitter() {
        if let twitterUrl = teamSelected?.strTwitter {
            socialTwitterButton.setTitle(twitterUrl, for: .normal)
            socialTwitterButton.addTarget(self, action: #selector(actionOpenUrl(_:)), for: .touchUpInside)
        } else {
            socialTwitterButton.isHidden = true
        }
    }
    
    func configureButtonInstagram() {
        if let instagramUrl = teamSelected?.strInstagram {
            socialInstagramButton .setTitle(instagramUrl, for: .normal)
            socialInstagramButton.addTarget(self, action: #selector(actionOpenUrl(_:)), for: .touchUpInside)
        } else {
            socialInstagramButton.isHidden = true
        }
    }
    
    @objc func actionOpenUrl(_ sender: UIButton) {
        guard let urlSocialMedia = sender.titleLabel?.text else { return }
        if let url = URL(string: "https://"+urlSocialMedia), UIApplication.shared.canOpenURL(url) {
          UIApplication.shared.open(url)
        }
    }
}


