//
//  TotalData.swift
//  CovidStats
//
//  Created by Grazi  Berti on 06/11/22.
//

import Foundation

struct TotalDataObject: Codable {
    let data: TotalData
}

struct TotalData: Codable {
    let confirmed: Int
    let deaths: Int
    let active: Int
    let fatality_rate: Double
}
