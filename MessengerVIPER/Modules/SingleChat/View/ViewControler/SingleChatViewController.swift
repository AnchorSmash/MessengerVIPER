//
//  SingleChatViewController.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//
import Foundation
import UIKit
import MessageKit
import MessageInputBar
import InitialsImageView
import Fakery

class SingleChatViewController: MessagesViewController {
    var chat: Chat?
    private var presenter: SingleChatPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.delegate = self
        DispatchQueue.main.async {
            self.messagesCollectionView.scrollToBottom(animated: false)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(
            self.keyboardNotification(notification:)), name: UIResponder
                .keyboardWillChangeFrameNotification, object: nil)
    }
}

extension SingleChatViewController: SingleChatViewInput {
    var presenterInput: SingleChatPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
    
    func updateChat(chat: Chat) {
        self.chat = chat
        
        messagesCollectionView.performBatchUpdates({
            messagesCollectionView.insertSections([chat.messages.count - 1])
            if (chat.messages.count) >= 2 {
                messagesCollectionView.reloadSections([chat.messages.count - 2])
            }
        }, completion: { [weak self] _ in
            if self?.isLastSectionVisible() == true {
                self?.messagesCollectionView.scrollToBottom(animated: true)
            }
        })
    }
}

extension SingleChatViewController {
    func configureAvatarView(_ avatarView: AvatarView,
                             for message: MessageType,
                             at indexPath: IndexPath,
                             in messagesCollectionView: MessagesCollectionView) {
        avatarView.setImageForName(message.sender.displayName,
                                   circular: true,
                                   textAttributes: nil)
    }
}

extension SingleChatViewController {
    @objc func keyboardNotification(notification: NSNotification) {
        DispatchQueue.main.async {
            self.messagesCollectionView.scrollToBottom(animated: true)
        }
    }
}

extension SingleChatViewController {
    func isLastSectionVisible() -> Bool {
        
        guard (chat?.messages.isEmpty ?? false) else { return false }
        
        let lastIndexPath = IndexPath(item: 0, section: (chat?.messages.count ?? 0) - 1)
        
        return messagesCollectionView.indexPathsForVisibleItems.contains(lastIndexPath)
    }
}
extension SingleChatViewController: MessagesDataSource {
    func currentSender() -> Sender {
        return Sender(id: "\(SelfUser.user.id)", displayName: SelfUser.user.name)
    }
    
    func messageForItem(at indexPath: IndexPath,
                        in messagesCollectionView: MessagesCollectionView) -> MessageType {
        guard let message = chat?.messages[indexPath.section] else {
            fatalError("Erorr. Message not found")
        }
        return message
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return chat?.messages.count ?? 0
    }
    
    
}

extension SingleChatViewController: MessagesLayoutDelegate {
    
}

extension SingleChatViewController: MessagesDisplayDelegate {
    
}


extension SingleChatViewController: MessageInputBarDelegate {
    
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        presenter.insertMessage(inputBar: inputBar)
        inputBar.inputTextView.text = String()
        messagesCollectionView.scrollToBottom(animated: true)
    }
    
}
