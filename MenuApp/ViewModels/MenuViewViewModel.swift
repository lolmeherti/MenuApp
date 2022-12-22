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
    //the way it works is by passing in an enum case for MenuCategory.
    //usage example generateMenuItems(category: TypeOfFood.Drink, amount: 10)
    //it generates 10 unique drinks for the menu
    //we can also pass an enum case for sortingBy
    //usage example generateMenuItems(category: TypeOfFood.Drink, amount: 10, sortingArgument: SortingBy.Price)
    //then it will sort the list in ascending order from smallest price to highest
    func generateMenuItems(category:MenuCategory, amount:Int,_ sortingArgument:SortingBy = SortingBy.Alphabetically) -> [RestaurantMenuItem]
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
        return sortMenuItems(menuItems, sortingArgument)
    }
    
    func pickRandomIngredients() -> [Ingredients]
    {
        var randomIngredients:[Ingredients] = []
        
        for _ in 0..<4{
            randomIngredients.append(Ingredients.allCases.randomElement()!)
        }
        
        return Array(Set(randomIngredients))
    }
    
    func sortMenuItems(_ menuItems:[RestaurantMenuItem], _ sortingArgument:SortingBy) -> [RestaurantMenuItem]
    {
        switch(sortingArgument)
        {
        case SortingBy.Alphabetically:
            return menuItems.sorted{$0.name < $1.name}
        case SortingBy.Price:
            return menuItems.sorted{$0.price < $1.price}
        case SortingBy.MostPopular:
            return menuItems.sorted{$0.timesOrdered > $1.timesOrdered}
        }
    }
}
