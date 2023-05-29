//
//  ProfileViewController.swift
//  PremierLeagueInfo
//
//  Created by Djaka Permana on 28/05/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var currentJobLabel: UILabel!
    @IBOutlet weak var descriptionAbout: UILabel!
    @IBOutlet weak var imageLoading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let data = loadJson(filename: "About"), let image = data.authorImage, let author = data.author, let currentJob = data.currentJob, let description = data.description {
            
            profileImage.getImage(from: image, onLoading: {[weak self] in
                self?.imageLoading.isHidden = false
            }, onSuccess: {[weak self] in
                self?.imageLoading.isHidden = true
            })
            
            
            nameLabel.text = author
            currentJobLabel.text = currentJob
            descriptionAbout.text = description
        }
        
        configureImage()
        
        
    }

    private func loadJson(filename fileName: String) -> About? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                return jsonData.about
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    private func configureImage() {
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.black.cgColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        
    }
    
}
