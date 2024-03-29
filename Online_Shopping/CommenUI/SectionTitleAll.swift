//
//  SectionTitleAll.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-13.
//

import SwiftUI

struct SectionTitleAll: View {
    @State var title: String = " Title"
    @State var titleAll: String = "View All"
    var didTap : (()->())?
    
    var body: some View {
        
        HStack{
            Text(title)
                .font(.customfont(.semibold, fontSize: 24))
                .foregroundColor(.primaryText)
            
            Spacer()
            
            Text(titleAll)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.primaryApp)
            
        }
        .frame(height: 40)
    }
}

#Preview {
    SectionTitleAll()
        .padding(20)
}
