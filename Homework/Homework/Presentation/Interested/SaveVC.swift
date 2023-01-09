//
//  SaveVC.swift
//  Homework
//
//  Created by 조재훈 on 2023/01/08.
//

import UIKit

class SaveVC: BaseVC {
    @IBOutlet weak var saveTableView: UITableView!
    
    private var saveList: [Restaurant] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        fetch()
    }
    
}

extension SaveVC {
    private func attribute() {
        let cell = UINib(nibName: "RestaurantCell", bundle: nil)
        saveTableView.register(cell, forCellReuseIdentifier: "RestaurantCell")
        
    }
    private func fetch() {
        Network.init().getRastaurantList(path: "save", successHandler: { list in
            self.saveList = list
            self.saveTableView.reloadData()
            
        }, failedHandler: { error in
            self.onRestaurantNetError(error: error)
        })
    }
}


// MARK: - TableView Control
extension SaveVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saveList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
        
        let model = saveList[indexPath.row]
        
        cell.bind(model)
        
        return cell
    }
    
    
}

extension SaveVC: UITableViewDelegate {
}
