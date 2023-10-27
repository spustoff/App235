//
//  DateConvert_ext.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI

extension Date {
    
    func convertDate(format: String) -> String {
        
        let date = self
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
}
