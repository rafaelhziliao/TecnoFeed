//
//  DetailTableViewController.swift
//  TecnoFeed
//
//  Created by Rafael Zilião on 13/09/17.
//  Copyright © 2017 Feed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailTableViewController: UITableViewController {
    var receivedFeedHash: String!
    var card: Card!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet var detailTableView: UITableView!
    @IBOutlet weak var energyLabel: UILabel!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var protLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var fibLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        
    }
    
    func load() {
        
        let apiPath = "http://api.tecnonutri.com.br/api/v4/feed/"+receivedFeedHash
        
        Alamofire.request(apiPath, method: .get).responseJSON { response in
            switch response.result {
            case .success(let data):
                
                let result = JSON(data)["item"]
                let card = Card(json: result)
                self.card = card
                
                //tira item zerado que esta sendo colocado
                self.card.foods.removeAll()
                for(_, subjson):(String, JSON) in result["foods"] {
                    let food = Food(json: subjson)
                    self.card.foods.append(food)
                }
                
                self.tableView.reloadData()
                
                self.cardImageView.yy_setImage(with: URL(string: self.card.imageUrl), options: .setImageWithFadeAnimation)
                self.mealLabel.text = self.card.meal
                self.energyLabel.text = String(self.card.energy)
                self.carbLabel.text = String(self.card.carbohydrate)
                self.protLabel.text = String(self.card.protein)
                self.fatLabel.text = String(self.card.fat)
                self.fibLabel.text = String(self.card.fiber)
                
                
            case .failure(let error):
                print("failure request\(error)")
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.card == nil ?  0 :  self.card.foods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food: Food = self.card.foods[indexPath.row]
        let foodCell: FoodCell = tableView.dequeueReusableCell(withIdentifier: "cellDetail", for: indexPath) as! FoodCell
        foodCell.configCell(food: food)
        return foodCell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

