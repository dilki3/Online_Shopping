//
//  ExploreViewModel.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-18.
//
import SwiftUI

class ExploreViewModel: ObservableObject {
    static var shared: ExploreViewModel = ExploreViewModel()
    
    @Published var txtSearch: String = ""
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ExploreCategoryModel] = []
    @Published var filteredListArr: [ExploreCategoryModel] = []
    
    init() {
        serviceCallList()
    }
    
    //MARK: ServiceCall
    func serviceCallList(){
        ServiceCall.post(parameter: [:], path: Globs.SV_EXPLORE_LIST, isToken: true ) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return ExploreCategoryModel(dict: obj as? NSDictionary ?? [:])
                    })
                 
                    self.filteredListArr = self.listArr
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
    
    // Function to filter the list based on search text
    func filterList() {
        if !txtSearch.isEmpty {
            filteredListArr = listArr.filter { $0.name.localizedCaseInsensitiveContains(txtSearch) }
        } else {
            filteredListArr = listArr
        }
    }
}

