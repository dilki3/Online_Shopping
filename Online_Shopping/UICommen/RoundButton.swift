//
//  RoundButton.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-12.
//
import SwiftUI

struct RoundButton: View {
    @State var title: String = "Tittle"
    var didTap: (()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.semibold, fontSize: 18))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
        .background( Color(hex: "#8349D0"))
        .cornerRadius(20)
    }
}
#Preview {
    RoundButton()
        .padding(20)
}
