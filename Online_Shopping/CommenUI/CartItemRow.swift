//
//  CartItemRow.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-19.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItemRow: View {
    @State var cObj: CartItemModel = CartItemModel(dict: [:])
    
    
    var body: some View {
        VStack{
            HStack{
                WebImage(url: URL(string: cObj.image ))
                    .resizable()
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                 
            
                VStack(spacing: 4){
                    
                    HStack {
                        Text(cObj.name)
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            CartViewModel.shared.serviceCallRemove(cObj: cObj)
                        } label: {
                            Image("close")
                                .resizable()
                                .frame(width: 18, height: 18)
                        }

                    }
                   
                    
                    Text("\(cObj.brandName),brand")
                        .font(.customfont(.medium, fontSize: 13))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    
                    
                    HStack{
                        Button {
                            CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty - 1)
                        } label: {
                            
                            Image( "subtack"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(8)
                        }
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(  Color.placeholder.opacity(0.5), lineWidth: 1)
                        )
                        
                        Text( "\(cObj.qty)" )
                            .font(.customfont(.bold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 45, alignment: .center)
                            
                        
                        Button {
                            CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty + 1)
                        } label: {
                            
                            Image( "add_green"  )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(8)
                        }
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(  Color.placeholder.opacity(0.5), lineWidth: 1)
                        )
                        
                        Spacer()
                        
                        Text( "$\(  (cObj.offerPrice ?? cObj.price) * Double(cObj.qty) , specifier: "%.2f")"  )
                            .font(.customfont(.bold, fontSize: 20))
                            .foregroundColor(.primaryText)
                    }
                    
                }
                
                
                
            }
           
            Divider()
        }
       
       
        
    }
}

#Preview {
    CartItemRow(cObj: CartItemModel(dict: ["cart_id": 83,
                                           "user_id": 12,
                                           "prod_id": 9,
                                           "qty": 1,
                                           "cat_id": 7,
                                           "brand_id": 3,
                                           "type_id": 4,
                                           "name": "Men's Printed tee",
                                           "detail": "Our Mens Printed T-Shirt is soft, comfortable and classic looking and has a unique lazy jacks print. Made from 100% cotton.",
                                           "size": "L",
                                           "color": "Black",
                                           "price": 6.2,
                                           "created_date": "2024-03-16T08:44:34.000Z",
                                           "modify_date": "2024-03-16T08:44:34.000Z",
                                           "cat_name": "Men's Clothing",
                                           "is_fav": 1,
                                           "brand_name": "Marine",
                                           "type_name": "T-shirt",
                                           "offer_price": 6.2,
                                           "start_date": "",
                                           "end_date": "",
                                           "is_offer_active": 0,
                                           "image": "http://localhost:3001/img/product/202403171356495649evDlzdQyLO.jpeg",
                                           "item_price": 6.2,
                                           "total_price": 6.2]))
    .padding(.horizontal,20)
}
