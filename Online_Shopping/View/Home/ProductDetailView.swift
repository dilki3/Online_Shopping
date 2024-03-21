//
//  ProductDetailView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-16.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @StateObject var detailVM: ProductDetailViewModel = ProductDetailViewModel(prodObj: ProductModel(dict: [:]) )
    
    @State private var selectedSize = "M"
    let sizes = ["S", "M", "L", "XL", "XXL", "XXXL"]
    var body: some View {
        ZStack{
            
            ScrollView{
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(hex: "F2F2F2"))
                        .frame(width: .screenWidth, height: .screenWidth * 0.8)
                        .cornerRadius(20, corner: [.bottomLeft, .bottomRight])
                    
                    WebImage(url: URL(string: detailVM.pObj.image))
                        .resizable()
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width: .screenWidth * 0.8 , height: .screenWidth * 0.8)
                }
                .frame(width: .screenWidth, height: .screenWidth * 0.9)
                
                VStack{
                    HStack{
                        Text(detailVM.pObj.name)
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            detailVM.serviceCallAddRemoveFav()
                        } label: {
                            
                            Image( detailVM.isFav ? "favorite" : "fav"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .foregroundColor(Color.secondaryText)
                    }
                    Text("\(detailVM.pObj.brandName),Brand")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                    HStack{
                     
                        Button {
                            detailVM.addSubQTY(isAdd: false)
                        } label: {
                            
                            Image( "subtack")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        Text( "\(detailVM.qty)" )
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 45, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke( Color.placeholder.opacity(0.5), lineWidth: 1)
                            )
                        Button {
                            detailVM.addSubQTY(isAdd: true)
                        } label: {
                            
                            Image( "add_green")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        Spacer()
                        Text("$\((detailVM.pObj.offerPrice ?? detailVM.pObj.price) * Double(detailVM.qty), specifier: "%.2f")")
                            .font(.customfont(.bold, fontSize: 28))
                            .foregroundColor(.primaryText)
                        
                      
                    }
                    .padding(.vertical,8)
                    Divider()
                }
                .padding(.horizontal, 20)
               // .padding(.vertical, 20)
                
                VStack{
                    HStack{
                        Text("Product Detail")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            withAnimation {
                                detailVM.showDetail()
                            }
                            
                        } label: {
                            
                            Image( detailVM.isShowDetail ? "detail_open" : "next"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)

                    }
                    
                    if(detailVM.isShowDetail) {
                        Text(detailVM.pObj.detail)
                            .font(.customfont(.medium, fontSize: 14))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom , 8)
                    }
                    
                    
                    Divider()
                }
                .padding(.horizontal, 20)
                
                VStack{
                    HStack{
                        Text("Sizes")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            withAnimation {
                                detailVM.showSize()
                            }
                            
                        } label: {
                            
                            Image( detailVM.isShowSize ? "detail_open" : "next"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)

                    }
                    
                    if(detailVM.isShowSize) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(sizes, id: \.self) { size in
                                    Text(size)
                                        .font(.customfont(.bold, fontSize: 14))
                                        .foregroundColor(selectedSize == size ? .white : .primaryText)
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, 14)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .background(selectedSize == size ? Color(hex: "8349D0") : Color.clear)
                                        .cornerRadius(16)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(selectedSize == size ? Color(hex: "8349D0") : Color.gray.opacity(0.5), lineWidth: 1)
                                        )
                                        .onTapGesture {
                                            selectedSize = size
                                        }
                                }
                            }
                            .padding(.bottom,8)
                           
                        }
                    }
                    
                    
                    Divider()
                }
                .padding(.horizontal, 20)
                
                VStack{
                    HStack{
                        Text("Colors")
                            .font(.customfont(.semibold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            withAnimation {
                                detailVM.showColors()
                            }
                            
                        } label: {
                            
                            Image( detailVM.isShowColors ? "detail_open" : "next"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(15)
                        }
                        .foregroundColor(Color.primaryText)

                    }
                    if(detailVM.isShowColors) {
                        ScrollView(.horizontal, showsIndicators: false) {
                                           HStack(spacing: 10) {
                                               Circle()
                                                .fill(Color.pink)
                                              .frame(width: 30, height: 30)
                                               Circle()
                                                .fill(Color.blue)
                                              .frame(width: 30, height: 30)
                                               Circle()
                                                   .fill(Color.black)
                                              .frame(width: 30, height: 30)
                                               Circle()
                                                   .fill(Color(detailVM.pObj.color))
                                              .frame(width: 30, height: 30)
                                                 
                                           }
                                           .padding(.bottom,8)
                        }
                    
                    }
                    Divider()
                }
                .padding(.horizontal, 20)
        
                
                HStack{
                    Text("Reviews")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    HStack(spacing :2){
                        
                        ForEach(1...5, id: \.self) {index in
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.orange)
                                .frame(width: 15 , height:15 )
                        }
                    }
                  
                    Button {
                        
                        
                    } label: {
                        
                        Image( "next"  )
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .padding(15)
                    }
                    .foregroundColor(Color.primaryText)

                }
                .padding(.horizontal, 20)
                RoundButton(title: "Add to Cart"){
                    CartViewModel.serviceCallAddToCart(prodId: detailVM.pObj.prodId, qty: detailVM.qty) { isDone, msg  in
                        
                        detailVM.qty = 1
                        
                        self.detailVM.errorMessage = msg
                        self.detailVM.showError = true
                    }
                    
                }
                .padding(20)
                    
                
            }
            VStack {
                
                HStack{
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Spacer()
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        //Image("share")
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                                        .foregroundColor(.black)
                            .frame(width: 30, height: 30)
                    }

                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $detailVM.showError, content: {
            
            Alert(title: Text(Globs.AppName), message: Text(detailVM.errorMessage)  , dismissButton: .default(Text("Ok"))  )
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    ProductDetailView(detailVM: ProductDetailViewModel(prodObj: ProductModel(dict: [
        
        "prod_id": 1,
                "cat_id": 8,
                "brand_id": 4,
                "type_id": 5,
                "name": "Ladie's Pink T-Shirt",
                "detail": "Women T Shirt",
                "size": "M",
                "color": "Pink",
                "price": 3.99,
                "created_date": "2024-03-15T16:48:13.000Z",
                "modify_date": "2024-03-15T16:48:13.000Z",
                "cat_name": "Women's Clothing",
                "is_fav": 0,
                "brand_name": "Crimson",
                "type_name": "Shirts",
                "offer_price": 10,
                "image": "http://localhost:3001/img/product/20240316000149149pAvUiafNi1.jpeg",
                "start_date": "2024-03-01 00:00:00",
                "end_date": "2024-04-14 00:00:00",
                "is_offer_active": 1
    
    ])))
}
