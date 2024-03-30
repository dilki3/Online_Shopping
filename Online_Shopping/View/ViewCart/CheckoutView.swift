//
//  CheckoutView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-20.
//

import SwiftUI

struct CheckoutView: View {
    @Binding var isShow: Bool
    @StateObject var cartVM = CartViewModel.shared
    @State private var showOrderAccepted = false

    var body: some View {
        VStack {
            
            Spacer()
            VStack{
                HStack{
                    
                    Text("Checkout")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                        .foregroundColor(Color(hex: "#8349D0"))
                    Spacer()
                    
                    Button {
                        $isShow.wrappedValue = false
                    } label: {
                        Image("close")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 17, height: 17)
                    }
                    
                    
                }
                .padding(.top, 30)
                
                Divider()
                
                
                VStack{
                    HStack {
                        Text("Type")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.black)
                            .frame(height: 46)
                        
                        Spacer()
                        
                        Picker("",  selection: $cartVM.deliveryType) {
                            Text("Delivery").tag(1)
                            Text("Collection").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 180)
                    }
                    
                    Divider()
                    
                    if(cartVM.deliveryType == 1) {
                        
                        NavigationLink {
                            DeliveryAddressView(isPicker: true, didSelect: {
                               aObj in
                              cartVM.deliverObj = aObj
                            } )
                        } label: {
                            HStack {
                                Text("Delivery Address")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.black)
                                    .frame(height: 46)
                                
                                Spacer()
                                
                                Text( cartVM.deliverObj?.name ?? "Select Address")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                    .frame(height: 46)
                                
                                Image("next")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 17, height: 17)
                                    .foregroundColor(.primaryText)
                                
                            }
                        }

                        
                        
                        Divider()
                    }
                    
                    
                    HStack {
                        Text("Payment Type")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.black)
                            .frame(height: 46)
                        
                        Spacer()
                        
                        Picker("",  selection: $cartVM.paymentType) {
                            Text("COD").tag(1)
                            Text("Online").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 150)
                    }
                    
                    Divider()
                    if(cartVM.paymentType == 2) {
                        
                        NavigationLink {
                            PaymentMethodsView(isPicker: true, didSelect: {
                                pObj in
                                cartVM.paymentObj = pObj
                            } )
                        } label: {
                            HStack {
                                Text("Payment")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.secondaryText)
                                    .frame(height: 46)
                                
                                Spacer()
                                
                                Image("master")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 20)
                                
                                Text( cartVM.paymentObj?.cardNumber ?? "Select")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                    .frame(height: 46)
                                
                                Image("next")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 17, height: 17)
                                    .foregroundColor(.primaryText)
                                
                            }
                        }
                        
                        Divider()
                    }
                    
                    NavigationLink {
                        PromoCodeView(isPicker: true, didSelect: {
                            pObj in
                            cartVM.promoObj = pObj
                        })
                    } label: {
                        HStack {
                            Text("Coupon")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.black)
                                .frame(height: 46)
                            
                            Spacer()
                            
                            
                            
                            Text( cartVM.promoObj?.code  ?? "Pick Discount")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.primaryText)
                                .frame(height: 46)
                            
                            Image("next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 17, height: 17)
                                .foregroundColor(.primaryText)
                            
                        }
                    }
                    
                    Divider()
                }
                
                VStack(spacing:2){
                    HStack {
                        Text("Total")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("$ \(cartVM.total)")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.black)
                    }
                    
                    HStack {
                        Text("Delivery Cost")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("+ $ \(cartVM.deliverPriceAmount)")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.black)
                    }
                    
                    HStack {
                        Text("Discount")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("- $ \(cartVM.discountAmount)")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.red)
                    }
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 15)
                
                HStack {
                    Text("Final Total")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(Color(hex: "#8349D0"))
                        .frame(height: 46)
                    
                    Spacer()
                    
                    
                    
                    Text("$\(cartVM.userPayAmount)")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.primaryText)
                        .frame(height: 46)
                    
                    Image("next")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 17, height: 17)
                        .foregroundColor(.primaryText)
                    
                }
                Divider()
                
                VStack(){
                    Text("By continuing you agree to our")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack{
                        
                        Text("Terms of Service")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        
                        Text(" and ")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.secondaryText)
                        
                        
                        Text("Privacy Policy.")
                            .font(.customfont(.semibold, fontSize: 14))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                    }
                   
                    
                }
                //.frame(alignment: .center)
                .padding(.vertical, .screenWidth * 0.03)
                .padding(.bottom, 10)
                
              
                RoundButton(title: "Place Order") {
                       cartVM.serviceCallOrderPlace()
                    showOrderAccepted = true
                }
                NavigationLink(destination: OrderAccpetView(), isActive: $showOrderAccepted) {
                    EmptyView()
                }
                .hidden()
                
                .padding(.bottom, .bottomInsets + 100)
            }
            .padding(.horizontal, 20)
            .background(Color.white)
            .cornerRadius(20, corner: [.topLeft, .topRight])
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    @State static var isShow: Bool = false;
    static var previews: some View {
        NavigationView {
            CheckoutView(isShow:$isShow)
        }
        
    }
}
