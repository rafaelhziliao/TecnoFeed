//
//  CardCell.swift
//  TecnoFeed
//
//  Created by Rafael Zilião on 12/09/17.
//  Copyright © 2017 Feed. All rights reserved.
//

import UIKit
import YYWebImage

class CardCell: UITableViewCell {
    @IBOutlet weak var profileHeadImage: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var energyLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(card:Card) {
        let compString = "\(card.profile.name) \n\nMeta: \(card.profile.generalGoal)"
        let colorString = "\(card.profile.generalGoal)"
        let range = (compString as NSString).range(of: colorString)
        let color = UIColor.init(red: 255.0/255.0, green: 151.0/255.0, blue: 0.0/255.0, alpha: 1.0) //laranja
        
        let attributedText = NSMutableAttributedString.init(string: compString)
        attributedText.addAttribute(NSForegroundColorAttributeName, value: color , range: range)

        
        self.profileNameLabel.attributedText = attributedText
        
        card.profile.imageUrl.isEmpty ? self.profileHeadImage.image = #imageLiteral(resourceName: "no-image") : self.profileHeadImage.yy_setImage(with: URL(string: card.profile.imageUrl), options: .setImageWithFadeAnimation)
        
        self.mealLabel.text = card.meal
        self.energyLabel.text = "\(String(card.energy))Kcal"
        self.cardImageView.yy_setImage(with: URL(string: card.imageUrl), options: .setImageWithFadeAnimation)
       
    }
    
}
