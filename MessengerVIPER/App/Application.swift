//
//  Application.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 15/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Properties

class Application {
    private let modulesCoordinator: ModulesCoordinator!
    
    init() {
        modulesCoordinator = ModulesCoordinator()
    }
}

// MARK: - Initialization

extension Application {
    func fire() -> UIViewController {
        return modulesCoordinator.rootModuleController()
    }
}

