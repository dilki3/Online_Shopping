//
//  FavouriteView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-17.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavouriteView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
   // @StateObject var itemsVM = CartViewModel.shared
    @StateObject var favVM = FavouriteViewModel.shared
    var didAddCart: ( ()->() )?
    var body: some View {
        ZStack{
            
            ScrollView{
                LazyVStack {
                    ForEach( favVM.listArr , id: \.id, content: {
                        fObj in
                        
                        FavouriteRow(fObj: fObj,didAddCart: {
                            CartViewModel.serviceCallAddToCart(prodId: fObj.prodId, qty: 1) { isDone, msg in
                                
                                self.favVM.errorMessage = msg
                                self.favVM.showError = true
                            }
                        })
                        
                    })
                }
                .padding(10)
                .padding(.top, .topInsets + 45)
                .padding(.bottom, .bottomInsets + 60)
            
            }
            VStack {
                    
                HStack{
                   
                    Spacer()
                    
                    Text("Favorites")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Image(systemName: "heart.fill")
                               .font(.system(size: 24))
                               .foregroundColor(.red)
                    Spacer()

                }
                .padding(.top, .topInsets)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
                
                RoundButton(title: "Add All To Cart")
                    .padding(.horizontal, 20)
                    .padding(.bottom, .bottomInsets + 80)
                    .onTapGesture {
                                      
                      // itemsVM.serviceCallUpdateQty(cObj: CartItemModel, newQty: <#T##Int#>)
                    }
                
            }
            
            
            
        }
        .onAppear{
            favVM.serviceCallList()
            
           
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        FavouriteView()
    }
}
