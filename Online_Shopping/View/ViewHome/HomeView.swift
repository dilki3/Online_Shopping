//
//  HomeView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-14.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel.shared
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30,height: 30)
                                            HStack{
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                                            
                                            
                        Text("Colombo 1, Sri Lanka")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.darkGray)
                                               
                    }
                    SearchTextField(placholder: "Search Store", txt: $homeVM.txtSearch)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                       
                }
                .padding(.top, .topInsets)
                
                
                    Image("ULTIMATE ")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 115)             
                        .padding(.horizontal, 10)
            
           
                NavigationLink(destination: NewArrivalView()){
                    SectionTitleAll(title: "New Arrivals", titleAll: "See All") {
                        
                    }
                    .padding(.horizontal, 15)
                }
                
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHStack(spacing:15){
                        ForEach(homeVM.bestArr, id: \.id){
                            pObj in
                            
                            ProductCell(pObj:pObj, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                }
                            })
                        }
                    }
                    .padding(.horizontal,15)
                }
                
                NavigationLink(destination: OfferView()) {
                    SectionTitleAll(title: "Special Offers", titleAll: "See All") {
                        
                    }
                    .padding(.horizontal, 15)
                }
               // .padding(.horizontal, 15)
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHStack(spacing:15){
                        ForEach(homeVM.offerArr, id: \.id){
                            pObj in
                            
                            ProductCell(pObj:pObj, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                }
                            })
                        }
                    }
                    .padding(.horizontal,15)
                }
                //.padding(.bottom,5)
                NavigationLink(destination: FeaturedView()){
                    SectionTitleAll(title: "Featured", titleAll: "See All") {
                        
                    }
                    .padding(.horizontal, 15)
                }
                
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHStack(spacing:15){
                        
                        ForEach(homeVM.typeArr, id: \.id){
                            tObj in
                            
                            CategoryCell(tObj: tObj) {
                                
                            }
                        }
                        
                    }
                    .padding(.horizontal,15)
                }
                .padding(.bottom,15)
                
                ScrollView(.horizontal,showsIndicators: false){
                    LazyHStack(spacing:15){
                        ForEach(homeVM.listArr, id: \.id){
                            pObj in
                            
                            ProductCell(pObj:pObj, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                }
                            })
                        }
                    }
                    .padding(.horizontal,15)
                }
                .padding(.bottom,100)
            }
        }
        .alert(isPresented: $homeVM.showError, content: {
            Alert(title: Text(Links.AppName), message: Text(homeVM.errorMessage), dismissButton: .default(Text("OK")) )
        })
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
