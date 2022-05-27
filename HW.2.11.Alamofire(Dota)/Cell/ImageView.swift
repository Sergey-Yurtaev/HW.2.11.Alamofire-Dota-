//
//  ImageView.swift
//  HW.2.11.Alamofire(Dota)
//
//  Created by Sergey Yurtaev on 27.05.2022.
//

import UIKit

class ImageView: UIImageView {
    
    func fetchImage(from url: String) {
        guard let imageURL = URL(string: url) else {
            image = UIImage(named: "logo")
            return
        }
        
        // Загрузка изображения из кеша, если оно там есть
        if let cachedImage = getCachedImage(from: imageURL) {
            image = cachedImage
            return
        }
        
        // Если изображения в кеше нет, загружаем картинки из сети
        ImageManager.shared.getImage(from: imageURL) { (data, response) in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            //Сохраняем данные в кеш
            self.saveDataToCach(with: data, and: response)
        }
    }
    
    // метод ищет изображения в кеше
    private func getCachedImage(from url: URL) -> UIImage? {
        let urlRequest = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
    
    // сохранение данных в кеш
    private func saveDataToCach(with data: Data, and response: URLResponse) {
        guard let urlResponse = response.url else { return }
        let urlRequest = URLRequest(url: urlResponse)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }
}
