//
//  ChatsInteractor.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation

class ChatsInteractor {
    private var interactorOutput: ChatsInteractorOutput!
    private var dataSource = [Chat]()
}

extension ChatsInteractor: ChatsInteractorInput {
    var output: ChatsInteractorOutput {
        get {
            return interactorOutput
        }
        set {
           interactorOutput = newValue
        }
    }
    
    func getChats() {
        let chatsFactory = ChatsFactory()
        dataSource = chatsFactory.fakeDialogs(number: 30)
        interactorOutput.recived(chats: dataSource)
    }
    
    func updateChat(chat: Chat) {
        guard let chatIndex = dataSource.firstIndex( where: {$0.id == chat.id} ) else {
            return
        }
        dataSource.remove(at: chatIndex)
        dataSource.append(chat)
        dataSource.sort { $0.messages.last?.date ?? Date() > $1.messages.last?.date ?? Date() }
        interactorOutput.recived(chats: dataSource)
    }
    
    
}
