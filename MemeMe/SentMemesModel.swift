//
//  SentMemesModel.swift
//  MemeMe
//
//  Created by Maria  on 9/12/17.
//  Copyright © 2017 Maria . All rights reserved.
//

import UIKit

class SentMemesModel {
    
    static let instance = SentMemesModel()
    
    var data: [Meme] = []
    
    private init() {
        
    }
    
    public func add(meme: Meme) {
        data.append(meme)
    }
    
    public func count() -> Int {
        return data.count
    }
    
    public func meme(atIndex index: Int) -> Meme {
        return data[index]
    }
    
    public func delete(atIndex index: Int) {
        data.remove(at: index)
    }
}
