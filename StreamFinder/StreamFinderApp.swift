//
//  StreamFinderApp.swift
//  StreamFinder
//
//  Created by stud on 07/11/2024.
//

import SwiftUI

@main
struct StreamFinderApp: App {
    @StateObject private var userViewModel: UserViewModel
    @StateObject private var appSettings = AppSettings()
    
    init() {
        if ProcessInfo.processInfo.arguments.contains("-loginMode") {
            _userViewModel = StateObject(wrappedValue: UserViewModel(false))
        } else {
            _userViewModel = StateObject(wrappedValue: UserViewModel())
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
                .environmentObject(appSettings)
        }
    }
}
