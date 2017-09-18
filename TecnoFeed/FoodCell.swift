//
//  FoodCell.swift
//  TecnoFeed
//
//  Created by Rafael Zilião on 18/09/17.
//  Copyright © 2017 Feed. All rights reserved.
//

import UIKit


class FoodCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    func configCell(food: Food) {
        
        let compString = "\(String(food.amount)) \(food.measure) = \(String(food.energy))kcal"
        let colorString = "\(String(food.energy))kcal"
        let range = (compString as NSString).range(of: colorString)
        let color = UIColor.init(red: 255.0/255.0, green: 92.0/255.0, blue: 115.0/255.0, alpha: 1.0) //vermelho
        
        let attributedText = NSMutableAttributedString.init(string: compString)
        attributedText.addAttribute(NSForegroundColorAttributeName, value: color , range: range)
               
        self.descriptionLabel.text = food.description
        self.amountLabel.attributedText = attributedText
    
    }
    
    
}
