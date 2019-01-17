//
//  SingleChatViewProtocols.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation

protocol SingleChatViewInput: class {
    var presenterInput: SingleChatPresenterInput { get set }
    func updateChat(chat: Chat)
}
