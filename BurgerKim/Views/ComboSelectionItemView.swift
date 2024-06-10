//
//  ComboSelectionItemView.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/10/24.
//

import SwiftUI

struct ComboSelectionItemView: View {
    let item: Item
    let comboType: ComboType
    private var imageName: String {
        switch comboType {
            case .single:
                item.imageName
            case .combo:
                "\(item.imageName)Combo"
            case .largeCombo:
                "\(item.imageName)Combo"
        }
    }
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
            Text(comboType.rawValue)
                .font(.title.bold())
        }
    }
}

#Preview {
    ComboSelectionItemView(item: Item.items.first!, comboType: .combo)
}
