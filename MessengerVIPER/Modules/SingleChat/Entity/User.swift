//
//  User.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation

struct User {
    let id: Int
    let name: String
}

class SelfUser {
    static let user = User(id: 1, name: "NickName")
}
