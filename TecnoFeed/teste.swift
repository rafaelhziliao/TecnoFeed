//
//  teste.swift
//  TecnoFeed
//
//  Created by Rafael Zilião on 15/09/17.
//  Copyright © 2017 Feed. All rights reserved.
//

import Foundation


/*
 let queue = DispatchQueue(label: "com.cnoon.response-queue", qos: .utility, attributes: [.concurrent])
 let apiPath = "http://api.tecnonutri.com.br/api/v4/feed/4186182-2017-09-14-4" //"http://api.tecnonutri.com.br/api/v4/feed/4190792-2017-09-11-3"
 
 Alamofire.request(apiPath, method: .get)
 .response(
 queue: queue,
 responseSerializer: DataRequest.jsonResponseSerializer(),
 completionHandler: { response in
 
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
 
 case .failure(let error):
 print("failure request\(error)")
 }
 
 // You are now running on the concurrent `queue` you created earlier.
 print("Parsing JSON on thread: \(Thread.current) is main thread: \(Thread.isMainThread)")
 
 // Validate your JSON response and convert into model objects if necessary
 print(response.result.value)
 
 // To update anything on the main thread, just jump back on like so.
 DispatchQueue.main.async {
 print("Am I back on the main thread: \(Thread.isMainThread)")
 
 }
 self.tableView.reloadData()
 }
 )*/



/*
 let queue = DispatchQueue(label: "com.cnoon.response-queue", qos: .utility, attributes: [.concurrent])
 Alamofire.request(apiPath, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil)
 .response(
 queue: queue,
 responseSerializer: DataRequest.jsonResponseSerializer(),
 completionHandler: { response in
 
 switch response.result {
 case .success(let data):
 
 let result = JSON(data)["items"]
 
 for(_, subjson):(String, JSON) in result {
 let card = Card(json: subjson)
 self.dataArray.append(card)
 }
 
 
 self.tableView.reloadData()
 
 self.params["p"] = JSON(data)["p"].intValue + 1
 self.params["t"] = JSON(data)["t"].intValue
 
 
 case .failure(let error):
 print("failure request\(error)")
 }
 
 // You are now running on the concurrent `queue` you created earlier.
 print("Parsing JSON on thread: \(Thread.current) is main thread: \(Thread.isMainThread)")
 
 // Validate your JSON response and convert into model objects if necessary
 print(response.result.value)
 
 // To update anything on the main thread, just jump back on like so.
 DispatchQueue.main.async {
 print("Am I back on the main thread: \(Thread.isMainThread)")
 }
 }
 )
 */

/*
 let apiPath = "http://api.tecnonutri.com.br/api/v4/feed/4190792-2017-09-11-3"//+receivedFeedHash
 
 
 Alamofire.request(apiPath, method: .get).responseJSON { response in
 switch response.result {
 case .success(let data):
 
 let result = JSON(data)["item"]["foods"]
 
 for(_, subjson):(String, JSON) in JSON(data)["item"]["foods"] {
 let food = Food(json: subjson)
 self.dataArray[indexPath.row].foods.append(food)
 }
 
 self.cardWithDetails = self.dataArray[indexPath.row]
 
 case .failure(let error):
 print("failure request\(error)")
 }
 }*/


