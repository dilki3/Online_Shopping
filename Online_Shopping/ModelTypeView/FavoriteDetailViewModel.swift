//
//  FavoriteDetailViewModel.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-28.
//

import SwiftUI

class FavoriteDetailViewModel: ObservableObject {
    @Published var fObj: ProductModel = ProductModel(dict: [:])
    
    @Published var showError = false
    @Published var errorMessage = ""
    

    @Published var imageArr: [ImageModel] = []
    //size array
    
    
    @Published var isFav: Bool = false
    @Published var isShowDetail: Bool = false
    @Published var isShowSize: Bool = false
    @Published var isShowColors: Bool = false
    @Published var qty: Int = 1
    
    func showDetail(){
        isShowDetail = !isShowDetail
    }
    
    func showSize(){
        isShowSize = !isShowSize
    }
    func showColors(){
        isShowColors = !isShowColors
    }
    
    func addSubQTY(isAdd: Bool = true) {
        if(isAdd) {
            qty += 1
            if(qty > 99) {
                qty = 99
            }
        }else{
            qty -= 1
            if(qty < 1) {
                qty = 1
            }
        }
    }
    
    
    init(prodfObj: ProductModel) {
        self.fObj = prodfObj
        self.isFav = prodfObj.isFav
        serviceCallDetail()
    }
    
    //MARK: ServiceCall
    
    func serviceCallDetail(){
        ServiceCall.post(parameter: ["prod_id": self.fObj.prodId ], path: Links.OS_PRODUCT_DETAIL, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    if let payloadObj = response.value(forKey: KKey.payload) as? NSDictionary {
                        
                        
                        self.fObj = ProductModel(dict: payloadObj)
                        
                        //size array
                        self.imageArr = (payloadObj.value(forKey: "images") as? NSArray ?? []).map({ obj in
                            
                            return ImageModel(dict: obj as? NSDictionary ?? [:])
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
    
    func serviceCallAddRemoveFav(){
        ServiceCall.post(parameter: ["prod_id": self.fObj.prodId ], path: Links.OS_ADD_REMOVE_FAVORITE, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    
                    self.isFav = !self.isFav
                    HomeViewModel.shared.serviceCallList()
                   
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Done"
                    self.showError = true
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
}

