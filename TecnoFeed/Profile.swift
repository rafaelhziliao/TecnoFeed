//
//  Profile.swift
//  TecnoFeed
//
//  Created by Rafael Zilião on 11/09/17.
//  Copyright © 2017 Feed. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Profile {
    var name: String
    var imageUrl: String
    var generalGoal:  String
    
    init(json: JSON) {        
        self.name = json["name"].stringValue
        self.imageUrl = json["image"].stringValue
        self.generalGoal = json["general_goal"].stringValue
        
    }
}
