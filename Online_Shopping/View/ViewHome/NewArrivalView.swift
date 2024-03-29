//
//  NewArrivalView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-25.
//

import SwiftUI

struct NewArrivalView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var homeVM = HomeViewModel.shared
    @State private var isFilterMenuVisible = false
    @State private var selectedSortOption = SortOption.priceAscending
    var columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
        
    ]
    
    var body: some View {
        ZStack{
            VStack {
                
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 21, height: 21)
                    }
                    
                    
                    Text( "New Arrivals" )
                        .font(.customfont(.bold, fontSize: 19))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    
                    Picker(selection: $selectedSortOption, label: Text("Sort By")) {
                        Text("Price: Low to High").tag(SortOption.priceAscending)
                        Text("Price: High to Low").tag(SortOption.priceDescending)
                    }
                    .frame(width: 200)
                    .pickerStyle(MenuPickerStyle())
                    .foregroundColor(.black)
                    .accentColor(.black)
                    .onChange(of: selectedSortOption) { newValue in
  
                        homeVM.filterByPriceNew(ascending: newValue == .priceAscending)
                    }
                    
                }
                
                ScrollView {
                    LazyVGrid(columns: columns,spacing: 15) {
                        
                        ForEach(homeVM.bestArr, id: \.id){
                            pObj in
                            
                            ProductCell(pObj:pObj, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                }
                            })
                        }

                    }
                    .padding(.vertical, 15)
                    .padding(.bottom, .bottomInsets + 60)
                }
            }
            .padding(.top, .topInsets)
            .padding(.horizontal,10)
        }
        .alert(isPresented: $homeVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(homeVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        NewArrivalView()
    }
}
