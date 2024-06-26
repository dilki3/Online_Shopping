//
//  ExploreItemViewModel.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-19.
//

import SwiftUI

class ExploreItemViewModel: ObservableObject
{
    @Published var cObj: ExploreCategoryModel = ExploreCategoryModel(dict: [:])
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ProductModel] = []
    
    
    init(catObj: ExploreCategoryModel) {
        self.cObj = catObj
        
        serviceCallList()
    }
    
    func serviceCallList(){
        ServiceCall.post(parameter: ["type_id": self.cObj.id ], path: Links.OS_EXPLORE_ITEMS_LIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        
                        return ProductModel(dict: obj as? NSDictionary ?? [:])
                    })
                }else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    func filterByPrice(ascending: Bool) {
            if ascending {
                listArr.sort { $0.price < $1.price }
            } else {
                listArr.sort { $0.price > $1.price }
            }
        }
    
}
