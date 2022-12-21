//
//  MenuItemsController.swift
//  MenuApp
//
//  Created by Alex H. on 20.12.22.
//

import Foundation

//handles logic for view to improve code clarity
class MenuViewViewModel
{
    init()
    {
        //empty for now
    }
    
    //basically i want this function to generate menu items
    //the way it works is by passing in an enum case.
    //usage example generateMenuItems(category: TypeOfFood.Drink, amount: 10)
    //it generates 10 unique drinks for the menu
    func generateMenuItems(category:MenuCategory, amount:Int) -> [RestaurantMenuItem]
    {
        var menuItems:[RestaurantMenuItem] = []
        
        for number in 1...amount
        {
            menuItems.append(RestaurantMenuItem(name:"\(category) \(number)",
                                                price: Double.random(in: 5.0 ..< 150.0),
                                                category: category,
                                                ingredients: pickRandomIngredients(),
                                                timesOrdered: Int.random(in:0 ..< 400)))
        }
        return menuItems
    }
    
    func pickRandomIngredients() -> [Ingredients]
    {
        var randomIngredients:[Ingredients] = []
        
        for _ in 0..<4{
            randomIngredients.append(Ingredients.allCases.randomElement()!)
        }
        
        return Array(Set(randomIngredients))
    }
}
