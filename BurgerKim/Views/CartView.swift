//
//  CartView.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/7/24.
//

import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(Cart.self) var cart: Cart
    var goToCheckOutView: (() -> Void)?
    var body: some View {
        VStack {
            HStack {
                EditButton()
                    .padding()
                Spacer()
                Button("Close") {
                    dismiss()
                }
                .padding()
            }
            List {
                ForEach(cart.items) { item in
                    CartItemView(item: item)
                }
                .onDelete(perform: deleteItems)
            }
            Text("Total: \(cart.totalPrice.formatted(.currency(code: "KRW")))")
                .font(.title.bold())
            Button {
                dismiss()
                goToCheckOutView?()
            } label: {
                Text("결제")
                    .font(.largeTitle.bold())
            }
        }
    }
    func deleteItems(at offsets: IndexSet) {
        cart.items.remove(atOffsets: offsets)
    }
}

#Preview {
    CartView()
        .environment(Cart())
}
