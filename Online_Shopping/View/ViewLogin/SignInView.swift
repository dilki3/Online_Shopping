//
//  SignInView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-12.
//

import SwiftUI

struct SignInView: View {
    
    @State var txtMobile: String = ""

    
    
    var body: some View {
        ZStack{
            
            Image("bottom_bg")
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Image("Signin_top")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenWidth)
                
                Spacer()
            }
            
            ScrollView{
                    
                VStack(alignment: .leading){
                    Text( "Get your Favorite Items with Shopix ")
                        .font(.customfont(.bold, fontSize: 30))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom , 25)
                    
                   
                    HStack{
                        NavigationLink {
                            LoginView()
                        } label: {
                            Text("Email Sign In")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                        .background( Color(hex: "F47E25 "))
                        .cornerRadius(20)
                        .padding(.bottom, 8 )
                        
                        
                        NavigationLink {
                            SignUpView()
                        } label: {
                            Text("Email Sign Up")
                                .font(.customfont(.semibold, fontSize: 18))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                        .background( Color.primaryApp)
                        .cornerRadius(20)
                        .padding(.bottom, 8 )
                        
                    }.padding(.top,25)
                    Divider()
                        .padding(.bottom, 25)
                
                    Text( "Or connect with social media")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.textTitle)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.bottom , 25)
                    
                    
                    Button {
                       
                    } label: {
                        
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Continue with Google")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                    .background( Color(hex: "#49D083 "))
                    .cornerRadius(20)
                    .padding(.bottom, 8 )
                    
                    
                    Button {
                       
                    } label: {
                        
                        Image("fb_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)

                        Text("Continue with Facebook")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                    .background( Color(hex: "4A66AC"))
                    .cornerRadius(20)
                    
                }
                .padding(.horizontal, 20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets +  .screenWidth * 0.6  )
                
            }
            
                
        }
        
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SignInView()
}
