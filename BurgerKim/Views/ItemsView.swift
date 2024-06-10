//
//  ItemsView.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/7/24.
//

import SwiftUI

struct ItemsView: View {
    @Environment(Cart.self) private var cart
    @State private var showingCart = false
    @State private var viewModel = ViewModel()
    @State private var showingAlert = false
    @State private var path = NavigationPath()
    let columns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.items) { item in
                        if item.type == .burger {
                            NavigationLink {
                                ComboSelectionView(item: item)
                            } label: {
                                ItemView(item: item)
                            }
                            .foregroundStyle(.primary)
                        } else {
                            Button {
                                addToCart(item)
                            } label: {
                                ItemView(item: item)
                            }
                            .foregroundStyle(.primary)
                        }
                    }
                }
            }
            .navigationTitle("전체 메뉴")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cart", systemImage: "cart") {
                        showingCart = true
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Picker("필터", selection: $viewModel.filteredBy) {
                        ForEach(ItemType.allCases, id: \.rawValue) { itemType in
                            Text(itemType.rawValue)
                                .tag(itemType)
                        }
                    }
                }
            }
            .sheet(isPresented: $showingCart) {
                CartView() {
                    viewModel.filteredBy = .burger
                    path.append("CheckOut")
                }
            }
            .alert("추가되었습니다", isPresented: $showingAlert) {
            }
            .navigationDestination(for: String.self) { destination in
                switch destination {
                    case "CheckOut":
                        CheckOutView(path: $path)
                    case "Success":
                        SuccessView(path: $path)
                    default:
                        MissingView()
                }
            }
        }
    }
    func addToCart(_ item: Item) {
        cart.items.append(item)
        showingAlert = true
    }
}

#Preview {
    ItemsView()
        .environment(Cart())
}
