//
//  SingleChatPresenter.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation
import MessageInputBar
import Fakery

class SingleChatPreseneter {
    private var presenterOutput: SingleChatPresenterOutput!
    private weak var view: SingleChatViewInput!
    private var interactor: SingleChatInteractorInput!
}

extension SingleChatPreseneter: SingleChatPresenterInput {
    
    func insertMessage(inputBar: MessageInputBar) {
        let faker = Faker(locale: "ru")
        
        for component in inputBar.inputTextView.components {
            if let str = component as? String {
                let message = UserMessage(id: faker.number.randomInt(), user: SelfUser.user, text: str, date: Date())
                interactor.insertMessage(message: message)
                
            }
        }
    }
    
    var output: SingleChatPresenterOutput {
        get {
            return presenterOutput
        }
        set {
            presenterOutput = newValue
        }
    }
    
    var viewInput: SingleChatViewInput {
        get {
            return view
        }
        set {
            view = newValue
        }
    }
    
    var interactorInput: SingleChatInteractorInput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
}

extension SingleChatPreseneter: SingleChatInteractorOutput {
    func updateChat(chat: Chat) {
        view.updateChat(chat: chat)
        output.updateChat(chat: chat)
    }
    
    
}

    

