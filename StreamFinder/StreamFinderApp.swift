//
//  StreamFinderApp.swift
//  StreamFinder
//
//  Created by stud on 07/11/2024.
//

import SwiftUI

@main
struct StreamFinderApp: App {
    @StateObject private var userViewModel = UserViewModel()
    @StateObject private var appSettings = AppSettings()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Constants.tabBgColor)
        UITabBar.appearance().barTintColor = UIColor(Constants.selectedItemColor)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Constants.unselectedItemColor)
        }


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
                .environmentObject(appSettings)
        }
    }
}
