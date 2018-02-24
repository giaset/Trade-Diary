//
//  TradeTableViewController.swift
//  Trade Diary
//
//  Created by Gianni Settino on 2018-02-23.
//  Copyright © 2018 Milton and Parc. All rights reserved.
//

import UIKit

class TradeTableViewController: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Trade Diary"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentNewTradeController))
        
        view.addSubview(tableView)
        tableView.pinToSuperview()
    }
    
    @objc func presentNewTradeController() {
        present(UINavigationController(rootViewController: NewTradeViewController()), animated: true, completion: nil)
    }
}
