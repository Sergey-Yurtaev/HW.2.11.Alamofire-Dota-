//
//  DotaTableViewCell.swift
//  HW.2.11.Alamofire(Dota)
//
//  Created by Sergey Yurtaev on 22.05.2022.
//

import UIKit

class DotaTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var heroImage: ImageView!{
        didSet {
            heroImage.contentMode = .scaleAspectFill
            heroImage.clipsToBounds = true
            heroImage.layer.cornerRadius = heroImage.bounds.width / 2
            heroImage.backgroundColor = .black
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Override methods
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = bounds.height / 2 - 10
        selectionStyle = .none
    }
    override func layoutSubviews() { // добавляет интервал между ячейками
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
        contentView.backgroundColor = #colorLiteral(red: 0.1157014468, green: 0.1229005504, blue: 0.1775156992, alpha: 0.8708246971)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public methods
    func set(object: Hero, andAdditionalAddress urlStart: String) {
        
        nameLabel.text = "Name: \(object.localizedName ?? "no info")"
        descriptionLabel.text = "Roles: \(object.roles?.joined(separator: ", ") ?? "no info")"
        heroImage.image = UIImage(named: "black")
        heroImage.fetchImage(from: urlStart + (object.img ?? ""))
    }
}
