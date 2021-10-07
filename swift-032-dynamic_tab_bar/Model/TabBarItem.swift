//
//  TabBarItem.swift
//  swift-032-dynamic_tab_bar
//
//  Created by Luiz Carlos da Silva Araujo on 06/10/21.
//

import Foundation

struct TabBarItem: Codable {
    let storyboardName  : String
    let controllerName  : String
    let image           : String
    let selectedImage   : String
    let order           : Int
    let title           : String
}
