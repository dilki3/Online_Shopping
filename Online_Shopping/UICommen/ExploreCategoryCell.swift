//
//  ExploreCategoryCell.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-18.
//

import SwiftUI
import SDWebImageSwiftUI

struct ExploreCategoryCell: View {
    @State var cObj: ExploreCategoryModel = ExploreCategoryModel(dict: [ : ])
   
   
    
    var body: some View {
        VStack{
            /*WebImage(url: URL(string: cObj.image ))
                .resizable()
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 120, height: 90)*/
        
            Spacer()
            Text(cObj.name)
                .font(.customfont(.bold, fontSize: 20))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            
            Spacer()
            
        }
        .padding(15)
        .background( cObj.color.opacity(0.3) )
        .cornerRadius(16)
        .overlay (
            RoundedRectangle(cornerRadius: 16)
                .stroke(cObj.color, lineWidth: 2)
        )
    }}

#Preview {
    ExploreCategoryCell(cObj: ExploreCategoryModel (dict: [ "type_id": 4,
                                                            "type_name": "T-shirts",
                                                            "image": "http://localhost:3001/img/type/202403151625552555U1towqvQaX.jpeg",
                                                            "color": "49D083"]))
    .padding(20)
}
