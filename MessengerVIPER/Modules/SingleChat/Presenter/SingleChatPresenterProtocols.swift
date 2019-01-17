//
//  SingleChatPresenterProtocols.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation
import MessageInputBar

protocol SingleChatPresenterInput: class {
    var output: SingleChatPresenterOutput { get set }
    var viewInput: SingleChatViewInput { get set }
    var interactorInput: SingleChatInteractorInput { get set }
    func insertMessage(inputBar: MessageInputBar)
}

protocol SingleChatPresenterOutput: class {
    func updateChat(chat: Chat)
}
