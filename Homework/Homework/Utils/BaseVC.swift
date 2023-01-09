//
//  BaseVC.swift
//  Homework
//
//  Created by 조재훈 on 2023/01/09.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func onRestaurantNetError(error: RestaurantNetError) {
        
        let controller = UIAlertController(title: nil, message: error.message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        controller.addAction(okAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(controller, animated: true, completion: nil)
    }

}
