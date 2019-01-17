//
//  SingleChatFactory.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation
import Fakery

class SingleChatFactory {
    func fakeUserMessages(number: Int, user: User) -> [UserMessage] {
        var outArray = [UserMessage]()
        let faker = Faker(locale: "ru")
        for _ in 0..<number {
            var finalUser = user
            if(faker.number.randomBool()) {
                finalUser = SelfUser.user
            }
            let message = UserMessage(id: faker.number.randomInt(),
                                      user: finalUser,
                                      text: faker.lorem.sentence(),
                                      date: Date(timeInterval: faker.number.randomDouble(),
                                      since: Calendar.current.date(byAdding: .day, value: -1, to: Date())!))
            outArray.append(message)
        }
        outArray.sort { $0.date > $1.date }
        return outArray
    }
}
