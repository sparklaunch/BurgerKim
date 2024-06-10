//
//  MissingView.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/10/24.
//

import SwiftUI

struct MissingView: View {
    var body: some View {
        ContentUnavailableView("페이지를 찾을 수 없음", systemImage: "xmark.circle")
    }
}

#Preview {
    MissingView()
}
