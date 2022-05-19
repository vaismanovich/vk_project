//
//  ImageLoaderU3.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 24/03/2022.
//

import Foundation


class ImageLoader {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    
    func loadImage(url: URL, completion: @escaping(Result<Data, Error>) -> Void ) {
        //замыкание которое будет работать на Main потоке
        let completionOnMain: (Result<Data, Error>) -> Void = {result in
            //Main - говорит что это Мэйн поток, а assync говорит что эта задача будет выполнена Асинхронно. Не затормаживаю текуюший поток
            DispatchQueue.main.async {
                completion(result)
            }
        }
        session.dataTask(with: url) { data, response, error in
            guard let responseData = data, error == nil else {
                if let error = error {
                    completionOnMain(.failure(error))
                }
                return
            }
            completionOnMain(.success(responseData))
        }.resume()
    }
}
