//
//  MenuItemsOptionView.swift
//  MenuApp
//
//  Created by Alex H. on 20.12.22.
//

import SwiftUI

struct MenuItemsOptionView: View {
    
    //--- BINDING FILTER VARIABLES ---//
    @Binding var foodFilter:Bool
    @Binding var drinkFilter:Bool
    @Binding var dessertFilter:Bool
    
    //--- BINDING SORTING ARGUMENT ---//
    @Binding var sortingArgument:SortingBy
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Button(action: {
                        // handle selection of "Food" category
                        foodFilter.toggle()
                    }) {
                        HStack{
                            Text(MenuCategory.Food.rawValue)
                            foodFilter ? Image(systemName: "checkmark") : Image(systemName: "")
                        }
                    }
                    Button(action: {
                        // handle selection of "Drink" category
                        drinkFilter.toggle()
                    }) {
                        HStack{
                            Text(MenuCategory.Drink.rawValue)
                            drinkFilter ? Image(systemName: "checkmark") : Image(systemName: "")
                        }
                    }
                    Button(action: {
                        // handle selection of "Desert" category
                        dessertFilter.toggle()
                    }) {
                        HStack{
                            Text(MenuCategory.Dessert.rawValue)
                            dessertFilter ? Image(systemName: "checkmark") : Image(systemName: "")
                        }
                    }
                } header: {
                    Text("SELECTED CATEGORIES")
                }
                
                Section {
                    Button(action: {
                        // handle selection of "Most Popular" option
                        sortingArgument = SortingBy.MostPopular
                    }) {
                        HStack{
                            Text(SortingBy.MostPopular.rawValue)
                            sortingArgument == SortingBy.MostPopular ? Image(systemName: "checkmark") : Image(systemName: "")
                        }
                    }
                    Button(action: {
                        // handle selection of "Price $-$$$" option
                        sortingArgument = SortingBy.Price
                    }) {
                        HStack{
                            Text(SortingBy.Price.rawValue)
                            sortingArgument == SortingBy.Price ? Image(systemName: "checkmark") : Image(systemName: "")
                        }
                    }
                    Button(action: {
                        // handle selection of "A-Z" option
                        sortingArgument = SortingBy.Alphabetically
                    }) {
                        HStack{
                            Text(SortingBy.Alphabetically.rawValue)
                            sortingArgument == SortingBy.Alphabetically ? Image(systemName: "checkmark") : Image(systemName: "")
                        }
                        
                    }
                } header: {
                    Text("SORT BY")
                }
            }
            .navigationTitle("Filter")
            .listStyle(.insetGrouped)
        }
    }
}

//struct MenuItemsOptionView_Previews: PreviewProvider {
//    static var previews: some View {
////        MenuItemsOptionView()
//    }
//}
