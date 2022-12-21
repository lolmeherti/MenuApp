//
//  MenuItemSquare.swift
//  MenuApp
//
//  Created by Alex H. on 20.12.22.
//

import SwiftUI
//it started out as a square, now its no longer a square
//the naming will stay
struct MenuItemSquare: View {
    var itemName:String
    var itemCategory:MenuCategory
    
    var body: some View {
        switch(itemCategory)
        {
        case MenuCategory.Drink:
            VStack
            {
                Image(systemName: "wineglass")
                    .resizable()
                    .frame(width: 70, height: 90, alignment: .center)
                    .font(.largeTitle.weight(.thin))
                    .accentColor(.white)
                Text(itemName)
                    .accentColor(.white)
            }
        case MenuCategory.Food:
            VStack
            {
                Image(systemName: "fork.knife")
                    .resizable()
                    .frame(width: 70, height: 90, alignment: .center)
                    .accentColor(.white)
                Text(itemName)
                    .accentColor(.white)
            }
        case MenuCategory.Dessert:
            VStack
            {
                Image(systemName: "birthday.cake")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 90, alignment: .center)
                    .font(.largeTitle.weight(.thin))
                    .accentColor(.white)
                Text(itemName)
                    .accentColor(.white)
            }
        }
    }
}

struct MenuItemSquare_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemSquare(itemName: "example",
                       itemCategory: MenuCategory.Drink)
    }
}
