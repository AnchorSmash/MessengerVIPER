//
//  ModulesCoordinator.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 15/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import UIKit

class ModulesCoordinator {
    private var chatsPresenter: ChatsPresenterInput!
    
    func rootModuleController() -> UIViewController {
        let chatsAssembly = ChatsAssembly()
        guard let chats = chatsAssembly.build() else { return UIViewController() }
        chats.presenter.output = self
        chatsPresenter = chats.presenter
        return chats.controller
    }
}

extension ModulesCoordinator: ChatsPresenterOutput {
    func selected(chat: Chat, singleChatViewController: SingleChatViewController) {
        singleChatViewController.chat = chat
        let singleChatAssembly = SingleChatAssembly()
        guard singleChatAssembly.build(viewController: singleChatViewController) != nil else { return }
        singleChatViewController.presenterInput.interactorInput.initChat(chat: chat)
        chatsPresenter.setSingleChatPresenterOutput(singleChatViewController: singleChatViewController)
        
    }
}
