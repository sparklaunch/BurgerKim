//
//  Item.swift
//  BurgerKim
//
//  Created by Jinwook Kim on 6/7/24.
//

import SwiftUI

struct Item: Identifiable, Codable {
    var id = UUID()
    let type: ItemType
    let name: String
    let imageName: String
    var price: Double
    let isRecommended: Bool
    let isNew: Bool
    let isSpicy: Bool
    var comboType = ComboType.single
    var finalPrice: Double {
        switch comboType {
            case .single:
                price
            case .combo:
                price + 800
            case .largeCombo:
                price + 1_600
        }
    }
}

extension Item {
    static let items = [
        Item(type: .burger, name: "오리지널스 아보카도 잭 싱글", imageName: "OriginalsAvocadoJackSingle", price: 8_000, isRecommended: true, isNew: true, isSpicy: false),
        Item(type: .burger, name: "오리지널스 아보카도 잭 더블", imageName: "OriginalsAvocadoJackDouble", price: 8_800, isRecommended: true, isNew: true, isSpicy: false),
        Item(type: .burger, name: "통새우 맥시멈 2", imageName: "RawShrimpMaximum2", price: 7_600, isRecommended: true, isNew: true, isSpicy: false),
        Item(type: .burger, name: "통새우 맥시멈 3", imageName: "RawShrimpMaximum3", price: 8_200, isRecommended: false, isNew: true, isSpicy: false),
        Item(type: .burger, name: "통새우 맥시멈 4", imageName: "RawShrimpMaximum4", price: 8_800, isRecommended: false, isNew: true, isSpicy: false),
        Item(type: .burger, name: "블랙 바비큐 콰트로 치즈 와퍼", imageName: "BlackBarbecueQuatroCheeseWhopper", price: 8_600, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "블랙 바비큐 와퍼", imageName: "BlackBarbecueWhopper", price: 8_200, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "몬스터 와퍼", imageName: "MonsterWhopper", price: 7_600, isRecommended: true, isNew: false, isSpicy: true),
        Item(type: .burger, name: "베이컨 치즈 와퍼", imageName: "BaconCheeseWhopper", price: 6_400, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "콰트로 치즈 와퍼", imageName: "QuatroCheeseWhopper", price: 6_200, isRecommended: true, isNew: false, isSpicy: false),
        Item(type: .burger, name: "통새우 와퍼", imageName: "RawShrimpWhopper", price: 6_800, isRecommended: true, isNew: false, isSpicy: true),
        Item(type: .burger, name: "불맛 더블 치즈 버거", imageName: "FiryDoubleCheeseBurger", price: 6_400, isRecommended: true, isNew: true, isSpicy: false),
        Item(type: .burger, name: "불맛 더블 치즈 앤 베이컨 버거", imageName: "FiryDoubleCheeseAndBaconBurger", price: 6_800, isRecommended: true, isNew: true, isSpicy: false),
        Item(type: .burger, name: "불맛 더블 치즈 버거 주니어", imageName: "FiryDoubleCheeseBurgerJunior", price: 5_800, isRecommended: false, isNew: true, isSpicy: false),
        Item(type: .burger, name: "치즈 와퍼", imageName: "CheeseWhopper", price: 5_600, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "갈릭 불고기 와퍼", imageName: "GarlicBulgogiWhopper", price: 6_000, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "와퍼", imageName: "Whopper", price: 5_400, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "불고기 와퍼", imageName: "BulgogiWhopper", price: 5_600, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "핫 칠리 러버", imageName: "HotChiliLover", price: 6_400, isRecommended: false, isNew: false, isSpicy: true),
        Item(type: .burger, name: "핫 칠리 러버 더블", imageName: "HotChiliLoverDouble", price: 7_200, isRecommended: false, isNew: false, isSpicy: true),
        Item(type: .burger, name: "핫 칠리 러버 몬스터", imageName: "HotChiliLoverMonster", price: 7_800, isRecommended: false, isNew: false, isSpicy: true),
        Item(type: .burger, name: "와퍼 주니어", imageName: "WhopperJunior", price: 4_800, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "불고기 와퍼 주니어", imageName: "BulgogiWhopperJunior", price: 5_400, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "치즈 와퍼 주니어", imageName: "CheeseWhopperJunior", price: 5_000, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "콰트로 치즈 와퍼 주니어", imageName: "QuatroCheeseWhopperJunior", price: 5_600, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "통새우 와퍼 주니어", imageName: "RawShrimpWhopperJunior", price: 5_800, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "더블 비프 불고기 버거", imageName: "DoubleBeefBulgogiBurger", price: 4_800, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "치킨킹 BLT", imageName: "ChickenKingBLT", price: 7_600, isRecommended: false, isNew: false, isSpicy: true),
        Item(type: .burger, name: "치킨킹", imageName: "ChickenKing", price: 6_800, isRecommended: false, isNew: false, isSpicy: true),
        Item(type: .burger, name: "비프 & 슈림프 버거", imageName: "Beef&ShrimpBurger", price: 6_000, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "통새우 슈림프 버거", imageName: "RawShrimpShrimpBurger", price: 5_800, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "슈림프 버거", imageName: "ShrimpBurger", price: 5_200, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "롱 치킨 버거", imageName: "LongChickenBurger", price: 5_000, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "치킨 버거", imageName: "ChickenBurger", price: 5_600, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "BLT 오믈렛 킹 모닝", imageName: "BLTOmeletteKingMorning", price: 7_600, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "오믈렛 킹 모닝", imageName: "OmeletteKingMorning", price: 6_800, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "비프 불고기 버거", imageName: "BeefBulgogiBurger", price: 4_400, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .burger, name: "치즈 버거", imageName: "CheeseBurger", price: 4_200, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .side, name: "리얼 어니언 링", imageName: "RealOnionRing", price: 3_200, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .side, name: "너겟킹 8 조각", imageName: "NuggetKing8Pieces", price: 4_000, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .side, name: "너겟킹", imageName: "NuggetKing", price: 2_000, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .side, name: "21 치즈 스틱", imageName: "21CheeseStick", price: 3_000, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .side, name: "바삭킹", imageName: "CrispyKing", price: 1_600, isRecommended: false, isNew: false, isSpicy: true),
        Item(type: .side, name: "바삭킹 8 조각 + 소스", imageName: "CrispyKing8Pieces+Sauce", price: 6_600, isRecommended: false, isNew: false, isSpicy: true),
        Item(type: .side, name: "쉐이킹 프라이", imageName: "ShakingFries", price: 3_600, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .side, name: "크리미 모짜 볼", imageName: "CreamyMozzaBall", price: 4_400, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .side, name: "코코넛 슈림프 + 스위트 칠리 소스", imageName: "CoconutShrimp+SweetChiliSauce", price: 3_000, isRecommended: false, isNew: false, isSpicy: true),
        Item(type: .side, name: "프렌치 프라이", imageName: "FrenchFries", price: 2_400, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .side, name: "코울슬로", imageName: "Coleslaw", price: 3_200, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .side, name: "콘 샐러드", imageName: "CornSalad", price: 2_600, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .side, name: "사이드 소스", imageName: "SideSauce", price: 2_000, isRecommended: false, isNew: false, isSpicy: true),
        Item(type: .side, name: "시즈닝", imageName: "Seasonings", price: 1_600, isRecommended: false, isNew: false, isSpicy: true),
        Item(type: .dessert, name: "설향 딸기 선데", imageName: "SeolhyangStrawberrySundae", price: 2_900, isRecommended: false, isNew: true, isSpicy: false),
        Item(type: .beverage, name: "기라델리 딥초코 핫", imageName: "GiradeliDeepChocoHot", price: 3_600, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .beverage, name: "아메리카노", imageName: "Americano", price: 2_000, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .beverage, name: "코카콜라", imageName: "CocaCola", price: 1_800, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .beverage, name: "코카콜라 제로", imageName: "CocaColaZero", price: 1_800, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .beverage, name: "스프라이트", imageName: "Sprite", price: 1_800, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .beverage, name: "스프라이트 제로", imageName: "SpriteZero", price: 1_800, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .beverage, name: "미닛메이드 오렌지", imageName: "MinuteMaidOrange", price: 2_600, isRecommended: false, isNew: false, isSpicy: false),
        Item(type: .beverage, name: "순수 (미네랄워터)", imageName: "MineralWater", price: 1_500, isRecommended: false, isNew: false, isSpicy: false)
    ]
}
