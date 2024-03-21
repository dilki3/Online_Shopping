//
//  ExploreItemsView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-19.
//

import SwiftUI

struct ExploreItemsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var itemsVM = ExploreItemViewModel(catObj: ExploreCategoryModel (dict: [:]))
    
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
                            .frame(width: 25, height: 25)
                    }
                    
                    
                    Text( itemsVM.cObj.name )
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    
                    
                    Button {
                    } label: {
                        Image("filter_ic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                }
                
                ScrollView {
                    LazyVGrid(columns: columns,spacing: 15) {
                        
                        ForEach(itemsVM.listArr, id: \.id) {
                            pObj in
                            ProductCell( pObj: pObj, width:.infinity) {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.itemsVM.errorMessage = msg
                                    self.itemsVM.showError = true
                                    
                                }
                            }
                        }
                    }
                    .padding(.vertical, 20)
                    .padding(.bottom, .bottomInsets + 60)
                }
            }
            .padding(.top, .topInsets)
            .padding(.horizontal,10)
        }
        .alert(isPresented: $itemsVM.showError, content: {
         Alert(title: Text(Globs.AppName), message: Text(itemsVM.errorMessage), dismissButton: .default(Text("OK")) )
         })
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
                ] ) ))
            }
            
        }
}
