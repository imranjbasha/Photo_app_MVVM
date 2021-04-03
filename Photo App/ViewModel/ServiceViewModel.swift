//
//  Service.swift
//  Photo App
//
//  Created by IMRAN on 03/04/21.
//

import Foundation
import Alamofire

class ServiceViewModel {
    
func fetchPhotosFromBackend(completion: @escaping (_ data: PhotoModel) -> Void){
    let url = "https://www.flickr.com/services/rest/?method=flickr.galleries.getPhotos&api_key=f9736f4d370f9c7115a952951b506569&gallery_id=66911286-72157647277042064&format=json&nojsoncallback=1"
    AF.request(url).validate().responseJSON() { response in
        switch response.result {
        case .success:
            if let data = response.data {
            do {
                let photos = try JSONDecoder().decode(PhotoModel.self, from: data)
                completion(photos)
                }catch{
                    print(error.localizedDescription)
                }
        }
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}


}
