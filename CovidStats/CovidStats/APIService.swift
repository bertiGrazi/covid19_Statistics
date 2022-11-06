//
//  APIService.swift
//  CovidStats
//
//  Created by Grazi  Berti on 06/11/22.
//

import Foundation

final class APIService {
    static let shared = APIService()
    
    /// Ninguém vai conseguir iniciaizar a nossa classe. Deverá usar o shared para isso.
    private init () {}
    
    private let headers = [
        "X-RapidAPI-Key": "e5070868abmshb18d116f91c1980p14ee0ejsnc8e7756aa87d",
        "X-RapidAPI-Host": "covid-19-statistics.p.rapidapi.com"
    ]
    
    private let baseURLString = "https://covid-19-statistics.p.rapidapi.com"
    
    func fetchTotalData(completion: @escaping((Result<TotalData, Error>) -> Void)) {

        let totalURLString = baseURLString + "/reports/total"
        
        let url = URL(string: totalURLString)
        guard let url = url else {
            completion(.failure(CovidError.incorrectURL))
            return
            
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        
        
        let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil) {
                completion(.failure(CovidError.noDataReceived))
            } else {
//                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
//                    print(json)
//                }
                
                let decoder = JSONDecoder()
                
                do {
                    let totalDataObject = try decoder.decode(TotalDataObject.self, from: data!)
                    completion(.success(totalDataObject.data))
                } catch {
                    completion(.failure(error))
                }
            }
        })

        dataTask.resume()
    }
}
