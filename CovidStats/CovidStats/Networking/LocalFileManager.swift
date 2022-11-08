//
//  LocalFileManager.swift
//  CovidStats
//
//  Created by Grazi  Berti on 08/11/22.
//

import Foundation

final class LocalFileManager {
    
    static let shared = LocalFileManager()
    
    private init () {}
    
    //save our json in local
    
    func saveCountriesLocally(countryData: Data?) {
        if let countryData = countryData {
            if let json = try? JSONSerialization.jsonObject(with: countryData, options: []) as? [String: Any] {
               
                do {
                    let fileURL = getDocimentDirectory().appendingPathComponent("country.json")
                    
                    try JSONSerialization.data(withJSONObject: json).write(to: fileURL)
                } catch {
                    print(error.localizedDescription)
                }
            }
                
            
        }
    }
    
    func fetchLocalCountries() -> Data? {
        do {
            let fileURL = getDocimentDirectory().appendingPathComponent("country.json")
            
            let data = try Data(contentsOf: fileURL)
            return data
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func getDocimentDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
}
