//
//  ExploreView.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-13.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var explorVM = ExploreViewModel.shared
    @State var txtSearch: String = ""
    
    var colums = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Text("Find Products")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                    Spacer()
                }
                .padding(.top, .topInsets)
                
                SearchTextField(placholder: "Search Store", txt: $txtSearch)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 4)
                
                ScrollView {
                    LazyVGrid(columns: colums, spacing: 20) {
                        ForEach(explorVM.filteredListArr, id: \.id) { cObj in
                            NavigationLink(destination: ExploreItemsView(itemsVM: ExploreItemViewModel(catObj: cObj))) {
                                ExploreCategoryCell(cObj: cObj)
                                    .aspectRatio(2, contentMode: .fill)
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .padding(.bottom, .bottomInsets + 60)
            }
            .onChange(of: txtSearch) { _ in
                explorVM.txtSearch = txtSearch
                explorVM.filterList()
            }
        }
    }
}

#Preview {
    NavigationView{
        ExploreView()
    }
}
