//
//  NetworkManager.swift
//  HW.2.11.Alamofire(Dota)
//
//  Created by Sergey Yurtaev on 24.05.2022.
//

import Foundation
import Alamofire

let urlHeroDota2 = "https://api.opendota.com/api/heroStats"
let urlStart = "https://api.opendota.com"

class NetworkManagerAlamofire {
    
    static let shared = NetworkManagerAlamofire()
    
    private init() {}
    
    func fetchData(from urlString: String, with complition: @escaping ([Hero]) -> Void) {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
            
        AF.request(urlString)
            .validate()
            .responseDecodable(of: [Hero].self, decoder: decoder) { dataResponse in
                switch dataResponse.result {
                case .success(let heroes):
                    complition(heroes)
                case .failure(let error):
                    print("ERROR: \(error)")
                }
            }
    }
}

class ImageManager {
    
    static var shared = ImageManager()

    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}

//class NetworkManagerURLSession {
//
//    static let shared = NetworkManagerURLSession()
//
//    private init() {}
//
//    func fetchData(from urlString: String, with complition: @escaping ([Hero]) -> Void) {
//
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, _, error) in
//            if let error = error { print(error); return }
//            guard let data = data else { return }
//            let jsonDecoder = JSONDecoder()
//            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//            do {
//                let heroes = try jsonDecoder.decode([Hero].self, from: data)
//                DispatchQueue.main.async {
//                    complition(heroes)
//                }
//            } catch let jsonError {
//                print(jsonError.localizedDescription)
//            }
//        }.resume()
//    }
//}
