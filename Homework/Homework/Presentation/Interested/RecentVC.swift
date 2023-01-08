//
//  RecentVC.swift
//  Homework
//
//  Created by 조재훈 on 2023/01/08.
//

import UIKit

class RecentVC: UIViewController {
    @IBOutlet weak var recentTableView: UITableView!
    
    private var recentlyList: [Restaurant] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        fetch()

    }

}

extension RecentVC {
    private func attribute() {
        let cell = UINib(nibName: "RestaurantCell", bundle: nil)
        recentTableView.register(cell, forCellReuseIdentifier: "RestaurantCell")
        
    }
    private func fetch() {
        Network.init().getRastaurantList(path: "recent", successHandler: { list in
            self.recentlyList = list
            self.recentTableView.reloadData()
            
        }, failedHandler: { errorRes in
            debugPrint("@@@ error type: \(errorRes)")
            debugPrint("@@@ error message: \(errorRes.message)")
            
        })
    }
}

extension RecentVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentlyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
        
        let model = recentlyList[indexPath.row]
        
        cell.bind(model)
        
        return cell
    }
    
    
}

extension RecentVC: UITableViewDelegate {
    
}
