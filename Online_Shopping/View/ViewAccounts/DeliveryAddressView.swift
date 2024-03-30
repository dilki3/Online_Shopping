//
//  DeliveryAddressView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-19.
//

import SwiftUI

struct DeliveryAddressView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    @State var isPicker: Bool = false
    var didSelect:( (_ obj: AddressModel) -> () )?
    
    var body: some View {
        ZStack{
            
            ScrollView{
                LazyVStack(spacing: 15) {
                    ForEach( addressVM.listArr , id: \.id, content: {
                        aObj in
                        
                        HStack(spacing: 15) {
                            VStack{
                                HStack {
                                    Text(aObj.name)
                                        .font(.customfont(.bold, fontSize: 16))
                                        .foregroundColor(Color(hex: "#8349D0"))
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    
                                    
                                  
                                }
                                
                                Text("\(aObj.address),\(aObj.city), \(aObj.state), \(aObj.postalCode) ")
                                    .font(.customfont(.medium, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                    .multilineTextAlignment( .leading)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text(aObj.phone)
                                    .font(.customfont(.bold, fontSize: 12))
                                    .foregroundColor(.secondaryText)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                            }
                            
                            VStack{
                                
                                Spacer()
                                
                                NavigationLink {
                                    AddDeliveryAddressView(isEdit: true, editObj: aObj  )
                                } label: {
                                    Image("editing")
                                        .resizable()
                                        .frame(width: 19 ,height: 19)
                                        .foregroundColor(.primaryApp)
                                }
                                .padding(.bottom, 15)
                                
                                
                                
                                Button {
                                    addressVM.serviceCallRemove(cObj: aObj)
                                } label: {
                                    Image("close")
                                        .resizable()
                                    
                                        .scaledToFit()
                                        .frame(width: 15, height: 15)
                                }
                                
                                Spacer()
                                
                            }
                        }

                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(5)
                        //.stroke(Color(hex: "#8349D0"), lineWidth: 1)
                        .shadow(color: Color(hex: "#8349D0").opacity(1), radius: 2)
                        .onTapGesture {
                            if(isPicker) {
                                mode.wrappedValue.dismiss()
                                didSelect?(aObj)
                            }
                        }


                    })
                }
                .padding(20)
                .padding(.top, .topInsets + 46)
                .padding(.bottom, .bottomInsets + 60)
        


            }
            
            VStack {
                    
                HStack{
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }

                    
                   
                    Spacer()
                    
                    Text("Delivery Address")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                    
                    
                    NavigationLink {
                        AddDeliveryAddressView()
                    } label: {
                        Image("add_temp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    .foregroundColor(.primaryText)
                    .padding(.bottom, 8)
                    
                    

                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2),  radius: 2 )
                
                Spacer()
                
            }
            
            
            
        }
        .onAppear{
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        DeliveryAddressView()
    }
    
}
