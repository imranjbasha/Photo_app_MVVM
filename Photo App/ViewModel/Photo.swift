//
//  Photo.swift
//  Photo App
//
//  Created by VEENA on 03/04/21.
//

import Foundation


struct PhotoModel: Codable {
    var photos: PhotoData
}

struct PhotoData: Codable {
    var photo: [Photos] = []
}

struct Photos: Codable {
    var id: String?
    var owner: String?
    var server: String?
    var farm: UInt = 0
    var secret: String?
}
