//
//  RowModel.swift
//  Case
//
//  Created by Salih Çakmak on 15.05.2022.
//

import Foundation
import SwiftUI


struct ROW : Identifiable {
    
    var id = UUID()
    var image : String
    var title : String
    var description : String
}

let  rowData : [ROW]  = [
    
    ROW(image: "imdb2", title: "ABS WORKOUT 1", description: " ABS AND CHEST WORKOUT"),
    ROW(image: "imdb2", title: "ABS WORKOUT 2", description: " ABS AND CHEST WORKOUT 2")
    
]
