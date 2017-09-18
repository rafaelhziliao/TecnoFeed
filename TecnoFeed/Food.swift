//
//  Food.swift
//  TecnoFeed
//
//  Created by Rafael Zilião on 12/09/17.
//  Copyright © 2017 Feed. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Food {
    var description: String
    var measure: String
    var amount: Int
    var weight : Double
    var energy: Int
    var carbohydrate: Double
    var fat: Double
    var protein: Double
    
    init(json: JSON) {
        self.description = json["description"].stringValue
        self.measure = json["measure"].stringValue
        self.amount = json["amount"].intValue
        self.weight = json["weight"].doubleValue
        self.energy = json["energy"].intValue
        self.carbohydrate = json["carbohydrate"].doubleValue
        self.fat = json["fat"].doubleValue
        self.protein = json["protein"].doubleValue
   
    }
}
