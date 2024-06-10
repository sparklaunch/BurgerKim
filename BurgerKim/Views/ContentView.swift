//
//  ContentView.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        TabView {
            ItemsView()
//                .tabItem {
//                    Label("주문하기", systemImage: "fork.knife")
//                }
//            StoresView()
//                .tabItem {
//                    Label("매장 찾기", systemImage: "storefront")
//                }
//        }
    }
}

#Preview {
    ContentView()
        .environment(Cart())
}
