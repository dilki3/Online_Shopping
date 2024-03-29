//
//  WelcomeView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-12.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("welcome2")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Spacer()
                
                Image("shopify")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding(.bottom, 15)
                
                Text( "Welcome\nto our store")
                    .font(.customfont(.bold, fontSize: 48))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,5)
                
                Text( "Ger your clothing items in as fast as one hour")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                NavigationLink {
                    SignInView()
                } label: {
                    RoundButton(title: "Get Started") {
                    }
                }
                
                Spacer()
                    .frame(height: 80)
                
            }
            .padding(.horizontal , 20)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
        
    
}

#Preview {
    NavigationView {
        WelcomeView()
    }
}
