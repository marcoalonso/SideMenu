//
//  ContentSideMenuView.swift
//  SideMenuDemo
//
//  Created by Marco Alonso Rodriguez on 30/01/24.
//

import SwiftUI

struct ContentSideMenuView: View {
    @Binding var isShowing: Bool
    @Binding var selectedTab: Int
    @State private var selectedOption: SideMenuOptionModel?
    @State private var darMode = false
    @AppStorage("isDarkModeOn") private var isDarkModeOn = false
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
            
                HStack {
                    VStack(alignment: .leading, spacing: 32.0) {
                        
                        VStack {
                            ForEach(SideMenuOptionModel.allCases) { option in
                                RowViewItem(option: option, selecteOption: $selectedOption)
                                    .onTapGesture {
                                        onOptionTapped(option)
                                    }
                            }
                            
                            Spacer()
                            
                            // Perfil
                            Divider()
                            VStack(alignment: .leading) {
                                HeaderView()
                                HStack {
                                    Image(systemName: "moon.fill")
                                    
                                    Text("Light Mode")
                                        .font(.footnote)
                                    
                                    Toggle("", isOn: $isDarkModeOn)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Image(systemName: "person.fill")
                                    
                                    Text("Logout")
                                        .font(.footnote)
                                    
                                    Spacer()
                                }
                            }
                            .padding(.leading)
                        }
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(isDarkModeOn ? .gray : .white)
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: isShowing)
    }
    
    private func onOptionTapped(_ option: SideMenuOptionModel) {
        selectedOption = option
        selectedTab = option.rawValue
        isShowing = false
    }
}

#Preview {
    ContentSideMenuView(isShowing: .constant(true), selectedTab: .constant(0))
}

enum SideMenuOptionModel: Int, CaseIterable, Identifiable {
    case home
    case performance
    case profile
    case search
    case notifications
    case chats
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .performance:
            return "Performance"
        case .profile:
            return "Profile"
        case .search:
            return "Search"
        case .notifications:
            return "Notifications"
        case .chats:
            return "Chats"
          
        }
    }
    
    var systemImageName: String {
        switch self {
        case .home:
            return "house"
        case .performance:
            return "chart.bar"
        case .profile:
            return "person"
        case .search:
            return "magnifyingglass"
        case .notifications:
            return "bell"
        case .chats:
            return "text.bubble"
        }
    }
    
    var id: Int { return self.rawValue}
}
