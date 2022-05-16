//
//  Utils.swift
//  Case
//
//  Created by Salih Çakmak on 15.05.2022.
//

import Foundation

class Utils {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateformatter)
        
        return jsonDecoder
        
    }()
    
    static let dateformatter:DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        return dateFormatter
        
    }()
}
