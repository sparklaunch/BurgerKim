//
//  ItemType.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/7/24.
//

import Foundation

enum ItemType: String, CaseIterable, Codable {
    case burger = "버거"
    case beverage = "음료"
    case dessert = "디저트"
    case side = "사이드"
}
