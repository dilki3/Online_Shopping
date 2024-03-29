//
//  FavouriteRow.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-17.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavouriteRow: View {
    @State var fObj: ProductModel = ProductModel(dict: [:])
    var didAddCart: ( ()->() )?
    var body: some View {
        VStack{
            HStack(spacing: 10){
                WebImage(url: URL(string: fObj.image ))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 130, height: 100)
                VStack(spacing: 8){
                    Text(fObj.name)
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Text("\(fObj.brandName),brand")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    HStack(){
                        Text("Price: $\(fObj.offerPrice ?? fObj.price, specifier: "%.2f" )")
                            .font(.customfont(.semibold, fontSize: 18))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                       /*NavigationLink {
                            FavouriteProductDetailView(detailVM:  FavoriteDetailViewModel(prodfObj: fObj) )
                           
                        } label: {
                            
                            Image("next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .frame(minWidth: 0, alignment: .leading)
                            
                        }*/
                        
                       /* Button {
                            FavouriteProductDetailView(detailVM:  FavoriteDetailViewModel(prodfObj: fObj) )
                           
                        }label: {
                            Image("next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.purple) // Set the color of the image
                                .frame(minWidth: 0, alignment: .leading)
                        }*/
                        Button(action: {
                            // Action to perform when the button is tapped
                            // This can be empty if you just want to navigate
                            // to another view
                        }) {
                            NavigationLink(destination: FavouriteProductDetailView(detailVM: FavoriteDetailViewModel(prodfObj: fObj))) {
                                Image("next")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 15)
                                    .frame(minWidth: 0, alignment: .leading)
                            }
                        }
                        
                    }
                    .padding(.top,5)
                    //.padding(.bottom,5)
                   
                    
                    
                }
            
                
               
                
            }
            Divider()
        }
    }
}

#Preview {
    FavouriteRow(fObj: ProductModel(dict: ["prod_id": 1,
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
