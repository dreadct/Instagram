//
//  ListFeedsViewController.swift
//  Instagram
//
//  Created by CruzDiary on 07/01/2017.
//  Copyright © 2017 cruz. All rights reserved.
//

import UIKit

struct ListFeedsScene {
    static let segue = "ShowListFeedsScene"
}

class ListFeedsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
