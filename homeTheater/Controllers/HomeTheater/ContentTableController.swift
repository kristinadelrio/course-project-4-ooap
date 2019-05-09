//
//  ContentTableController.swift
//  homeTheater
//
//  Created by Kristina Del Rio Albrechet on 5/9/19.
//  Copyright © 2019 Kristina Del Rio Albrechet. All rights reserved.
//

import UIKit

class ContentTableController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var isVideoContent: Bool = false
    
    private var contents = [Content]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 1
        tableView.rowHeight = UITableView.automaticDimension
        contents = isVideoContent ? MoviesRepository.get() : SongsRepository.get()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? ContentController {
            controller.content = sender as? Content
            controller.isVideoContent = isVideoContent
        }
    }
    
    private func present(content: Content) {
        performSegue(withIdentifier: "ShowContent", sender: content)
    }
}

extension ContentTableController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath)
        cell.textLabel?.text = contents[indexPath.row].title
        return cell
    }
    
    
}
extension ContentTableController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        present(content: contents[indexPath.row])
    }
}
