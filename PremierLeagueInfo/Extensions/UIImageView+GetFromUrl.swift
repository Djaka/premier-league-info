//
//  UIImageView+GetFromUrl.swift
//  PremierLeagueInfo
//
//  Created by Djaka Permana on 28/05/23.
//

import UIKit

extension UIImageView {
    
    func getImage(from url: String, contentMode mode: ContentMode = .scaleAspectFit, onLoading: @escaping ()->Void?, onSuccess: @escaping ()->Void?) {
        onLoading()
        guard let url = URL(string: url) else {
            return
        }
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else {
                return
            }
            
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
                onSuccess()
            }
        }.resume()
    }
}
