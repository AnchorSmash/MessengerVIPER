//
//  SingleChatInteractorProtocols.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation

protocol SingleChatInteractorInput: class {
    var output: SingleChatInteractorOutput { get set }
    func insertMessage(message: UserMessage)
    func initChat(chat: Chat)
}

protocol SingleChatInteractorOutput: class {
    func updateChat(chat: Chat)
}
