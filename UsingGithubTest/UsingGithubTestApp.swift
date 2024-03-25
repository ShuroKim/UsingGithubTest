//
//  UsingGithubTestApp.swift
//  UsingGithubTest
//
//  Created by Shuraw on 3/25/24.
//

import SwiftUI

@main
struct UsingGithubTestApp: App {
    var body: some Scene {
        WindowGroup {            
            CustomTabNaviView()
                .environmentObject(NavigationPathFinder.shared)
        }
    }
}
