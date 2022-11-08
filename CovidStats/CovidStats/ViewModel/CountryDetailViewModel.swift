//
//  CountryDetailViewModel.swift
//  CovidStats
//
//  Created by Grazi  Berti on 07/11/22.
//

import Foundation

final class CountryDetailViewModel: ObservableObject {

    /// @Published is one of the most useful property wrappers in SwiftUI, allowing us to create observable objects that automatically announce when changes occur.
    @Published var reports: [RegionReport] = []
    
    private var iso: String
    
    init(country: Country) {
        iso = country.iso
    }
    
    func fetchReport() {
        APIService.shared.fetchReport(for: iso) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let reports):
                    self.reports = reports
                case .failure(_):
                    print("error getting country report")
                    // TODO: Show Alert
                }
            }
        }
    }
}
