//
//  ComboSelectionView.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/10/24.
//

import SwiftUI

struct ComboSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(Cart.self) private var cart
    @State private var showingAlert = false
    let gridItems = [GridItem(.adaptive(minimum: 150))]
    let item: Item
    var body: some View {
        VStack {
            Text("세트 메뉴 선택")
                .font(.largeTitle.bold())
            LazyVGrid(columns: gridItems) {
                ForEach(ComboType.allCases, id: \.rawValue) { comboType in
                    Button {
                        addToCart(item, comboType: comboType)
                    } label: {
                        ComboSelectionItemView(item: item, comboType: comboType)
                    }
                    .foregroundStyle(.primary)
                }
            }
        }
        .alert("추가되었습니다", isPresented: $showingAlert) {
            Button("OK") {
                dismiss()
            }
        }
    }
    func addToCart(_ item: Item, comboType: ComboType) {
        var addedItem = item
        addedItem.comboType = comboType
        cart.items.append(addedItem)
        showingAlert = true
    }
}

#Preview {
    ComboSelectionView(item: Item.items.first!)
        .environment(Cart())
}
