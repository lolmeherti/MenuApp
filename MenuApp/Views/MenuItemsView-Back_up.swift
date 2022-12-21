////
////  MenuItemsView.swift
////  MenuApp
////
////  Created by Alex H. on 20.12.22.
////
//
//import SwiftUI
//
//struct MenuItemsView: View {
//
//    //--- MOCK DATA ---//
//    let mainDishes = MenuItemsController().generateMenuItems(category: TypeOfFood.Food, amount: 12)
//    let drinks = MenuItemsController().generateMenuItems(category: TypeOfFood.Drink, amount: 8)
//    let desserts = MenuItemsController().generateMenuItems(category: TypeOfFood.Dessert, amount: 4)
//
//    //--- GRID CONFIG ---//
//    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
//
//    var body: some View {
//        NavigationView {//NavigationView
//            ScrollView{
//                HStack{
//                    Text("Main Dishes")
//                        .font(.system(size: 20))
//                        .bold()
//                    Spacer()
//                }
//                .padding()
//                .padding(.top, -20)
//
//                //--- MAIN DISHES SECTION ---//
//                renderMenuItems(mainDishes, color: .blue)
//
//                //--- DRINKS SECTION ---//
//                HStack{
//                    Text("Drinks")
//                        .font(.system(size: 20))
//                        .bold()
//                    Spacer()
//                }
//                .padding()
//
//                renderMenuItems(drinks, color: .purple)
//
//                //--- DESSERTS SECTION ---//
//                HStack{
//                    Text("Desserts")
//                        .font(.system(size: 20))
//                        .bold()
//                    Spacer()
//                }
//                .padding()
//
//                renderMenuItems(desserts, color: .pink)
//
//                Spacer()
//            }
//            .padding()
//            .toolbar { //NavigationBar
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink(
//                        destination: MenuItemsOptionView(),
//                        label: {
//                            Image(systemName: "menucard")
//                        })
//                }
//            }
//            .navigationTitle("Menu")
//        }
//    }
//
//    func renderMenuItems(_ itemsArray:[RestaurantMenuItem], color: Color) -> LazyVGrid<ForEach<[RestaurantMenuItem], RestaurantMenuItem, some View>> {
//        return LazyVGrid(columns: threeColumnGrid) {
//            ForEach(itemsArray, id: \.self) { menuItem in
//                NavigationLink(destination: MenuItemDetailsView(menuItem: menuItem)) {
//                    VStack
//                    {
//                        MenuItemSquare(itemName: menuItem.name, itemCategory: menuItem.category)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding(.vertical, 50)
//                    .background(color,
//                                in: RoundedRectangle(cornerRadius: 8, style:.continuous))
//                }
//            }
//        }
//    }
//}
//
//struct MenuItemsView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuItemsView()
//    }
//}
