//
//  ChatsInteractorProtocols.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation

protocol ChatsInteractorInput: class {
    var output: ChatsInteractorOutput { get set }
    func getChats()
    func updateChat(chat: Chat)
}

protocol ChatsInteractorOutput {
    func recived(chats: [Chat])
}
