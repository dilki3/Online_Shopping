//
//  ExploreCategoryModel.swift
//  Online_Shopping
//
//  Created by Dila Dinesha on 2024-03-18.
//

import SwiftUI

struct ExploreCategoryModel: Identifiable, Equatable {
    
    var id: Int = 0
    var name: String = ""
    var image: String = ""
    var color: Color = Color.primaryApp
    
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "type_id") as? Int ?? 0
        self.name = dict.value(forKey: "type_name") as? String ?? ""
        self.image = dict.value(forKey: "image") as? String ?? ""
        self.color = Color(hex: dict.value(forKey: "color") as? String ?? "000000")
       
    }
    
    static func == (lhs: ExploreCategoryModel, rhs: ExploreCategoryModel) -> Bool {
        return lhs.id == rhs.id
    }
}

