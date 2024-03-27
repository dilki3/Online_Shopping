//
//  FeaturedViewModel.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-25.
//

import SwiftUI

class FeaturedViewModel: ObservableObject
{
    static var shared: FeaturedViewModel = FeaturedViewModel()
    
    @Published var selectTab: Int = 0
    @Published var txtSearch: String = ""
    
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ProductModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    
    
    //MARK: ServiceCall
    
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_FEATURED, isToken: true ) { responseObj in
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
        
    func filterByPriceNew(ascending: Bool) {
            if ascending {
                listArr.sort { $0.price < $1.price }
            } else {
                listArr.sort { $0.price > $1.price }
            }
        }
    
}

