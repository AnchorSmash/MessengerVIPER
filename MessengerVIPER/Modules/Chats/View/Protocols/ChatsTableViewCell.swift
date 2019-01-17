//
//  ChatsTableViewCell.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 16/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import UIKit
import InitialsImageView

class ChatsTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNammeLabel: UILabel!
    @IBOutlet weak var lastMessageTextLabel: UILabel!
    @IBOutlet weak var lastMessageDateLabel: UILabel!
    
    var viewModel: ChatsTableViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            avatarImageView.setImageForName(viewModel.userName, circular: true, textAttributes: nil)
            userNammeLabel.text = viewModel.userName
            lastMessageTextLabel.text = viewModel.lastMessageTitle
            lastMessageDateLabel.text = viewModel.lastMessageDatePrettyPrinted
        }
    }
}
