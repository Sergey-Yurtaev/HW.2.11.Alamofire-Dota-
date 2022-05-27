//
//  DetailsViewController.swift
//  HW.2.11.Alamofire(Dota)
//
//  Created by Sergey Yurtaev on 22.05.2022.
//

import UIKit
import Alamofire

class DetailsViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var fullImageView: ImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rolesLabel: UILabel!
    @IBOutlet weak var specialityLabel: UILabel!
    @IBOutlet weak var attackTypeLabel: UILabel!
    @IBOutlet weak var attackRangeLabel: UILabel!
    @IBOutlet weak var movaSpeedLabel: UILabel!
    
    // MARK: - Public properties
    var hero: Hero!
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Hero information"
        setLabel()
        setImage()
    }
    
    // MARK: - Private Methods
    
    func setLabel() {
        nameLabel.text = hero.localizedName
        rolesLabel.text = "Roles: \(hero.roles?.joined(separator: ", ") ?? "No info")"
        specialityLabel.text = "Speciality: \(hero.primaryAttr ?? "No info")"
        attackTypeLabel.text = "Attack type: \(hero.attackType ?? "No info")"
        attackRangeLabel.text = "Attack range: \(hero.attackRange ?? 0)"
        movaSpeedLabel.text = "Move speed: \(hero.moveSpeed ?? 0)"
    }
    
    func setImage() {
        fullImageView.fetchImage(from: "https://api.opendota.com" + (hero.img ?? ""))
        fullImageView.layer.cornerRadius = fullImageView.bounds.width / 2
    }
}
