//
//  ViewController.swift
//  PremierLeagueInfo
//
//  Created by Djaka Permana on 27/05/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var navbarTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    private var teams: [Team] = []
    
    private let url = URL(string: "https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        refreshData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ClubTableViewCell", bundle: nil), forCellReuseIdentifier: "ClubTableViewCell")
        tableView.separatorStyle = .none
    }
    
    private func getData(with url: URL, onSuccess: @escaping ()->Void?, onError: @escaping (String)->Void? ) {
        loading.isHidden = false
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                if let premierLeagues = try? JSONDecoder().decode(PremierLeagueModel.self, from: data) {
                    self.teams = premierLeagues.teams ?? []
                    DispatchQueue.main.async {
                        onSuccess()
                    }
                } else {
                    DispatchQueue.main.async {
                        onError("Invalid response")
                    }
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    onError("HTTP Request Failed \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
    
    private func refreshData() {
        getData(with: url, onSuccess: { [weak self] in
            self?.loading.isHidden = true
            self?.tableView.reloadData()
        }, onError: { [weak self] (error: String) in
            self?.loading.isHidden = true
            self?.showAlertError(message: error)
        })
    }
    
    private func showAlertError(message: String) {
        
        let refresh = UIAlertAction(title: "Refresh", style: .default) { (action) in
            self.refreshData()
        }
        
        let alert = UIAlertController(title: "Error message", message: message, preferredStyle: .alert)
        
        alert.addAction(refresh)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func refreshButtonAction(_ sender: Any) {
        refreshData()
    }
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
          withIdentifier: "ClubTableViewCell",for: indexPath) as? ClubTableViewCell {
            let team = teams[indexPath.row]
            cell.selectionStyle = .none
            cell.configureCell(team: team)
            return cell
        } else {
          return UITableViewCell()
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team = teams[indexPath.row]
        TeamParameter.shared.setTeamSelected(with: team)
        
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

