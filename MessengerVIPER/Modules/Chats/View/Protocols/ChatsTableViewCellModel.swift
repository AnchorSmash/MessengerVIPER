//
//  ChatsTableViewCellModel.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation

protocol ChatsTableViewCellModel {
    var userName: String { get }
    var lastMessageTitle: String { get }
    var lastMessageDatePrettyPrinted: String { get }
}
