//
//  CountryDetailView.swift
//  CovidStats
//
//  Created by Grazi  Berti on 07/11/22.
//

import SwiftUI

struct CountryDetailView: View {
    
    /// @ObservedObject property wrapper is used inside a view to store an observable object instance
    /// It is really important that you use @ObservedObject only with views that were passed in from elsewhere
    @ObservedObject var viewModel: CountryDetailViewModel
    
    var body: some View {
        VStack {
            if viewModel.reports.count > 1 {
                //show list os states
                List {
                    ForEach(viewModel.reports) { report in
                        NavigationLink(destination: Text("hello")) {
                            Text(report.region.province)
                        }
                        
                    }
                }
                .listStyle(.plain)
                .navigationTitle(viewModel.reports.first?.region.name ?? "Unkown country")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                // show report view
            }
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(viewModel: CountryDetailViewModel.init(country: Country.dummyData))
    }
}
