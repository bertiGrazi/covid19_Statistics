//
//  DataCardView.swift
//  CovidStats
//
//  Created by Grazi  Berti on 06/11/22.
//

import SwiftUI

struct DataCardView: View {
    var number: String = "--"
    var name: String = "Error"
    var color: Color = .primary
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Text(self.number)
                    .font(.subheadline)
                    .foregroundColor(self.color)
                
                Text(self.name)
                    .font(.subheadline)
                    .foregroundColor(self.color)
            }
            .frame(width: geometry.size.width, height: 80, alignment: .center)
            .background(Color("cardBackground"))
            .cornerRadius(8.0)
        }
    }
}

struct DataCardView_Previews: PreviewProvider {
    static var previews: some View {
        DataCardView()
    }
}
