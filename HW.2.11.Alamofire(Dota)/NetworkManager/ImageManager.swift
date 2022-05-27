//
//  ImageManager.swift
//  HW.2.11.Alamofire(Dota)
//
//  Created by Sergey Yurtaev on 27.05.2022.
//

import Foundation


class ImageManager {
    
    static var shared = ImageManager()
    
    private init() {}
    
    func getImage(from url: URL, completion: @escaping (Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data, let response = response else { return }
            guard let responseURL = response.url else { return }
            guard responseURL == url else { return }
            
            completion(data, response)
        }.resume()
    }
}
