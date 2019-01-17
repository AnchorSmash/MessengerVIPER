//
//  Chats.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation

struct Chat {
    let id: Int
    let user: User
    var messages: [UserMessage]
    
    var prettyDiscription: String {
        return user.name + " " + (messages.last?.text ?? "")
    }
}

extension Chat: ChatsTableViewCellModel {
    var userName: String {
        return user.name
    }
    
    var lastMessageTitle: String {
        return messages.last?.text ?? ""
    }
    
    var lastMessageDatePrettyPrinted: String {
        guard let messageDate = messages.last?.date else {
            return ""
        }
        let dateFormatter = DateFormatter()
        if(Calendar.current.isDateInToday(messageDate)) {
            dateFormatter.dateFormat = "HH:mm"
        }
        else {
            dateFormatter.dateFormat = "dd.MM"
        }
        
        return dateFormatter.string(from: messageDate)
    }
}
