//
//  BurgerKimApp.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/7/24.
//

import SwiftUI

@main
struct BurgerKimApp: App {
    @State private var cart = Cart()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(cart)
        }
    }
}
