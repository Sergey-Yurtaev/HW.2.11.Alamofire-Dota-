//
//  DotaTableViewCell.swift
//  HW.2.11.Alamofire(Dota)
//
//  Created by Sergey Yurtaev on 22.05.2022.
//

import UIKit

class DotaTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var heroImage: UIImageView!{
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() { // добавляет интервал между ячейками
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
        contentView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
//    override func prepareForReuse() { // отключение переиспользования ячеек
//        super.prepareForReuse()
//        self.accessoryType = .none
//    }
    
    // MARK: - Public methods
    func set(object: Hero, andAdditionalAddress urlStart: String) {
        
        nameLabel.text = "Name: \(object.localizedName ?? "no info")"
        descriptionLabel.text = "Roles: \(object.roles?.joined(separator: ", ") ?? "no info")"
        heroImage.image = UIImage(named: "logo")

        DispatchQueue.main.async {
            if let imageData = ImageManager.shared.fetchImage(from: urlStart + (object.img ?? "")) {
                self.heroImage.image = UIImage(data: imageData)
            }
        }
    }

}
