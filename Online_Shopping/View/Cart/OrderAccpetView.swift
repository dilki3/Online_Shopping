//
//  OrderAccpetView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-21.
//

import SwiftUI

struct OrderAccpetView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var cartVM = CartViewModel.shared
    var body: some View {
        ZStack{
            
            VStack{
                Spacer()
                Image("order_accepted")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .screenWidth * 0.7)
                    .padding(.bottom, 32)
                
                Text("Your order has been \n accepted")
                    .multilineTextAlignment(.center)
                    .font(.customfont(.semibold, fontSize: 28))
                    .foregroundColor(.primaryText)
                    .padding(.bottom, 12)
                
                Text("Your items has been placcd and is on\nit’s way to being processed")
                    .multilineTextAlignment(.center)
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .padding(.bottom, 12)
                
                Spacer()
                Spacer()
                
                RoundButton(title: "Track Order") {
                    
                }
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Back to home")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.primaryApp)
                        .padding(.vertical, 15)
                }
                .padding(.bottom , .bottomInsets + 15)

            }
            .padding(.horizontal, 20)
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    OrderAccpetView()
}
