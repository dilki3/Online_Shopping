//
//  AboutView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-29.
//

import SwiftUI


struct AboutView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
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
                    
                    Spacer()
                    
                    Text("About ShopiX")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 2)
                
                Spacer()
                
                Text(" Welcome to Shopix, your ultimate destination for all your shopping needs! At Shopix, we're committed to providing you with the best shopping experience, offering a wide range of products from top brands at competitive prices.Our app is designed with simplicity and convenience in mind, making it easy for you to browse and discover thousands of products across various categories such as electronics, fashion, home decor, beauty, and more. Whether you're looking for the latest tech gadgets, trendy fashion pieces, or stylish home essentials, Shopix has got you covered.With our user-friendly interface, you can easily navigate through different sections, explore product details, read reviews, and make secure purchases with just a few taps. Plus, our fast and reliable delivery service ensures that your orders reach you in no time")
                    .font(.customfont(.regular, fontSize: 16))
                    .foregroundColor(.primaryText)
                    .padding(.horizontal,25)
                    .padding(.bottom,290)
                
                Spacer()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    AboutView()
}
