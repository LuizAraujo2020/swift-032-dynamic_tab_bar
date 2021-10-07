//
//  TabBarController.swift
//  swift-032-dynamic_tab_bar
//
//  Created by Luiz Carlos da Silva Araujo on 06/10/21.
//

import UIKit

class TabBarController: UITabBarController {
    let tabBarManager = TabBarManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = tabBarManager.getViewControllersFromJSON()
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
