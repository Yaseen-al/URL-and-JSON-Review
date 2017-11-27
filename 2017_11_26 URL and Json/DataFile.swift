//
//  DataFile.swift
//  2017_11_26 URL and Json
//
//  Created by C4Q on 11/26/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import Foundation
struct WebSiteDescribtion: Codable {
    var name: String
    var description: String
    var courses: [Course]
}
struct Course:Codable {
    let  id: Int
    let name: String
    let imageUrl: String
    //    init(id:Int, name: String, imageUrl: String) {
    //        self.id = id
    //        self.name = name
    //        self.imageUrl = imageUrl
    //    }
//    init(from json: [String: Any]){
//        self.id = json["id"] as? Int ?? -1
//        self.name = json["name"] as? String ?? ""
//        self.imageUrl = json["imageUrl"] as? String ?? ""
//    }
}
