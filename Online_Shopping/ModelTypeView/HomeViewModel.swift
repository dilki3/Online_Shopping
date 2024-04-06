//
//  HomeViewModel.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-14.
//



import SwiftUI

class HomeViewModel: ObservableObject
{
    static var shared: HomeViewModel = HomeViewModel()
    
    @Published var selectTab: Int = 0
    @Published var txtSearch: String = ""
    
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var offerArr: [ProductModel] = []
    @Published var newArr: [ProductModel] = []
    @Published var listArr: [ProductModel] = []
    @Published var typeArr: [TypeModel] = []
    
    
    init() {
        serviceCallList()
    }
    
    
    
    //MARK: ServiceCall
    
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Links.OS_HOME, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary {
                        self.offerArr = (payloadObj.value(forKey: "offer_list") as? NSArray ?? []).map({ obj in
                            
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        self.newArr = (payloadObj.value(forKey: "new_arrival_list") as? NSArray ?? []).map({ obj in
                            
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        self.listArr = (payloadObj.value(forKey: "list") as? NSArray ?? []).map({ obj in
                            
                            return ProductModel(dict: obj as? NSDictionary ?? [:])
                        })
                        
                        self.typeArr = (payloadObj.value(forKey: "type_list") as? NSArray ?? []).map({ obj in
                            
                            return TypeModel(dict: obj as? NSDictionary ?? [:])
                        })
                    }
                    
                    
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
                 offerArr.sort { $0.offerPrice ?? $0.price < $1.offerPrice ?? $0.price }
                 
             } else {
                 offerArr.sort { $0.offerPrice ?? $0.price > $1.offerPrice ?? $0.price}
                
             }
         }
        
    func filterByPriceNew(ascending: Bool) {
            if ascending {
                newArr.sort { $0.price < $1.price }
            } else {
                newArr.sort { $0.price > $1.price }
            }
        }
    
}

