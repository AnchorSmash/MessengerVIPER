//
//  ChatsFactory.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation
import Fakery

class ChatsFactory {
    func fakeDialogs(number: Int) -> [Chat] {
        var outArray = [Chat]()
        let faker = Faker(locale: "ru")
        let singleChatFactory = SingleChatFactory()
        for _ in 0..<number {
            let user = User(id: faker.number.randomInt(),
                            name: faker.name.firstName() + " " + faker.name.lastName())
            let messages = singleChatFactory.fakeUserMessages(number: faker.number.randomInt(min: 10, max: 20), user: user)
            let chat = Chat(id: faker.number.randomInt(), user: user, messages: messages)
            outArray.append(chat)
        }
        outArray.sort { $0.messages.last?.date ?? Date() > $1.messages.last?.date ?? Date() }
        return outArray
    }
}

