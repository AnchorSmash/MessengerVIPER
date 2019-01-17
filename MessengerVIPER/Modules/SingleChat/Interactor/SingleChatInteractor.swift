//
//  SingleChatInteractor.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation

class SingleChatInteractor {
    private var interactorOutput: SingleChatInteractorOutput!
    private var chat: Chat?
}

extension SingleChatInteractor: SingleChatInteractorInput {
    var output: SingleChatInteractorOutput {
        get {
            return interactorOutput
        }
        set {
            return interactorOutput = newValue
        }
    }
    
    func insertMessage(message: UserMessage) {
        chat?.messages.append(message)
        guard let chatUnwrapped = chat else {
            return
        }
        interactorOutput.updateChat(chat: chatUnwrapped)
    }
    
    func initChat(chat: Chat) {
        self.chat = chat
    }
}


