//
//  MainViewModel.swift
//  CovidStats
//
//  Created by Grazi  Berti on 06/11/22.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    /// Foi criado para caso a nossa API não funcionar, mostrar um dado fictício para o usuário
    @Published var totalData = TotalData.dummyData
    @Published var allContries: [Country] = []
    @Published var searchText = ""
    @Published var isSearchVisible = false
    
    init() {
        fetchTotalData()
        fetchAllContries()
    }
    
    func fetchTotalData() {
        APIService.shared.fetchTotalData { result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let totalData):
                    self.totalData = totalData
                case .failure(_):
                    print("error total data")
                    //TODO: create an alert item
                }
            }
        }
    }
    
    func fetchAllContries() {
        APIService.shared.fetchAllRegions { result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let allContries):
                    /// sorted = ordenado
                    /// Fazendo a ordem alfabética. Verificando se a primeira letra é menor que a segunda letra da palavra do item
                    self.allContries = allContries.sorted(by: {$0.name < $1.name })
                case .failure(_):
                    print("error total data")
                    //TODO: create an alert item
                }
            }
        }
    }
}
