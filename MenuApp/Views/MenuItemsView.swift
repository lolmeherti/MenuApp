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
    
    //SORTING ARGUMENT
    @State var sortingArgument:SortingBy = .Alphabetically
    
    //--- GRID CONFIG ---//
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        //--- MOCK DATA ---//
        //these could have been implemented as dependency injections
        //however I felt it was too much to make a dependency injection container
        //for a little project like this. these are the only dependencies
        let mainDishes = MenuViewViewModel().generateMenuItems(category: MenuCategory.Food, amount: 12, sortingArgument)
        let drinks = MenuViewViewModel().generateMenuItems(category: MenuCategory.Drink, amount: 8, sortingArgument)
        let desserts = MenuViewViewModel().generateMenuItems(category: MenuCategory.Dessert, amount: 4, sortingArgument)
        
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
                
                    //-- RENDERING MAIN DISHES --//
                    renderMenuItems(mainDishes, color: .blue)
                }
                
                //--- DRINKS SECTION ---//
                if(drinkFilter)
                {
                    HStack{
                        Text("Drinks")
                            .font(.system(size: 20))
                            .bold()
                        Spacer()
                    }
                    .padding()
                    
                    //-- RENDERING DRINKS --//
                    renderMenuItems(drinks, color: .purple)
                }
                
                //--- DESSERTS SECTION ---//
                if(dessertFilter)
                {
                    HStack{
                        Text("Desserts")
                            .font(.system(size: 20))
                            .bold()
                        Spacer()
                    }
                    .padding()
                    
                    //-- RENDERING DESSERTS --//
                    renderMenuItems(desserts, color: .pink)
                    
                }
                Spacer()
            }
            .padding()
            .toolbar { //NavigationBar
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: MenuItemsOptionView(foodFilter: $foodFilter,
                                                        drinkFilter: $drinkFilter,
                                                        dessertFilter: $dessertFilter,
                                                        sortingArgument: $sortingArgument),
                        label: {
                            Image(systemName: "line.3.horizontal")
                        })
                }
            }
            .navigationTitle("Menu")
        }
    }

    //how does it work?
    //clearly we are taking an array of RestaurantMenuItem instances in the first param.
    //then we are taking a color
    func renderMenuItems(_ itemsArray:[RestaurantMenuItem], color: Color) -> LazyVGrid<ForEach<[RestaurantMenuItem], RestaurantMenuItem, some View>> {
        return LazyVGrid(columns: threeColumnGrid) {
            //we are rendering a lazy grid containing a MenuItemSquare for each item in the array
            //because this is a closure, the foreach loop will first complete
            //and then all the rendered MenuItemSquares get returned
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
