//
//  ChatsViewController.swift
//  MessengerVIPER
//
//  Created by ShadowMoon on 17/01/2019.
//  Copyright © 2019 Виктор Кулаков. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {
    private var presenter: ChatsPresenterInput!
    @IBOutlet weak var tableView: UITableView!
    
    
    private let kChatsTableViewCellNib = UINib(nibName: "ChatsTableViewCell", bundle: nil)
    private let kChatsTableViewCellReuseIdentifier = "kChatsTableViewCellNib"
    
    private var dataSource = [Chat]()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.interactorInput.getChats()
        setUpUI()
    }
}

extension ChatsViewController: ChatsViewInput {
    var presenterInput: ChatsPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
    
    func updateChats(chats: [Chat]) {
        dataSource = chats
        tableView.reloadData()
    }
}

extension ChatsViewController {
    private func setUpUI() {
        tableView.register(kChatsTableViewCellNib,
                           forCellReuseIdentifier: kChatsTableViewCellReuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: kChatsTableViewCellReuseIdentifier,
                                          for: indexPath) as? ChatsTableViewCell else {
                                            return UITableViewCell()
        }
        cell.viewModel = dataSource[indexPath.row]
        return cell
    }
}

extension ChatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToChat", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ChatsViewController{

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToChat" {
        guard let rowIndex = tableView.indexPathForSelectedRow?.row else {
            return
        }
        presenter.output.selected(chat: dataSource[rowIndex], singleChatViewController: (segue.destination as! SingleChatViewController))
        }
    }
}
