//
//  SideMenuDemoApp.swift
//  SideMenuDemo
//
//  Created by Marco Alonso Rodriguez on 30/01/24.
//

import SwiftUI

@main
struct SideMenuDemoApp: App {
    @AppStorage("isDarkModeOn") private var isDarkModeOn = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkModeOn ? .dark : .light)
        }
    }
}
