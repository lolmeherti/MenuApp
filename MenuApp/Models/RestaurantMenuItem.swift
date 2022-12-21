//
//  RestaurantMenuItem.swift
//  MenuApp
//
//  Created by Alex H. on 20.12.22.
//

import Foundation

//note to self: i wasn't sure whether to go with struct vs class here
struct RestaurantMenuItem: RestaurantMenuItemProtocol, Hashable
{
    //each menu item will have these properties
    var id:UUID = UUID()
    var name: String
    var price: Double
    var category: MenuCategory
    var ingredients: [Ingredients]
    var timesOrdered: Int
    
    //each time the item is ordered, increment times ordered
    //this was made before I had a controller for the project
    //and it remains here
    mutating func incrementTimesOrdered()
    {
        self.timesOrdered += 1
    }
}
