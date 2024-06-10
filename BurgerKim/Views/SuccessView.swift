//
//  SuccessView.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/10/24.
//

import SwiftUI

struct SuccessView: View {
    @Binding var path: NavigationPath
    var body: some View {
        VStack {
            Image(systemName: "checkmark.diamond")
                .font(.largeTitle.bold())
                .foregroundStyle(.green)
                .padding()
            Text("결제에 성공하였습니다.")
                .font(.largeTitle.bold())
            Button("처음으로 가기", action: goHome)
                .buttonStyle(.borderedProminent)
        }
        .navigationBarBackButtonHidden()
    }
    func goHome() {
        path = NavigationPath()
    }
}

#Preview {
    SuccessView(path: .constant(NavigationPath()))
}
