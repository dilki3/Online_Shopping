//
//  AccountView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-19.
//

import SwiftUI

struct AccountView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var myVM1 = MainViewModel.shared
    var body: some View {
        ZStack{
            VStack{
               Divider()
                Divider()
                HStack(spacing: 15) {
                               Image("profile")
                                   .resizable()
                                   .frame(width: 60, height: 60)
                                   .cornerRadius(30)
                               
                    VStack(spacing:3){
                                   HStack{
                                       Text(myVM1.userObj.username)
                                           .font(.customfont(.bold, fontSize: 20))
                                           .foregroundColor(.primaryText)
                                       
                                       Image(systemName: "edit")
                                           .foregroundColor(.primaryApp)
                                       
                                       Spacer()
                                   }
                                   
                                   Text(myVM1.userObj.email)
                                       .font(.customfont(.regular, fontSize: 16))
                                       .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                       .accentColor(.secondaryText)
                               }
                           }
                        .padding()
                           .background(Color.white)
                           .overlay(
                               RoundedRectangle(cornerRadius: 1)
                                .stroke(Color(hex: "#8349D0"), lineWidth: 0.5)
                           )
                
                //.padding(.horizontal, 20)
                .padding(.top, .topInsets)
                
              
                
                ScrollView {
                    LazyVStack {
                        VStack{
                           
                            NavigationLink {
                                MyDetailsView()
                            } label: {
                                AccountRow(title: "My Details", icon: "a_my_detail")
                            }
                            
                            
                            NavigationLink {
                                MyOrdersView()
                            } label: {
                                AccountRow(title: "My Orders", icon: "a_order")
                            }
                            
                            
                            NavigationLink {
                               DeliveryAddressView()
                            } label: {
                                AccountRow(title: "Delivery Address", icon: "a_delivery_address")
                            }
                            
                            
                            NavigationLink {
                                PaymentMethodsView()
                            } label: {
                                AccountRow(title: "Payment Methods", icon: "paymenth_methods")
                            }

                            NavigationLink {
                                PromoCodeView()
                            } label: {
                                AccountRow(title: "Coupon", icon: "a_promocode")
                            }
                            
                            
                        }
                        
                        VStack{
                         
                            NavigationLink {
                                AboutView()
                            } label: {
                                AccountRow(title: "About", icon: "a_about")
                            }
                            NavigationLink {
                                HelpView()
                            } label: {
                                AccountRow(title: "Help", icon: "a_help")
                            }
                        }
                        Button {
                            MainViewModel.shared.logout()
                        } label: {
                            ZStack {
                                Text("Log Out")
                                    .font(.customfont(.semibold, fontSize: 18))
                                    .foregroundColor(.primaryApp)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity)
                                        .padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.primaryApp, lineWidth: 1) // Adjust the line width as needed
                                        )
                                
                            
                            }
                           
                        }
                        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                        //.background( Color(hex: "F2F3F2"))
                        //.cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        
                    }
                    
                }
            }
            .padding(.bottom, .bottomInsets + 60)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        AccountView()
    }
    
}
