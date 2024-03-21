//
//  CategoryCell.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-14.
//

import SwiftUI
 import SDWebImageSwiftUI

struct CategoryCell: View {
    @State var tObj: TypeModel = TypeModel(dict: [:])
    @State var color:Color=Color.white
    var didAddCart: ( ()->() )?
    var body: some View {
        HStack{
    
            Text(tObj.name)
                .font(.customfont(.bold, fontSize: 18))
                .foregroundColor(.primaryText)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .center)
            
           
                
            
        }
        .padding(15)
        .frame(width: 200, height: 50)
        .background(tObj.color.opacity(0.3))
        .cornerRadius(10)
    }
}

#Preview {
    CategoryCell(tObj: TypeModel(dict: [ "type_id": 4,
                                         "type_name": "T-shirts",
                                         "image": "http://localhost:3001/img/type/202403151625552555U1towqvQaX.jpeg",
                                         "color": "49D083"]))
}
