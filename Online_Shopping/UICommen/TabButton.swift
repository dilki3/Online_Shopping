//
//  TabButton.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-13.
//

import SwiftUI

struct TabButton: View {
    
    @State var title: String = "Title"
    @State var icon: String = "store_tab"
    var isSelect: Bool = false
    var didSelect: (()->())
    
    var body: some View {
        Button {
            debugPrint("Tab Button Tap")
            didSelect()
        } label: {
            VStack{
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                
                Text(title)
                    .font(.customfont(.semibold, fontSize: 14))
                
                    
            }
        }
        .foregroundColor(isSelect ? .primaryApp : .primaryText )
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#Preview {
    TabButton {
        print("Test")
    }
}
