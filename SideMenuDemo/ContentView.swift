//
//  ContentView.swift
//  SideMenuDemo
//
//  Created by Marco Alonso Rodriguez on 30/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedTab = 0
    @AppStorage("isDarkModeOn") private var isDarkModeOn = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab) {
                    Text("Home")
                        .tag(0)
                    
                    Text("Dashboard")
                        .tag(1)
                    
                    Text("Profile")
                        .tag(2)
                    
                    Text("Search")
                        .tag(3)
                    
                    Text("Notifications")
                        .tag(4)
                }
                
                ContentSideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(isDarkModeOn ? .white : .gray)
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
