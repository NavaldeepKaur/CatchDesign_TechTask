//
//  TechAssignment_catchDesignApp.swift
//  TechAssignment_catchDesign
//
//  Created by Navaldeep Kaur on 19/05/25.
//

import SwiftUI

@main
struct TechAssignment_catchDesignApp: App {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 255/255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black] // Title color
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            HomeListView()
        }
    }
}
