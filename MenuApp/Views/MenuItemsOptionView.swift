//
//  MenuItemsOptionView.swift
//  MenuApp
//
//  Created by Alex H. on 20.12.22.
//

import SwiftUI

struct MenuItemsOptionView: View {
    
    @Binding var foodFilter:Bool
    @Binding var drinkFilter:Bool
    @Binding var dessertFilter:Bool
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Button(action: {
                        // handle selection of "Food" category
                    }) {
                        Text(MenuCategory.Food.rawValue)
                    }
                    Button(action: {
                        // handle selection of "Drink" category
                    }) {
                        Text(MenuCategory.Drink.rawValue)
                    }
                    Button(action: {
                        // handle selection of "Desert" category
                    }) {
                        Text(MenuCategory.Dessert.rawValue)
                    }
                } header: {
                    Text("SELECTED CATEGORIES")
                }
                
                Section {
                    Button(action: {
                        // handle selection of "Most Popular" option
                    }) {
                        Text(SortingBy.MostPopular.rawValue)
                    }
                    Button(action: {
                        // handle selection of "Price $-$$$" option
                    }) {
                        Text(SortingBy.Price.rawValue)
                    }
                    Button(action: {
                        // handle selection of "A-Z" option
                    }) {
                        Text(SortingBy.Alphabetically.rawValue)
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

struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionView()
    }
}
