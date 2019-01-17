//
//  ChatsViewProtocols.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation

protocol ChatsViewInput: class {
    var presenterInput: ChatsPresenterInput { get set }
    
    func updateChats(chats: [Chat])
}
