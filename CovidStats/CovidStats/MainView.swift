//
//  ContentView.swift
//  CovidStats
//
//  Created by Grazi  Berti on 06/11/22.
//

import SwiftUI
import CoreData

struct MainView: View {
    
    @ObservedObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            /// ZStack: creating overlapping content
            ZStack(alignment: .top) {
                LinearGradient(colors: [
                    Color(red: 0.76, green: 0.15, blue: 0.26),
                    Color(red: 0.01, green: 0.23, blue: 0.5),
                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    Text("World Total")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(10)
                    
                    TotalDataView(totalData: viewModel.totalData)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
