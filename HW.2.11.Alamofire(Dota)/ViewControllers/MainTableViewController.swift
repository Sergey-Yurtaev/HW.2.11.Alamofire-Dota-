//
//  MainTableViewController.swift
//  HW.2.11.Alamofire(Dota)
//
//  Created by Sergey Yurtaev on 22.05.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    //MARK: Private properties
    private let urlHeroDota2 = "https://api.opendota.com/api/heroStats"
    private var heroes: [Hero] = []
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        setupNavigationBar()
        tableView.backgroundColor = .black
        tableView.rowHeight = 100
        tableView.separatorStyle = .none // убираем разделительную линию
        
        NetworkManagerAlamofire.shared.fetchData(from: urlHeroDota2) { [weak self] heroes in
            self?.heroes = heroes
            self?.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DotaTableViewCell
        cell.set(object: heroes[indexPath.row], andAdditionalAddress: "https://api.opendota.com")
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let hero = heroes[indexPath.row]
        let detailVC = segue.destination as! DetailsViewController
        detailVC.hero = hero
    }
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
        title = "Heroes - Dota 2"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Navigation bar appearance
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .black
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    deinit {
        print("MainTableViewController has been dealocated")
    }
}



