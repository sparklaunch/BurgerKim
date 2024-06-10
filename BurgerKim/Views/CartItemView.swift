//
//  CartItemView.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/10/24.
//

import SwiftUI

struct CartItemView: View {
    let item: Item
    private var itemName: String {
        switch item.comboType {
            case .single:
                "\(item.name) 단품"
            case .combo:
                "\(item.name) 세트"
            case .largeCombo:
                "\(item.name) 라지 세트"
        }
    }
    var body: some View {
        HStack {
            if item.comboType != .single {
                Image("\(item.imageName)Combo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
            } else {
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
            }
            VStack(alignment: .leading) {
                Text(itemName)
                    .font(.title3)
                Text(item.finalPrice.formatted(.currency(code: "KRW")))
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    CartItemView(item: Item.items.first!)
}
