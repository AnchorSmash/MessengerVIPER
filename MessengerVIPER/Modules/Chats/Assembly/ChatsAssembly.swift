//
//  ChatsAssembly.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation
import UIKit

class ChatsAssembly {
    func build() -> (controller: UIViewController, presenter: ChatsPresenterInput)? {
        let storyboard = UIStoryboard(name: "ChatsStoryboard", bundle: nil)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "kChatsNavigationControllerIdentifier")
        guard let navigationVC = rootVC as? UINavigationController,
            let chatsVC = navigationVC.viewControllers.first as? ChatsViewController else { return nil }
        
        let presenter = ChatsPresenter()
        let interactor = ChatsInteractor()
        
        chatsVC.presenterInput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = chatsVC
        interactor.output = presenter
        
        return (controller: navigationVC, presenter: presenter)
    }
}
