//
//  RealmUser.swift
//  Instagram
//
//  Created by CruzDiary on 24/12/2016.
//  Copyright © 2016 cruz. All rights reserved.
//

import UIKit

import RealmSwift

class RealmUser: Object {
    @objc dynamic var email = ""
    @objc dynamic var userName = ""
    @objc dynamic var password = ""
    
    override static func primaryKey() -> String? {
        return "email"
    }
}
