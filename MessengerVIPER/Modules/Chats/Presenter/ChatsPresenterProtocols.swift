//
//  ChatsPresenterProtocols.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation

protocol ChatsPresenterInput: class {
    var output: ChatsPresenterOutput { get set }
    var viewInput: ChatsViewInput { get set }
    var interactorInput: ChatsInteractorInput { get set }
    func setSingleChatPresenterOutput(singleChatViewController: SingleChatViewController)
}

protocol ChatsPresenterOutput: class {
    func selected(chat: Chat, singleChatViewController: SingleChatViewController)
}
