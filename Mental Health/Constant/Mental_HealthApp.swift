//
//  Mental_HealthApp.swift
//  Mental Health
//
//  Created by Kalmakhanbet Dariga on 15.11.2024.
//

import SwiftUI

@main
struct Mental_HealthApp: App {
    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                SplashScreenView()
                    .navigationBarBackButtonHidden()
                    .navigationDestination(for: Router.Destination.self) { $0.view }
            }
            .environmentObject(router)
            
        }
    }
}
