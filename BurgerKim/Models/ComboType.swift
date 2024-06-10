//
//  ComboType.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/10/24.
//

import Foundation

enum ComboType: String, CaseIterable, Codable {
    case single = "단품"
    case combo = "세트"
    case largeCombo = "라지 세트"
}
