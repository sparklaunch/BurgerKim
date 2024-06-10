//
//  CheckOutView.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/10/24.
//

import SwiftUI
import Combine

struct CheckOutView: View {
    @Environment(Cart.self) private var cart
    @State private var selectedPaymentOption = PaymentOption.cash
    @State private var cardName = ""
    @State private var cardNumber = ""
    @State private var expiredDate = Date.now
    @State private var cvc = ""
    @State private var zipCode = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @Binding var path: NavigationPath
    var body: some View {
        List {
            Section("결제 방식을 선택하세요") {
                Picker("결제 방식", selection: $selectedPaymentOption.animation(.bouncy)) {
                    ForEach(PaymentOption.allCases, id: \.rawValue) { paymentOption in
                        Text(paymentOption.rawValue)
                            .tag(paymentOption)
                    }
                }
            }
            Section("총액") {
                Text(cart.totalPrice, format: .currency(code: "KRW"))
            }
            if selectedPaymentOption == .card {
                Section("카드 결제") {
                    TextField("성함", text: $cardName)
                        .keyboardType(.namePhonePad)
                        .textContentType(.creditCardName)
                    TextField("카드 번호", text: $cardNumber)
                        .keyboardType(.numberPad)
                        .textContentType(.creditCardNumber)
                        .onReceive(Just(cardNumber)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.cardNumber = filtered
                                        }
                                    }
                    HStack {
                        DatePicker("유효 기간", selection: $expiredDate, in: .now..., displayedComponents: .date)
                            .textContentType(.creditCardExpiration)
                            .labelsHidden()
                        TextField("CVC", text: $cvc)
                            .keyboardType(.numberPad)
                            .textContentType(.creditCardSecurityCode)
                            .onReceive(Just(cvc)) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.cvc = filtered
                                            }
                                        }
                        TextField("Zip code", text: $zipCode)
                            .onReceive(Just(zipCode)) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.zipCode = filtered
                                            }
                                        }
                            .keyboardType(.numberPad)
                            .textContentType(.postalCode)
                    }
                }
            }
            Button("결제", action: checkout)
        }
        .alert("결제 오류", isPresented: $showingAlert) {

        } message: {
            Text(alertMessage)
        }
        .navigationTitle("결제")
    }
    func checkout() {
        if selectedPaymentOption == .card {
            guard !cardName.isEmpty else {
                showingAlert = true
                alertMessage = "성함을 입력해주세요"
                return
            }
            guard !cardNumber.isEmpty else {
                showingAlert = true
                alertMessage = "카드 번호를 입력해주세요"
                return
            }
            guard cardNumber.count == 16 else {
                showingAlert = true
                alertMessage = "올바른 카드 번호를 입력해주세요"
                return
            }
            guard expiredDate > .now else {
                showingAlert = true
                alertMessage = "유효 기간이 지난 카드입니다"
                return
            }
            guard !cvc.isEmpty else {
                showingAlert = true
                alertMessage = "CVC 코드를 입력해주세요"
                return
            }
            guard !zipCode.isEmpty else {
                showingAlert = true
                alertMessage = "Zip Code를 입력해주세요"
                return
            }
        }
        cart.items.removeAll()
        path.append("Success")
    }
}

#Preview {
    NavigationStack {
        CheckOutView(path: .constant(NavigationPath()))
            .environment(Cart())
    }
}
