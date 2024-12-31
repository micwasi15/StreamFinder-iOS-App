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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
        }
        .modelContainer(for: Show.self)
    }
}
