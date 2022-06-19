//
//  NetworkManager.swift
//  HW.2.11.Alamofire(Dota)
//
//  Created by Sergey Yurtaev on 24.05.2022.
//

import Foundation
import Alamofire

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

