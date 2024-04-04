//
//  VideoModel.swift
//  DemoAfrica
//
//  Created by Aguid Ramirez Sanchez on 03/04/24.
//

import Foundation

struct Video: Codable, Identifiable{
    let id: String
    let name: String
    let headline:String
    
    // Computed property
    var thumbnail: String{
        "video-\(id)"
    }
}
