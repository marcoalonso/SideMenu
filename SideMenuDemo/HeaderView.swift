//
//  HeaderView.swift
//  SideMenuDemo
//
//  Created by Marco Alonso Rodriguez on 30/01/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image("marco")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 48, height: 48)
                .background(.blue)
                .clipShape(Circle())
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 6.0) {
                Text("Marco Alonso")
                    .font(.subheadline)
                
                Text("marco@gmail.com")
                    .font(.footnote)
            }
            
        }
    }
}

#Preview {
    HeaderView()
}
