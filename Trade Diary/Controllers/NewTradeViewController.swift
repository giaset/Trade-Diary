//
//  NewTradeViewController.swift
//  Trade Diary
//
//  Created by Gianni Settino on 2018-02-23.
//  Copyright © 2018 Milton and Parc. All rights reserved.
//

import UIKit

class NewTradeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissViewController))
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
}
