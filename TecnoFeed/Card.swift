//
//  Card.swift
//  TecnoFeed
//
//  Created by Rafael Zilião on 11/09/17.
//  Copyright © 2017 Feed. All rights reserved.
//

import Foundation
import SwiftyJSON


struct Card {
    var feedHash: String
    var id: Int
    var meal: String
    var date: String
    var imageUrl: String
    var energy: Int
    var profile: Profile
    var foods: [Food]
    var carbohydrate: Int
    var fat: Int
    var protein: Int
    var fiber: Int
    
    private var _meal = ["Café da Manhã", "Lanche da Manhã", "Almoço", "Lanche da Tarde", "Jantar", "Ceia","Pré-Treino", "Pós-Treino"]
    
    init(json: JSON) {
        self.feedHash = json["feedHash"].stringValue
        self.id = json["id"].intValue
        self.meal = _meal[json["meal"].intValue]
        self.date = json["date"].stringValue
        self.imageUrl = json["image"].stringValue
        self.energy = json["energy"].intValue
        self.foods = [Food(json: json["foods"])]
        self.profile = Profile(json: json["profile"])
        self.carbohydrate = json["carbohydrate"].intValue
        self.fat = json["fat"].intValue
        self.protein = json["protein"].intValue
        self.fiber = json["fiber"].intValue
        
    }
}
