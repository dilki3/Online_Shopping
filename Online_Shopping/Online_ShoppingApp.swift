//
//  Online_ShoppingApp.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-12.
//

import SwiftUI

@main
struct Online_ShoppingApp: App {
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                
                if mainVM.isUserLogin {
                    MainTabView()
                }else{
                    WelcomeView()
                }
            }
            
        }
    }
}
