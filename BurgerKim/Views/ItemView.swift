//
//  ItemView.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/7/24.
//

import SwiftUI

struct ItemView: View {
    let item: Item
    var body: some View {
        VStack {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
            Text(item.name)
                .font(.headline)
            Text(item.finalPrice.formatted(.currency(code: "KRW")))
        }
    }
}

#Preview {
    ItemView(item: Item.items.first!)
}
