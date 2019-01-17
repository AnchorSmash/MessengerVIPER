//
//  SingleChatAssembly.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation

class SingleChatAssembly {
    func build(viewController: SingleChatViewController) -> SingleChatPresenterInput? {
        let presenter = SingleChatPreseneter()
        let interactor = SingleChatInteractor()
        
        viewController.presenterInput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = viewController
        interactor.output = presenter
        
        return presenter
    }
}

