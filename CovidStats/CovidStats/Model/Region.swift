//
//  Region.swift
//  CovidStats
//
//  Created by Grazi  Berti on 06/11/22.
//

import Foundation

struct AllRegions: Codable {
    let data: [Country]
}

struct Country: Codable {
    let iso: String
    let name: String
}
