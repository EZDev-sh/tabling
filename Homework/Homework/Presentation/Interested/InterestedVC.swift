//
//  InterestedVC.swift
//  Homework
//
//  Created by 조재훈 on 2023/01/07.
//

import UIKit
import Tabman
import Pageboy

class InterestedVC: TabmanViewController {
    
    private let menus: [String] = ["저장", "최근본"]
    private var pages: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        data()
        attribute()
    }

}

// MARK: - Setup
extension InterestedVC {
    private func data() {
        let saveVC = SaveVC.instantiate(appStoryboard: .Home)
        let recentVC = RecentVC.instantiate(appStoryboard: .Home)
        
        [saveVC, recentVC].forEach { vc in
            pages.append(vc)
        }
    }
    
    private func attribute() {
        self.dataSource = self
        let menuBar = TMBar.ButtonBar()
        
        menuBar.layout.transitionStyle = .snap
        menuBar.layout.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        menuBar.backgroundView.style = .clear
        menuBar.indicator.tintColor = .black
        
        menuBar.buttons.customize { btn in
            btn.tintColor = .systemGray
            btn.selectedTintColor = .black
        }
        
        addBar(menuBar, dataSource: self, at: .top)
        
    }
}

// MARK: - TabMenu
extension InterestedVC: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return pages.count
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return pages[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        return .at(index: 0)
    }
    
    func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
        return TMBarItem(title: menus[index])
    }
    
    
}
