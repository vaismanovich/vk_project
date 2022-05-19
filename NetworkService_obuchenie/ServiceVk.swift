//
//  ServiceVk.swift
//  vk_client_VVaisman
//
//  Created by Vitaliy on 21/02/2022.
//

import Foundation
import Alamofire




enum httpMethods: String {
    case get = "GET"
    case post = "POST"
    
}

class ServiceVK {
    
    private let sessionBig: URLSession = {
        /// Создаем конфигурацию. есть дефолт. настройка сессии.
        let config = URLSessionConfiguration.default
        let session  = URLSession(configuration: config)
        return session
    }()
    
//    private let scheme = "https"
//    private let host = "api.vk.com"
    
    //История Alamofire
//    func loadJsonAF() {
//
//
//        // встроенный Json decoder. Который превратит это все в Json
//        AF.request("https://api.openweathermap.org/data/2.5/forecast/daily?q=berlin&cnt=16&appid=968c1d4e4fa88aed01f1081ec389f6a5").responseJSON { response in
//            print(response.value)
//        }
//    }
    
    
    func loadJson() {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = "/data/2.5/forecast/daily"
        
        //params  = Query Items. Массив из UrlQueryItem
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: "moscow"),
            URLQueryItem(name: "cnt", value: "16"),
            URLQueryItem(name: "appid", value: "968c1d4e4fa88aed01f1081ec389f6a5")
        ]
        
        /// Помещяем URL. Все вышестоязие компомненты во что-то одно
        guard let url  = urlComponents.url
        else {
            return
        }
        
        let request = URLRequest(url: url)
        
        
        let task = sessionBig.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            }
            guard let data = data else {
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options:
                                                                JSONSerialization.ReadingOptions.fragmentsAllowed)
                
                print(json)
                
            } catch {
                print("")
            }
            
        }
        task.resume()
    }
    

    
   
//    func loadInfo(method: ApiMethods, httpMethods: HttpMethods, params: [String:String])  {
//
//        // ЕСть класс URLQueryItem. Мы создаем массив
//        var queryItems: [URLQueryItem] = []
//        // закидываем наши параметры.
//        queryItems.append(URLQueryItem(name: "v", value: "5.81"))
////
////        /// Создаем url
////       guard
////        let url = URL(string: "https://samples.openweathermap.org/data/2.5/forecast?q=M%C3%BCnchen,DE&appid=b1b15e88fa797225412429c1c50c122a1")
////       else {
////        return
////       }
//
////        let request = URLRequest.init(url: url)
//        // Модифицируем URl из url components
//        var urlComponents = URLComponents()
//        urlComponents.scheme = scheme
//        urlComponents.host = host
//        urlComponents.path = method.rawValue
//
//        guard let url = urlComponents.url
//        else {
//            return
//        }
//
//
//        /// Cоздаем таск. выюираем Дата Таск. В параметры пробрасывается URL request и competion handler. в нем лежит то , что мы ьудем обраьатывать
//        /// dataTask(with: url!) пока ставим Force Uwrap
//            let task  = sessionBig.dataTask(with: url) { data, response, error in
//            /// тут всегда проверяют на ошибку
//            if let error = error {
//                print("error")
//            }
//            /// если нет даты то мможно дальще не идти
//            guard let data = data else {
//                return
//            }
//            /// теперь принтуем данные котопые пришли. Если нет ощибки, есть дата. то мы доджны что то сделать
//            /// берем класс JSONSerialization - rкоторый превратит объекта формата JSON. Поместили Daty в локальну. перемнную let json
//                let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
//
//            print(json)
//        }
//
//        /// нужен resume. Иначе ничего не получится
//        task.resume()
//    }
    
    
        func loadInfo()  {
               /// Создаем url
              guard
               let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily?q=berlin&cnt=16&appid=968c1d4e4fa88aed01f1081ec389f6a5")
              else {
               return
              }
    
               let request = URLRequest.init(url: url)
    
               /// Cоздаем таск. выюираем Дата Таск. В параметры пробрасывается URL request и competion handler. в нем лежит то , что мы ьудем обраьатывать
               /// dataTask(with: url!) пока ставим Force Uwrap
                   let task  = sessionBig.dataTask(with: request) { data, response, error in
                   /// тут всегда проверяют на ошибку
                   if let error = error {
                       print("error")
                   }
                   /// если нет даты то мможно дальще не идти
                   guard let data = data else {
                       return
                   }
                   /// теперь принтуем данные котопые пришли. Если нет ощибки, есть дата. то мы доджны что то сделать
                   /// берем класс JSONSerialization - rкоторый превратит объекта формата JSON. Поместили Daty в локальну. перемнную let json
                       let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
    
                   print(json)
               }
    
               /// нужен resume. Иначе ничего не получится
               task.resume()
           }
        

}
