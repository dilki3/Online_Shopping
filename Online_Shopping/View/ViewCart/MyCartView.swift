//
//  MyCartView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-19.
//

import SwiftUI

struct MyCartView: View {
   
    @StateObject var cartVM = CartViewModel.shared
    var body: some View {
        ZStack{
           
            if(cartVM.listArr.count == 0){
                VStack{
                    Image("hurry")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .frame(width: 200, height: 200)
                    
                    Text("Your Cart is Empty")
                        .font(.customfont(.bold, fontSize: 20))
                }
            }
            
            ScrollView{
                LazyVStack {
                    ForEach( cartVM.listArr , id: \.id, content: {
                        cObj in
                        
                        CartItemRow(cObj: cObj)
                        
                    })
                    .padding(.vertical, 8)
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)
                
            }
            
            
            VStack {
                
                HStack{
                    
                    Spacer()
                    Image(systemName: "cart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.purple)
                                .padding(.horizontal,3)
                    
                    Text("My Cart")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                }
                .padding(.top, .topInsets)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
                if(cartVM.listArr.count > 0) {
                    Button {
                        cartVM.showCheckout = true
                    } label: {
                        ZStack {
                            Text("Check Out")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            HStack {
                                Spacer()
                                Text("$\(cartVM.total)")
                                    .font(.customfont(.semibold, fontSize: 12))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .background(Color.darkGray.opacity(0.2))
                                    .cornerRadius(5)
                            }
                            .padding(.trailing)
                        }
                        
                    }
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                    .background( Color.primaryApp)
                    .cornerRadius(20)
                    .padding(.horizontal, 20)
                    .padding(.bottom, .bottomInsets + 80)
                    
                    
                }
                
            }
            if(cartVM.showCheckout) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            cartVM.showCheckout = false
                        }
                    }
                
                CheckoutView(isShow: $cartVM.showCheckout )
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
        }
        .onAppear{
            cartVM.serviceCallList()
        }
        .background( NavigationLink(destination: OrderAccpetView(), isActive: $cartVM.showOrderAccept , label: {
            EmptyView()
        }) )
        .alert(isPresented: $cartVM.showError, content: {
            Alert(title: Text(Links.AppName), message: Text(cartVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
      
        .animation(.easeInOut, value: cartVM.showCheckout)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        MyCartView()
    }
   
}
