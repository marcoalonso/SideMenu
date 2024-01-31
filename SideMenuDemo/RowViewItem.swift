//
//  RowViewItem.swift
//  SideMenuDemo
//
//  Created by Marco Alonso Rodriguez on 30/01/24.
//

import SwiftUI

struct RowViewItem: View {
    let option: SideMenuOptionModel
    @Binding var selecteOption: SideMenuOptionModel?
    
    private var isSelected: Bool {
        return selecteOption == option
    }
    
    var body: some View {
        HStack {
            Image(systemName: option.systemImageName)
                .imageScale(.small)
            
            Text(option.title)
                .font(.subheadline)
            
            Spacer()
            
            Image(systemName: "chevron.forward")
                .imageScale(.small)
        }
        .padding(.leading)
        .padding(.trailing)
        .foregroundColor(.black)
        .frame(width: 220, height: 48)
        .background(isSelected ? .gray.opacity(0.18) : .clear)
        .cornerRadius(24)
    }
}

#Preview {
    RowViewItem(option: .search, selecteOption: .constant(.search))
}
