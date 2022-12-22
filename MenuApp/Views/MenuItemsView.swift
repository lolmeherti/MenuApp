//
//  MenuItemsView.swift
//  MenuApp
//
//  Created by Alex H. on 20.12.22.
//

import SwiftUI

struct MenuItemsView: View {
    //--- FILTERS ---//
    @State var foodFilter:Bool = true
    @State var drinkFilter:Bool = true
    @State var dessertFilter:Bool = true
    
    //--- MOCK DATA ---//
    let mainDishes = MenuViewViewModel().generateMenuItems(category: MenuCategory.Food, amount: 12)
    let drinks = MenuViewViewModel().generateMenuItems(category: MenuCategory.Drink, amount: 8)
    let desserts = MenuViewViewModel().generateMenuItems(category: MenuCategory.Dessert, amount: 4)
    
    //--- GRID CONFIG ---//
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {//NavigationView
            ScrollView{
                
                //-- IF ALL DISPLAY OPTIONS ARE OFF --//
                if(!foodFilter && !drinkFilter && !dessertFilter)
                {
                    Text("No food section selected!")
                }
                
                //--- MAIN DISHES SECTION ---//
                if(foodFilter)
                {
                HStack{
                    Text("Main Dishes")
                        .font(.system(size: 20))
                        .bold()
                    Spacer()
                }
                .padding()
                .padding(.top, -20)
                
                //--- MAIN DISHES SECTION ---//
                renderMenuItems(mainDishes, color: .blue)
                
                //--- DRINKS SECTION ---//
                HStack{
                    Text("Drinks")
                        .font(.system(size: 20))
                        .bold()
                    Spacer()
                }
                .padding()
                
                renderMenuItems(drinks, color: .purple)
                
                //--- DESSERTS SECTION ---//
                HStack{
                    Text("Desserts")
                        .font(.system(size: 20))
                        .bold()
                    Spacer()
                }
                .padding()
                
                renderMenuItems(desserts, color: .pink)
                
                Spacer()
            }
            .padding()
            .toolbar { //NavigationBar
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: MenuItemsOptionView(),
                        label: {
                            Image(systemName: "line.3.horizontal")
                        })
                }
            }
            .navigationTitle("Menu")
        }
    }

    func renderMenuItems(_ itemsArray:[RestaurantMenuItem], color: Color) -> LazyVGrid<ForEach<[RestaurantMenuItem], RestaurantMenuItem, some View>> {
        return LazyVGrid(columns: threeColumnGrid) {
            ForEach(itemsArray, id: \.self) { menuItem in
                NavigationLink(destination: MenuItemDetailsView(menuItem: menuItem)) {
                    VStack
                    {
                        MenuItemSquare(itemName: menuItem.name, itemCategory: menuItem.category)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 50)
                    .background(color,
                                in: RoundedRectangle(cornerRadius: 8, style:.continuous))
                }
            }
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
