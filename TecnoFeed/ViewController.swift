//
//  ViewController.swift
//  TecnoFeed
//
//  Created by Rafael Zilião on 11/09/17.
//  Copyright © 2017 Feed. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MoPub


class ViewController: UIViewController, MPAdViewDelegate {
    let baseUrl = "http://api.tecnonutri.com.br/api/v4"
    let segueDetailIdentfier = "segueDetail"
    let cardCellIdentfier = "CardCell"
    var dataArray = [Card]()
    var params = [String: Int]()
    var sendFeedHash = ""
    var bannerAdView: MPAdView?
    var refreshControl = UIRefreshControl()
    var energy = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTableView()
        setupRefreshControl()
        loadDataFromServer()
        setupMoPub()
        
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: cardCellIdentfier, bundle: nil), forCellReuseIdentifier: cardCellIdentfier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 360.0
    }
    
    func setupRefreshControl() {
        tableView.refreshControl = self.refreshControl
        self.refreshControl.addTarget(self, action: #selector(ViewController.didRefreshList), for: .valueChanged)
        let color = UIColor.init(red: 255.0/255.0, green: 151.0/255.0, blue: 0.0/255.0, alpha: 1.0) //laranja
        self.refreshControl.backgroundColor = color
        self.refreshControl.tintColor = UIColor.white
        }
    
    func didRefreshList() {
        self.params = [:]
        loadDataFromServer()
        self.refreshControl.endRefreshing()
    }
    
    
    func setupMoPub() {
        //add banner
        let adSize: CGSize = UI_USER_INTERFACE_IDIOM() == .pad ? MOPUB_LEADERBOARD_SIZE : MOPUB_BANNER_SIZE
        bannerAdView = MPAdView.init(adUnitId: "3208afa7fdbb49ab805448ddb4519e1a", size: adSize)
        bannerAdView?.delegate = self
        let bounds : CGRect = view.bounds
        var adFrame : CGRect = CGRect.zero
        
        adFrame.size = bannerAdView!.sizeThatFits(bounds.size)
        adFrame.origin.x = (bounds.size.width-adFrame.size.width)/2
        adFrame.origin.y = bounds.size.height - adFrame.size.height
        
        bannerAdView!.frame = adFrame
        self.view?.addSubview(bannerAdView!)
        bannerAdView?.loadAd()
    }
    
    
    // MARK: - <MPAdViewDelegate>
    func viewControllerForPresentingModalView() -> UIViewController {
        return self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueDetailIdentfier {
            let targetTableViewController = segue.destination as! DetailTableViewController
            targetTableViewController.receivedFeedHash = sendFeedHash
            
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
            
        }
    }
    
    
    func loadDataFromServer() {
        let apiPath = baseUrl + "/feed"
        
        Alamofire.request(apiPath, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { response in
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
        }
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let card = self.dataArray[indexPath.row]
        
        let cardCell: CardCell = tableView.dequeueReusableCell(withIdentifier: cardCellIdentfier, for: indexPath) as! CardCell
        
        cardCell.configCell(card: card)
        
        return cardCell
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if (indexPath.row == self.dataArray.count - 1) {
            loadDataFromServer()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.sendFeedHash =  self.dataArray[indexPath.row].feedHash
        self.energy = self.dataArray[indexPath.row].energy
        self.performSegue(withIdentifier: segueDetailIdentfier, sender: nil)
    }
}








