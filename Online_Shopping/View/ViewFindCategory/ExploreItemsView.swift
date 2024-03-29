//
//  ExploreItemsView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-19.
//

import SwiftUI

struct ExploreItemsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var itemsVM = ExploreItemViewModel(catObj: ExploreCategoryModel(dict: [:]))
    @State private var isFilterMenuVisible = false
    @State private var selectedSortOption = SortOption.priceAscending

    var columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    Text(itemsVM.cObj.name)
                        .font(.customfont(.bold,fontSize: 20))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal,10)
                    
                    
                    // Picker for filter
                    Picker(selection: $selectedSortOption, label: Text("Sort By")) {
                        Text("Price: Low to High").tag(SortOption.priceAscending)
                        Text("Price: High to Low").tag(SortOption.priceDescending)
                    }
                    .frame(width: 200)
                    .pickerStyle(MenuPickerStyle()) // Use MenuPickerStyle for dropdown appearance
                    .foregroundColor(.black)
                    .accentColor(.black)// Set text color to black
                    .onChange(of: selectedSortOption) { newValue in
                        // Call filterByPrice function based on the selected sorting option
                        itemsVM.filterByPrice(ascending: newValue == .priceAscending)
                    }
                }
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(itemsVM.listArr, id: \.id) { pObj in
                            ProductCell(pObj: pObj, width: .infinity) {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    self.itemsVM.errorMessage = msg
                                    self.itemsVM.showError = true
                                }
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.bottom, .bottomInsets + 60)
                }
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 15)
        }
        .alert(isPresented: $itemsVM.showError) {
            Alert(title: Text(Links.AppName), message: Text(itemsVM.errorMessage), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}


struct ExploreItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExploreItemsView(itemsVM: ExploreItemViewModel(catObj: ExploreCategoryModel(dict: [
                "type_id": 4,
                "type_name": "T-shirt",
                "image": "http://localhost:3001/img/type/20240319110139139TM7OyE2NOk.png",
                "color": "49D083"
            ])))
        }
    }
}

enum SortOption {
    case priceAscending
    case priceDescending
}
