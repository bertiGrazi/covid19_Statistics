//
//  SearchBarView.swift
//  CovidStats
//
//  Created by Grazi  Berti on 07/11/22.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var serarchText: String
    
    var body: some View {
        HStack {
            TextField("Country...", text: $serarchText)
                .foregroundColor(.white)
                .padding()
        }
        .frame(height: 50)
        .background(.regularMaterial)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(serarchText: .constant(""))
    }
}
