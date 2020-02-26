//
//  ViewController.swift
//  SOLIDprincip
//
//  Created by Ivan Nikitin on 17.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataFetchService = DataFetcherService()
    
    var tableView = UITableView()
    
    var model: Model?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.frame, style: .plain)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        dataFetchService.fetchLocalData {(model) in
            self.model = model
            tableView.reloadData()
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.feed.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        if let model = model {
            cell.textLabel?.text = model.feed.results[indexPath.row].name
        }
        return cell
    }
    
    
}

