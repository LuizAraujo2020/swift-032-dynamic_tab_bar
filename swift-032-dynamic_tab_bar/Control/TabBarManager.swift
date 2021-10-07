//
//  TabBarManager.swift
//  swift-032-dynamic_tab_bar
//
//  Created by Luiz Carlos da Silva Araujo on 06/10/21.
//

import Foundation
import UIKit

class TabBarManager {
    var tabBarItems = [TabBarItem]()
    
    init(){}
    
    func getViewControllersFromJSON() -> [UIViewController] {
        tabBarItems = Bundle.main.decode(type: [TabBarItem].self, from: "TabBar.json")
        let viewControllers = tabBarItems
            .sorted { $0.order < $1.order }
            .compactMap { toViewController(for: $0) }
        return viewControllers
    }
    
    private func toViewController(for item: TabBarItem) -> UIViewController {
        let tabBarItem = UITabBarItem(
            title: item.title,
            image: UIImage(systemName: item.image),
            selectedImage: UIImage(systemName: item.selectedImage)
        )
        tabBarItem.tag = item.order
        
        let viewController = UIStoryboard(name: item.storyboardName, bundle: Bundle(path: "DynamicTabBar")).instantiateViewController(identifier: item.controllerName)
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }
    
}

extension Bundle {
    func decode<T: Codable>(type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in Bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from Bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from Bundle")
        }
        
        return loaded
    }
}
