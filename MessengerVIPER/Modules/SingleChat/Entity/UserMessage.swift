//
//  UserMessage.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation
import MessageKit

struct UserMessage {
    let id: Int
    let user: User
    let text: String
    let date: Date
}

extension UserMessage: MessageType {
    var sender: Sender {
        return Sender(id: "\(user.id)", displayName: user.name)
    }
    
    var messageId: String {
        return "\(id)"
    }
    
    var sentDate: Date {
        return date
    }
    
    var kind: MessageKind {
        return MessageKind.text(text)
    }
    
    
}
