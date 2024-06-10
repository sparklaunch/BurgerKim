//
//  Cart.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/7/24.
//

import SwiftUI

@Observable
class Cart {
    var items = [Item]() {
        didSet {
            guard let encodedItems = try? JSONEncoder().encode(items) else {
                fatalError("Failed to encode items")
            }
            UserDefaults.standard.set(encodedItems, forKey: "Items")
        }
    }
    init() {
        if let encodedItems = UserDefaults.standard.data(forKey: "Items") {
            guard let decodedItems = try? JSONDecoder().decode([Item].self, from: encodedItems) else {
                fatalError("Failed to decode items data")
            }
            items = decodedItems
        } else {
            items = []
        }
    }
    var totalPrice: Double {
        items.reduce(into: .zero) { partialResult, item in
            partialResult += item.finalPrice
        }
    }
}
