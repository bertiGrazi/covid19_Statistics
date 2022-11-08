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
        
    }
    
//    func techLocalCountries() -> Date? {
//
//    }
    
    private func getDocimentDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
}
