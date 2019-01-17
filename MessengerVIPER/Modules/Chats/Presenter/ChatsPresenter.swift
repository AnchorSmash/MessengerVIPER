//
//  ChatsPresenter.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation
import MessageInputBar

class ChatsPresenter {
    private var presenterOutput: ChatsPresenterOutput!
    private weak var view: ChatsViewInput!
    private var interactor: ChatsInteractorInput!
}

extension ChatsPresenter: ChatsPresenterInput {
    var output: ChatsPresenterOutput {
        get {
            return presenterOutput
        }
        set {
            presenterOutput = newValue
        }
    }
    
    var viewInput: ChatsViewInput {
        get {
            return view
        }
        set {
            view = newValue
        }
    }
    
    var interactorInput: ChatsInteractorInput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
    
    func setSingleChatPresenterOutput(singleChatViewController: SingleChatViewController) {
        singleChatViewController.presenterInput.output = self
    }
}

extension ChatsPresenter: ChatsInteractorOutput {
    func recived(chats: [Chat]) {
        view.updateChats(chats: chats)
    }
}

extension ChatsPresenter: SingleChatPresenterOutput {
    func updateChat(chat: Chat) {
        interactor.updateChat(chat: chat)
    }
}
