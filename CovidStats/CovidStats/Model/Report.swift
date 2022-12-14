//
//  Report.swift
//  CovidStats
//
//  Created by Grazi  Berti on 06/11/22.
//

import Foundation

struct AllReports: Codable {
    let data: [RegionReport]
}

struct RegionReport: Codable, Identifiable {
    let id = UUID()
    let date: Date
    let confirmed: Int
    let deaths: Int
    let active: Int
    let fatality_rate: Double
    let region: RegionDetail
    
    var formattedDate: String {
                            /// Oct 17, 2020
        date.formatted(date: .abbreviated, time: .omitted)
    }
    
    static let dummyData = RegionReport(date: Date.now, confirmed: 0, deaths: 0, active: 0, fatality_rate: 0.0, region: RegionDetail(name: "N/A", province: "province"))
    
}

struct RegionDetail: Codable {
    let name: String
    let province: String
}
