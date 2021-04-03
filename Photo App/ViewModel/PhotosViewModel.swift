//
//  PhotosViewModel.swift
//  Photo App
//
//  Created by VEENA on 03/04/21.
//

import Foundation


class PhotosViewModel {
    
let serviceViewModel = ServiceViewModel()

    func getImages(completion: @escaping ((_ images: [String]) -> Void)){
        var images: [String] = []
        serviceViewModel.fetchPhotosFromBackend { (data) in
            let photos = data.photos.photo
            for photo in photos {
                if let server = photo.server, let id = photo.id, let secret = photo.secret {
                let farm = photo.farm
                let urlString = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
                    images.append(urlString)
                }
            }
            completion(images)
        }
    }
}
