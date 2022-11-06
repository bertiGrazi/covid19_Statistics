//
//  ContentView.swift
//  CovidStats
//
//  Created by Grazi  Berti on 06/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                APIService.shared.fetchReport(for: "BGR") { result in
                    
                    switch result {
                    case .success(let region):
                        print(region.count)
                        print(region.first?.formattedDate)
                        print(region.first?.confirmed)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
