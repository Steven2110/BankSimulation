//
//  NetworkManager.swift
//  TestBank
//
//  Created by Rafael Matthew on 06.06.2023.
//

import Foundation

class NetworkManager: Any {
    static func getData<DataKind:Codable>(url: String, parameter: Dictionary<String, String>, dataKind: DataKind.Type, completion: @escaping (_ data: DataKind) -> Void) {
        var urlComponents = URLComponents(string: url)!
        urlComponents.queryItems = parameter.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        let request = URLRequest(url: urlComponents.url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil && data != nil {
                let convertedData = try! JSONDecoder().decode(dataKind, from: data!)
                completion(convertedData)
            }
        }.resume()
    }
}
