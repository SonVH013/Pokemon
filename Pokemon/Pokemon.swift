//
//  Pokemon.swift
//  Pokemon
//
//  Created by SonVu on 11/20/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import UIKit

class Pokemon: NSObject {
    
    //MARK: Properties
    var id : Int
    var name : String
    var gen : Int
    var img : String
    
    //MARK: Initialization
    init(id: Int, name : String, gen : Int, img : String) {
        self.id = id
        self.name = name
        self.gen = gen
        self.img = img
    }
    
    
}
