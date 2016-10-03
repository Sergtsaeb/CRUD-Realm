//
//  ObjectModel.swift
//  CRUD Realm
//
//  Created by Sergelenbaatar Tsogtbaatar on 10/3/16.
//  Copyright © 2016 Sergts. All rights reserved.
//

import RealmSwift
import Realm

class BookItem: Object {
    dynamic var Title: String = ""
    dynamic var Author: String = ""
}
