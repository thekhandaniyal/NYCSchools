//
//  NetworkServices.swift
//  20220616-DaniyalKhan-NYCSchools
//
//  Created by Admin on 6/16/22.
//

import Foundation

class NetworkServices {
    
    static var shared = NetworkServices()
    
    func callApiRequest<T: Codable>(urlString: String, expectation: T.Type, completion: @escaping (Result<T,Error>) -> ()) {
        
        guard let url = URL(string: urlString) else {
        completion(.failure(CustomNetworkError.invalidUrl))
        return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Data did not recived")
                print(error.localizedDescription)
            } else if let data = data {
                do {
                    let result = try  JSONDecoder().decode(expectation.self, from: data)
                //    DispatchQueue.main.async {
                        completion(.success(result))
               //     }
                }catch {
                    print("error found while decoding")
                    completion(.failure(CustomNetworkError.invalidData))
                }
            }
        }.resume()
    }
}
