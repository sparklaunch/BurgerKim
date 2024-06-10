//
//  ItemsViewModel.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/10/24.
//

import SwiftUI

extension ItemsView {
    @Observable
    class ViewModel {
        var items: [Item]
        var filteredBy: ItemType = .burger {
            didSet {
                items = Item.items.filter { item in
                    item.type == filteredBy
                }
            }
        }
        init() {
            items = Item.items.filter { item in
                item.type == .burger
            }
        }
    }
}
