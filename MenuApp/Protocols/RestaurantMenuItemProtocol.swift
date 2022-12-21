//
//  MenuItemProtocol.swift
//  MenuApp
//
//  Created by Alex H. on 20.12.22.
//

import Foundation

protocol RestaurantMenuItemProtocol
{
    var id: UUID { get }
        var name: String { get }
        var price: Double { get set}
        var category: MenuCategory { get }
        var ingredients: [Ingredients] { get set}
        var timesOrdered: Int { get set}
}
