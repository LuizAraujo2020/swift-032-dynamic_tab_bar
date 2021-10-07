//
//  TabBarController.swift
//  swift-032-dynamic_tab_bar
//
//  Created by Luiz Carlos da Silva Araujo on 06/10/21.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    let tabBarManager = TabBarManager()
    
    let customTabBarView: UIView = {

        let view = UIView(frame: .zero)

        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true

        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -8.0)
        view.layer.shadowOpacity = 0.12
        view.layer.shadowRadius = 10.0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = tabBarManager.getViewControllersFromJSON()
        
        self.delegate = self

        addCustomTabBarView()
        hideTabBarBorder()
//        setupTabBar()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        customTabBarView.frame = tabBar.frame
    }

    override func viewDidAppear(_ animated: Bool) {
        var newSafeArea = UIEdgeInsets()

        newSafeArea.bottom += customTabBarView.bounds.size.height
        self.children.forEach({$0.additionalSafeAreaInsets = newSafeArea})
    }

    private func addCustomTabBarView() {
        customTabBarView.frame = tabBar.frame
        view.addSubview(customTabBarView)
        view.bringSubviewToFront(self.tabBar)
    }

    func hideTabBarBorder()  {
        let tabBar = self.tabBar
        tabBar.backgroundImage = UIImage.from(color: .clear)
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true
    }

//    func setupTabBar() {
//        self.setViewControllers([tab1, tab2, tab3], animated: false)
//        self.viewDidLayoutSubviews()
//    }
}

extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
