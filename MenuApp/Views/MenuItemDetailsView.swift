//
//  MenuItemDetailsView.swift
//  MenuApp
//
//  Created by Alex H. on 20.12.22.
//

import SwiftUI

struct MenuItemDetailsView: View {
    
    var menuItem:RestaurantMenuItem
    
    var body: some View {
        ScrollView{
            HStack{
                Text(menuItem.name)
                    .padding(.leading)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            
            VStack(alignment: .center) {
                Image("Little_Lemon_logo")
                    .resizable()
                    .frame(width:250,height:450)
                Text("Price:")
                    .font(.headline)
                Text("$\(menuItem.price, specifier: "%.2f")")
                Text("Ordered:")
                    .font(.headline)
                Text("\(menuItem.timesOrdered)")
                Text("Ingredients:")
                    .font(.headline)
                ForEach(menuItem.ingredients, id: \.self) { ingredient in
                    Text(ingredient.rawValue)
                }
            }
        }
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailsView(menuItem: RestaurantMenuItem(name: "ablabla", price: 15.5, category: MenuCategory.Drink, ingredients: [Ingredients.Carrot], timesOrdered: 50))
    }
}
