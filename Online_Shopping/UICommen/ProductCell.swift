//
//  ProductCell.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-14.
//

import SwiftUI
import  SDWebImageSwiftUI

struct ProductCell: View {
    @State var pObj: ProductModel = ProductModel(dict: [:])
    @State var width:Double = 180.0
    var didAddCart: ( ()->() )?
    var body: some View {
        NavigationLink {
            ProductDetailView(detailVM:  ProductDetailViewModel(prodObj: pObj) )
        } label: {
        VStack{
            WebImage(url: URL(string: pObj.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 140, height: 150)
            
            /*mage("pink")
                .resizable()
                .scaledToFit()
                .frame(width: 190, height: 190)*/
            Spacer()
            Text(pObj.name)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
            
            Text("\(pObj.brandName), Brand")
                .font(.customfont(.medium, fontSize: 14))
                .foregroundColor(.secondaryText)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
            Spacer()
            
            HStack{
                Text("$\(pObj.offerPrice ?? pObj.price, specifier: "%.2f")")
                    .font(.customfont(.bold, fontSize: 18))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
                Spacer()
                
                Button{
                    didAddCart?()
                }label: {
                    Image("add")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)

                }
                .frame(width:40, height: 40)
                .background(Color.primaryApp)
                .cornerRadius(15)
            }
            
                
            
        }
        .padding(12)
        .frame(width: width, height: 260)
        .overlay{
            RoundedRectangle(cornerRadius: 16)
                .stroke( Color.placeholder.opacity(0.5), lineWidth:1)
            
        }
        }
    }
        
}

#Preview {
    ProductCell(pObj: ProductModel(dict: ["prod_id": 1,
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
                                          "offer_price": 3.99,
                                          "image": "http://localhost:3001/img/product/20240316000149149pAvUiafNi1.jpeg",
                                          "start_date": "",
                                          "end_date": "",
                                          "is_offer_active": 0]))
}
