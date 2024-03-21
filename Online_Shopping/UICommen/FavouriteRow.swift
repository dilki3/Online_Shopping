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
                        Image("next")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .frame(minWidth: 0, alignment: .leading)
                        
                    
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
    FavouriteRow()
}
